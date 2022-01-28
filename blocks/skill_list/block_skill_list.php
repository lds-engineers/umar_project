<?php

class block_skill_list extends block_base {
  public function init() {
    $this->title = get_string('skill_list', 'block_skill_list');
  }

   function has_config(){
      return true;
  }
   // The PHP tag and the curly bracket for the class definition 
   // will only be closed after there is another function added in the next section.

  function enroll($courseid, $userid, $roleid) {
    global $CFG, $DB, $USER, $PAGE;
    $enrollmentID = $DB->get_record_sql("SELECT * FROM {enrol} WHERE enrol = 'manual' AND courseid = $courseid");
    if(!empty($enrollmentID->id)) {
      if (!$DB->record_exists('user_enrolments', array('enrolid'=>$enrollmentID->id, 'userid'=>$userid))) {
        $userenrol = new stdClass();
        $userenrol->status = 0;
        $userenrol->userid = $userid;
        $userenrol->enrolid = $enrollmentID->id;
        $userenrol->timestart  = time();
        $userenrol->timeend = 0;
        $userenrol->modifierid  = 2;
        $userenrol->timecreated  = time();
        $userenrol->timemodified  = time();

        $enrol_manual = enrol_get_plugin('manual');
        $enrol_manual->enrol_user($enrollmentID, $userid, $roleid, $userenrol->timestart, $userenrol->timeend);
        //add_to_log($courseid, 'course', 'enrol', '../enrol/users.php?id='.$courseid, $courseid, $userid); //there should be userid somewhere!
      }
    }
  }
  public function userskill($skillid){
    global $DB,$USER,$CFG;
    $sql="SELECT * FROM {user_proficiency_level} WHERE userid=? AND type=? AND skill_id=?";
    $data=$DB->get_record_sql($sql,array($USER->id,'skill',$skillid));
    if(!empty($data)){
      return $data;
    }
    $std=new stdClass();
    $std->userid=$USER->id;
    $std->type='skill';
    $std->skill_id=$skillid;
    $std->proficiency_id=2;
    $std->point=0;
    $std->createddate=time();
    $DB->insert_record("user_proficiency_level",$std);
    return $std;
  }
  public function get_usergoal(){
    global $DB,$USER,$CFG;
    $sql="SELECT * FROM {usergoal} WHERE userid=?";
    $data=$DB->get_record_sql($sql,array($USER->id));
    return $data;
  }
  public function get_weekly_data(){
    global $DB,$USER;
    $monday = strtotime("last monday");

$monday = date('w', $monday)==date('w') ? $monday+7*86400 : $monday;

$sunday = strtotime(date("Y-m-d",$monday)." +6 days");
$data_arr=array();
for ($i = $monday; $i <= $sunday;) {
      $nextday = strtotime("+1 day", $i);
   // echo $nextday;

      $sql="SELECT COALESCE(sum(duration),0) as totaltime FROM {attendanceregister_session} WHERE login BETWEEN ? AND ? AND userid=? ";
      $data=$DB->get_record_sql($sql,array($i,($nextday-1),$USER->id));
      //echo "<pre>";
      //echo date("l", $i). " - " . date("d m Y h:i:s A", $i)." - ".date("d m Y h:i:s A", $nextday-1)."<br>";
      //print_r($data);
      //echo "</pre>";

      $seconds=$data->totaltime;
      $secs = $seconds % 60;
      $hrs = $seconds / 60;
      $mins = $hrs % 60;
      $hrs = $hrs / 60;
      array_push($data_arr,(int)$hrs.'.'.(int)$mins);
      $i = $nextday;

    }
    return $data_arr;

  }
  public function get_total_weekly_data(){

     global $DB,$USER;
    $monday = strtotime("last monday");

$monday = date('w', $monday)==date('w') ? $monday+7*86400 : $monday;

$sunday = strtotime(date("Y-m-d",$monday)." +6 days");
//$data_arr=array();
$total=0;
for ($i = $monday; $i <= $sunday;) {
      $nextday = strtotime("+1 day", $i);
   // echo $nextday;

      $sql="SELECT COALESCE(sum(duration),0) as totaltime FROM {attendanceregister_session} WHERE login BETWEEN ? AND ? AND userid=? ";
      $data=$DB->get_record_sql($sql,array($i,($nextday-1),$USER->id));
      $total=$total+$data->totaltime;
      
      $i = $nextday;

    }

     $seconds=$total;
      $secs = $seconds % 60;
      $hrs = $seconds / 60;
      $mins = $hrs % 60;
      $hrs = $hrs / 60;
    return (int)$hrs.'.'.(int)$mins;


  }
  private function get_max_values(){
    $max=4;
    $get_weekly_data=max($this->get_weekly_data());
    $get_usergoal=$this->get_usergoal();
    if(!empty($get_usergoal)){
      $userdata=$get_usergoal->day_hours;
      if($get_weekly_data>$userdata){
        $max=$get_weekly_data;
      }else{
        $max=$userdata;
      }
    }else{
      $userdata=0;
    }
    
    return $max;
  }
  public function get_content() {
    global $CFG, $DB, $USER, $PAGE;
    $id = optional_param('id', $USER->id, PARAM_INT); 
    if ($this->content !== null) {
        return $this->content;
    }

    if(!empty($this->get_usergoal())){
     
      $goaldata=$this->get_usergoal();
       $total_goal_time=$goaldata->week_hours;
      $usergoal_data=' <div class="d-flex align-items-center mt-2">
            <div class="text-center fw-bold">
                <span style="color: #4abef7;">Courses</span>
                <div class="skill_box2">'.$goaldata->no_of_course.'</div>
            </div>
             <div class="text-center fw-bold">
                <span style="color: #4abef7;">Day</span>
                <div class="skill_box2">'.$goaldata->day_hours.':00</div>
            </div>
            <div class="text-center fw-bold">
                <span style="color: #4abef7;">Week</span>
                <div class="skill_box2">'.$goaldata->week_hours.':00</div>
            </div>
           
            <div class="text-center fw-bold">
                <span style="color: #4abef7;">Set Goal</span>
                <a href="'.$CFG->wwwroot.'/blocks/skill_list/set_weekly_goals.php" title="Set Goals"><div class="skill_primary_box2"><i class="fa fa-pencil-square-o text-white "aria-hidden="true"></i></div></a>
            </div>
        </div>';

    }else{
      $total_goal_time=56;
      $usergoal_data='<a href="'.$CFG->wwwroot.'/blocks/skill_list/set_weekly_goals.php" class="btn_sty">Set Weekly Goal</a>';
    }
    $weekly_data=$this->get_weekly_data();
    $get_total_weekly_hour=$this->get_total_weekly_data();
    
    $get_max_values=self::get_max_values();
    
    $siklls = $DB->get_records_sql("SELECT DISTINCT {assign_skill}.skill_id,{assign_skill}.skill_proficiency_label,{assign_skill}.skill_weightage_id,{skill}.id,{skill}.skill  FROM {skill} INNER JOIN {assign_skill} ON {skill}.id = {assign_skill}.skill_id WHERE {assign_skill}.user_id ='".$id."'");
    $this->content =  new stdClass;
    $htmlbody = '
      <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
  <script type="text/javascript">
    google.charts.load("current", {packages:["corechart"]});
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ["Element", "Hour", { role: "style" } ],
       
        ["Mon", '.$weekly_data[0].', "#6a4cff"],
        ["Tue", '.$weekly_data[1].', "#6a4cff"],
        ["Wed",'.$weekly_data[2].', "color: #6a4cff"],
        ["Thu", '.$weekly_data[3].', "color: #6a4cff"],
        ["Fri", '.$weekly_data[4].', "color: #6a4cff"],
        ["Sat", '.$weekly_data[5].', "color: #6a4cff"],
        ["Sun", '.$weekly_data[6].', "#6a4cff"]
      ]);

      var view = new google.visualization.DataView(data);
      view.setColumns([0, 1,
                       { calc: "stringify",
                         sourceColumn: 1,
                         type: "string",
                         role: "annotation" },
                       2]);

      var options = {
        title: "Weekly Goal Chart",
        width: 400,
        height: 200,
        bar: {groupWidth: "95%"},
        legend: { position: "none" },
         backgroundColor: "#343a40",
          legendTextStyle: { color: "#FFF" },
          titleTextStyle: { color: "#FFF" },
          hAxis: {
    textStyle:{color: "#FFF"}
},
  vAxis: {
    textStyle:{color: "#FFF"},
     minValue: 0,

   
    maxValue:'.$get_max_values.'

}
      };
      var chart = new google.visualization.ColumnChart(document.getElementById("columnchart_values"));
      chart.draw(view, options);


        var data2 = google.visualization.arrayToDataTable([
          ["Total Hour", ""],
          ["Total Hour",    '.$total_goal_time.'],
          ["Spent Hour",'.$get_total_weekly_hour.'],

        ]);

        var options2 = {
          title: "Total Weekly Reports",
           backgroundColor: "#343a40",
          legendTextStyle: { color: "#FFF" },
          titleTextStyle: { color: "#FFF" },
          hAxis: {
          color:"#FFF",
          },
           colors: ["#6a4cff", "#4abef7",]

        };

        var chart = new google.visualization.PieChart(document.getElementById("piechart"));

        chart.draw(data2, options2);
  }

 

  </script>
    <div class="container">
                    <div class="card-body my_skill_body">
                      <div class="row">
                        <div class="col-sm-6">
                          <div class="progressbar">
                            <div id="piechart"></div>
                          </div>
                         
                        </div>
                        <div class="col-sm-6 resposive_mt_20">
                          <div class="graph">
                           <div id="columnchart_values" style=""></div>
                          </div>
                         
                        </div>
                      </div> 
                    </div>
                    <div class="card-body my_skill_body mobile-text-center resposive_mt_20 ">
                      <div class="row ">
                          <div class="col-sm-6">
                             <h3 class="my_skill text-white">My Skills</h3>
                          </div>
                          <div class="col-sm-6  flex-center">
                           '.$usergoal_data.'
                          </div>
                        </div>
                      </div>
                      <div class="card-body my_skill_body">';
                      foreach ($siklls as $value) {
                        $countSubSkill = 0;
                        $sumOfPoint = 0;
                        
                        $subskills = $DB->get_records_sql("SELECT * FROM {sub_skill} where skill_id = $value->skill_id");
                         $subSkillId = count($subskills);
                        foreach ($subskills as $subskill) {
                          $subskills = $DB->get_record_sql("SELECT * FROM {user_proficiency_level} where  userid = $USER->id AND type = 'subskill' AND skill_id = $subskill->id");
                           if(count($subskills)>0){
                              $countSubSkill++;
                              $sumOfPoint = $sumOfPoint + $subskills->point;
                           }
                        }
                           $avg = $sumOfPoint/$countSubSkill;
                             
                              $youwidth ='';
                              if($avg >= 40 && $avg <= 60){
                                 $youwidth="w-25";
                              }elseif($avg >= 60 && $avg <=80){
                                 $youwidth="w-50";
                              }elseif($avg >= 80 && $avg <= 100){
                                 $youwidth="w-75";
                              }elseif($avg >= 100 ){
                                 $youwidth="w-100";
                              }

                             // echo $avg."average<br><br>";
                        $user_skill_data=$this->userskill($value->skill_id);

                        $cours_id = $DB->get_record_sql("SELECT {skill_weightage}.default_course FROM {skill_weightage} where {skill_weightage}.id = $value->skill_weightage_id");
                       

                        $quizs = $DB->get_records_sql("SELECT sub_skill_id, quiz_id FROM {skill_quiz_mapping} WHERE course_id = $cours_id->default_course AND skill_id = $value->skill_id");

                        $total_quiz = count($quizs);
                       
                        $this->enroll($cours_id->default_course,$id,5); // call enroll default course
                          
                        $pro = array();
                        $sub_skill_id = array();
                        $pro_id = array();
                        $sum = 0;
                        $quiz_completed=0;
                        $sumOfGrade = 0;
                        $avg = 0;
                        foreach($quizs as $quiz){
                          $quiz_attempt_sql="SELECT * FROM {quiz_attempts} WHERE userid=? AND quiz=? AND state=?";
                          $quiz_attempt_data=$DB->get_record_sql($quiz_attempt_sql,array($USER->id,$quiz->quiz_id,'finished'));
                           if($quiz_attempt_data){
                              $quiz_completed++;

                            // For Get user level
                              $grades = $DB->get_record_sql("SELECT * FROM {quiz_grades} WHERE quiz =? AND userid =?",array($quiz->quiz_id,$USER->id));
                              $quize_grades = round($grades->grade,2);
                              $quiz_grade_value = ($quize_grades*10);
                              $proficiency_level_data = $DB->get_records_sql("SELECT * FROM {proficiency_level}");
                                 foreach($proficiency_level_data as $proficiency_level_list){

                                     if($quiz_grade_value <= $proficiency_level_list->maximum_range){
                                     
                                      $user_proficiency_sub_skill_sql="SELECT * FROM {user_proficiency_level} WHERE type=? AND skill_id=? AND userid=?";//sub_skill_id
                                      $user_proficiency_sub_skill_data=$DB->get_record_sql($user_proficiency_sub_skill_sql,array("subskill",$quiz->sub_skill_id,$USER->id));
                                      if(empty($user_proficiency_sub_skill_data)){
                                          $subkill_obj=new stdClass();
                                          $subkill_obj->userid=$USER->id;
                                          $subkill_obj->skill_id=$quiz->sub_skill_id;
                                          $subkill_obj->proficiency_id = $proficiency_level_list->id;
                                          $subkill_obj->point=$quiz_grade_value;
                                          $subkill_obj->createddate=time();
                                          $subkill_obj->type="subskill";
                                          $DB->insert_record("user_proficiency_level",$subkill_obj);
                                      }
                                       break;
                                    }
                                 }
                                
                              }        
                           }

                         
                        switch ($user_skill_data->proficiency_id) {
                           case 2:
                            $course_lavel_v = "Awareness";
                            $width="w-25";
                            break;
                          case 3:
                            $course_lavel_v = "Knowledge";
                            $width="w-50";
                            break;
                          case 4:
                            $course_lavel_v = "Skilled";
                            $width="w-75";
                            break;
                          case 5:
                            $course_lavel_v = "Mastery";
                            $width="w-100";
                            break;
                          default:
                            break;
                          }   

                           // $course_lavel_v = "Knowledge";
                            $skill_prof_lab = $value->skill_proficiency_label;
                            $a = "Awareness";
                            $k = "Knowledge";
                            $s = "Skilled";
                            $m = "Mastery";
                            $skill_with = '';
                            $profi_rec_id = '';


                             // For you are here lavel
                           /*  if($course_lavel_v == $a){
                              $width="w-25";
                             }elseif($course_lavel_v == $k){
                               $width="w-50";
                             }elseif($course_lavel_v == $s){
                               $width="w-75";
                             }elseif($course_lavel_v == $m){
                              $width="w-100";
                             }
                            */


                           // For reqired level
                            if($skill_prof_lab == $a){
                              $skill_with = 'w-25';
                              $profi_rec_id = 2;

                            }elseif($skill_prof_lab == $k){
                               $skill_with = "w-50";
                               $profi_rec_id = 3;
                            }elseif($skill_prof_lab == $s){
                              $skill_with = "w-75";
                              $profi_rec_id = 4;

                               
                             }elseif($skill_prof_lab == $m){
                              $skill_with= "w-100";
                              $profi_rec_id = 5;
                            }
                            $pro_diff = 0;
                            foreach($combined_array as $key => $com_id){
                              $pro_diff = $profi_rec_id - $com_id;
                              if($pro_diff <= 0 || $pro_diff == 1){
                                $course_id_sub_skill = $DB->get_record_sql("SELECT DISTINCT course_id FROM {assign_course_sub_skill} WHERE sub_skill_id = $key AND proficiency_id = $com_id");
                                if ($course_id_sub_skill->course_id) {
                                    //$this->enroll($course_id_sub_skill->course_id,$id,5); // call enroll sub skill to course
                                }
                              }elseif ($pro_diff > 0) {
                                if ($pro_diff == 2) {
                                  if($com_id == 2){
                                    $ids = '2,3';
                                  }elseif($com_id == 3){
                                    $ids = '3,4';
                                  }elseif($com_id == 4){
                                    $ids = '4';
                                  }
                                }elseif($pro_diff == 3){
                                  if($com_id == 2){
                                    $ids = '2,3,4';
                                  }
                                }
                                $course_id_sub_skill = $DB->get_record_sql("SELECT DISTINCT course_id FROM {assign_course_sub_skill} WHERE sub_skill_id = $key AND proficiency_id IN (".$ids.")");
                                if ($course_id_sub_skill->course_id) {
                                      //$this->enroll($course_id_sub_skill->course_id,$id,5); // call enroll sub skill to course
                                }
                              }
                           }
                           //echo  $avg."average<br><br>";

                           if($total_quiz==$quiz_completed && $subSkillId==$countSubSkill){
                             
                              $text_url=$CFG->wwwroot.'/blocks/skill_list/skilling_path.php?skill_id='.$value->skill_id;
                              $text_name="View Skilling Path";
                              $youAreHere = 'You are here';
                              $icon ='<i class="fa fa-caret-up" aria-hidden="true"></i>';
                              $display = "display:block";

                            }else{
                              $text_url=$CFG->wwwroot.'/course/view.php?id='.$cours_id->default_course;
                              $text_name="Access Skills";
                              $youAreHere = '';
                              $icon = '';
                              $display = "display:none";
                            }
                            $htmlbody .='<div class="skill_box mobile-text-center">
                                         <div class="row header ">
                                            <div class="col-sm-4 skilltext" ><h5>'.$value->skill.' </h5>
                                            </div>

                                            <div class="col-sm-5 skilltext" ><h5></h5>
                                            </div> 
                                            <div class="text_button col-sm-3">
                                               <a href='.$text_url.' class="btn_sty">'.$text_name.'</a>
                                            </div>
                                         </div>
                                  
                                 <div class="content">
                                  <div style="'.$display.'">
                                    <div class="d-flex aglin-items-center resposive_mt_20"> ';
                                    
                           $htmlbody .='<div class="A text-white '.$skill_with.' text-right ">
                                          <div class="align-top">
                                             <span class="text-white text-center font-size-08"> Requied </span>
                                          </div>
                                          <div class="flex-end">
                                             <i class="fa fa-caret-down text-white" aria-hidden="true"></i>
                                          </div>
                                       </div>';
                        $htmlbody .='</div>

                                    <div class="progress" style="height:23px;">
                                       <div class="progress-bar" role="progressbar" id="a" data-id="'.$value->skill_proficiency_label.'" style="width:25%;background:#0f6fc5;padding-top: 6px;">
                                        Awareness <label id="a"> </label>
                                       </div>

                                       <div class="progress-bar" role="progressbar" data-id="'.$value->skill_proficiency_label.'" style="width:25%;background:#379cf7;padding-top: 6px;">
                                        Knowledge <label id="k"> </label>
                                       </div>

                                       <div class="progress-bar" role="progressbar" data-id="'.$value->skill_proficiency_label.'" style="width:25%;background:#57b0ff;padding-top: 6px;">
                                        Skilled <label id="s"> </label>
                                       </div>

                                       <div class="progress-bar" role="progressbar" data-id="'.$value->skill_proficiency_label.'" style="width:25%;background:#8dc4f5;padding-top: 6px;">
                                        Mastery <label id="m"> </label>
                                       </div>
                                    </div>

                                    <div class="d-flex aglin-items-center">
                                       <div class="A text-white '.$youwidth.' text-right ">
                                          <div class="flex-end">
                                             '.$icon.'
                                          </div>
                                          <div class="align-top">
                                             <span class="text-white text-center font-size-08">'.$youAreHere.'</span>
                                          </div>
                                       </div> 
                                    </div>
                                    <div class="progress-t">
                                       <span>Progress Completed</span>
                                    </div>
                                    <div class="progress c-progress">
                                       <div class="progress-bar progress-bar-info custom-progressbar" role="progressbar" aria-valuenow="'.$user_skill_data->point.'" aria-valuemin="0" aria-valuemax="100" style="width:'.$user_skill_data->point.'%">        
                                       </div>
                                    </div>
                                    <span style="color:#fff;">'.$user_skill_data->point.'%</span>
                                    <div class="dddd">
                                          <div class="improve_btn">
                                       <div class=""><a class="btn_sty improve" href="'.$text_url.'">'.$text_name.'</a></div>
                                    </div>
                                    <div class="improve_btn">
                                       <div class="text_button"><a class="btn_sty improve" href="#">Start Course</a>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                       
                      
                           <br>'; 
                          }
                          $htmlbody  .=    '</div>
                            </div><script src="https://use.fontawesome.com/47886b77a3.js"></script>
                            <style type="text/css">
                              /*5a4fd5*/
                              .container .content {
                                display: none;
                                padding : 5px;
                               }
                               .text{
                                float: left;
                               }
                               .text_button{
                                float: right;
                               }
                               
                               .my_skill_body{
                                  background: #343a40;
                               }

                               .btn_sty{
                                  background: none;
                                  border-radius: 30px;
                                  padding: 8px;
                                  border-color: purple;
                                 /* border: 2px solid #c87ec8;*/
                                 border: 2px solid #5a4fd5;
                                  color: white;
                                  width: 442px;
                                  padding: 10px 30px;
                               }
                               .btn_sty:hover{
                                  color: white;
                                  text-decoration: none;
                               }
                               .skill_box{
                                  border: 1px solid gray;
                                  padding: 30px;
                                  cursor: pointer;
                               }

                               .my_skill{
                                  padding-left: 24px;
                               }
                               .progressbar{
                                  float: left;
                                  color: white;

                               }
                               .progressbar_text{
                                  float: left;
                                  color: white;
                                  padding-left: 10px;
                               }
                               .graph{
                                  float: left;
                                  color: white;

                               }
                               .graph_text{
                                  float: left;
                                  color: white;
                                  padding-left: 10px;
                               }
                               .progress{
                                  height: 23px;

                               }
                            .skilltext{
                               color: white;
                            }

                            .improve_btn{
                            padding: 35px 0px;
                            }
                            .progress-t{
                               padding-top:10px ;
                               padding-bottom: 10px;
                            }
                            .progress-t span{
                               color: #fff;
                            }
                            .c-progress{
                               border-radius: 10px;
                            }
                            .custom-progressbar{
                               background-color: #5a4fd5 !important;
                               border-radius: 10px
                            }
                            .dddd{
                               display: flex;
                            align-items: center;
                            justify-content: space-between;

                            }
                            </style>

                            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

                            <script type="text/javascript">
                                $(document).ready(function(){

                                    $(".header").click(function () {
                                        $header = $(this);
                                        $content = $header.next();
                                       
                                        $content.slideToggle(500, function () {
                                            
                                        });
                                    });
                                })
                                
                            </script>';
      $this->content->text = $htmlbody;
      $this->content->footer = '';
      return $this->content;
    }
}