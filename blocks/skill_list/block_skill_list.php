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

  private function usersubskill_data($skillid){
    global $DB,$USER;
    $countSubSkill = 0;
    $sumOfPoint = 0;
    $subskills = $DB->get_records_sql("SELECT * FROM {sub_skill} where skill_id =?",array($skillid));
    $subskilltotal = count($subskills);
    foreach ($subskills as $subskill) {//'subskill'//'subskill'
      $proficiency_value = $DB->get_record_sql("SELECT * FROM {user_proficiency_level} where userid=? AND type =? AND skill_id=? ",array($USER->id,'subskill',$subskill->id));
     
      if(!empty($proficiency_value)){
        $countSubSkill++;
        $sumOfPoint = $sumOfPoint+$proficiency_value->after_atempt_point;
        }
      }
      $youwidth ='';
      if($subskilltotal==$countSubSkill AND $countSubSkill!=0){
        $avg = $sumOfPoint/$countSubSkill;
        if($avg >=0 && $avg <= 40){
          $youwidth="w-25";
        }elseif($avg >= 41 && $avg <=60){
          $youwidth="w-50";
        }elseif($avg >=61 && $avg <= 80){
          $youwidth="w-75";
        }elseif($avg >=81){
         $youwidth="w-100";
        }
      }
      return array("total_sub_skill"=>$subskilltotal,'total_user_get_quiz_subskill'=>$countSubSkill,'youwidth'=>$youwidth,'sumOfPoint'=>$sumOfPoint); 
      

  }
  //userstart course
  public function user_start_course($skillid){
    global $DB,$USER;
   // $subskill_data=$DB->get_records_sql("SELECT * FROM {sub_skill} WHERE skill_id=?",array($skillid));
    $assign_skill_data=$DB->get_record_sql("SELECT * FROM {assign_skill} WHERE user_id=? AND skill_id=? ",array($USER->id,$skillid));
    $skill_weightage_id=$assign_skill_data->skill_weightage_id;
    $weightage_meta_data=$DB->get_records_sql("SELECT * FROM {skill_weightage_meta} WHERE skill_id=? AND skill_weightage_id=?",array($skillid,$skill_weightage_id));
    $course_arr=array(-1);
    foreach($weightage_meta_data as $meta_list){
      $user_pro_data=$DB->get_record_sql("SELECT * FROM {user_proficiency_level} WHERE skill_id=? AND type=? AND userid=?",array($meta_list->sub_skill_id,'subskill',$USER->id));
      $user_pro_id=$user_pro_data->proficiency_id;
      $user_pro_id_after_attempt=$user_pro_data->after_atempt_proficiency;
      $required_pro=$meta_list->sub_skill_proficiency;
      if($user_pro_id<$required_pro){

        for($i=$user_pro_id+1;$i<=$user_pro_id_after_attempt+1;$i++){
            $course_data=$DB->get_records_sql("SELECT * FROM {assign_course_sub_skill} WHERE sub_skill_id=? AND proficiency_id=?",array($meta_list->sub_skill_id,$i));
           if(!empty($course_data)){
              foreach($course_data as $course_list){
                array_push($course_arr,$course_list->course_id);
              }
           }
        }
      }

    }
    $courses_id=implode(',',$course_arr);
    $log_data=$DB->get_record_sql("SELECT * FROM {logstore_standard_log} WHERE userid=? AND courseid IN(".$courses_id.") ORDER BY id DESC LIMIT 0,1",array($USER->id));
  
   if(!empty($log_data)){

    return $log_data->courseid;
   }else{

    return $course_arr[1];
   }
   

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
                <span class="set_goals_head">Courses</span>
                <div class="skill_box2">'.$goaldata->no_of_course.'</div>
            </div>
             <div class="text-center fw-bold">
                <span class="set_goals_head">Day</span>
                <div class="skill_box2">'.$goaldata->day_hours.':00</div>
            </div>
            <div class="text-center fw-bold">
                <span class="set_goals_head">Week</span>
                <div class="skill_box2">'.$goaldata->week_hours.':00</div>
            </div>
           
            <div class="text-center fw-bold">
                <span class="set_goals_head">Set Goal</span>
                <a href="'.$CFG->wwwroot.'/blocks/skill_list/set_weekly_goals.php" title="Set Goals"><div class="skill_primary_box2"><i class="fa fa-pencil-square-o text-white "aria-hidden="true"></i></div></a>
            </div>
        </div>';

    }else{
      $total_goal_time=56;
      $usergoal_data='<a href="'.$CFG->wwwroot.'/blocks/skill_list/set_weekly_goals.php" class="btn_sty btn">Set Weekly Goal</a>';
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
        width: 350,
        height: 200,
        bar: {groupWidth: "80%"},
        legend: { position: "none" },
         backgroundColor: "transparent",
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
           backgroundColor: "transparent",
          legendTextStyle: { color: "#FFF" },
          titleTextStyle: { color: "#FFF" },
          width: "100%",
          height: "100%",
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
                    <div class="card-body charts_bg">
                      <div class="row set-alignment">
                        <div class="col-sm-6">
                          <div class="progressbar">
                            <div id="piechart"></div>
                          </div>
                        </div>
                        <div class="col-sm-6 resposive_mt_20 flex_end">
                          <div class="graph">
                           <div id="columnchart_values" style=""></div>
                          </div>
                        </div>
                        <div>
                                <div class=" flex-center text-right pr-50">
                                   '.$usergoal_data.'
                                </div>
                          </div>
                      </div> 
                    </div>
                    <div class="card-body my_skill_body mobile-text-center resposive_mt_20 ">
                      <div class="">
                          <div class="">
                             <h3 class="my_skill text-white m-0 pt-3">My Skills</h3>
                          </div>
                          
                        </div>
                      </div>
                      <div class="card-body my_skill_body">';
                      foreach ($siklls as $value) {
                       
                             
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
                                          $subkill_obj->after_atempt_proficiency = $proficiency_level_list->id;
                                          $subkill_obj->after_atempt_point=$quiz_grade_value;

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
                                     
                                }
                              }
                           }
                           //echo  $avg."average<br><br>";
                           $usersubskill_data=self::usersubskill_data($value->skill_id);//array("total_sub_skill"=>$subskilltotal,'total_user_get_quiz_subskill'=>$countSubSkill,'youwidth'=>$youwidth);
                           $youwidth=$usersubskill_data['youwidth'];

                           if($usersubskill_data['total_sub_skill']==$usersubskill_data['total_user_get_quiz_subskill']){
                            $start_course_id=self::user_start_course($value->skill_id);
                            $start_course_url=$CFG->wwwroot.'/course/view.php?id='.$start_course_id;
                            $text_url=$CFG->wwwroot.'/blocks/skill_list/skilling_path.php?skill_id='.$value->skill_id;
                              $text_name="View Skilling Path";
                              $text_name2="";
                              $youAreHere = 'You are here';
                              $icon ='<i class="fa fa-caret-up" aria-hidden="true"></i>';
                              $display = "display:block";
                               $display2 = "display:none";
                               $display3 = "display:block";

                            }else{
                              $text_url=$CFG->wwwroot.'/course/view.php?id='.$cours_id->default_course;
                              $text_name="";
                               $text_name2="Assess Skills";
                              $youAreHere = '';
                              $icon = '';
                              $display = "display:none";
                              $display2 = "display:block";
                               $display3 = "display:none";
                               $start_course_url='#';

                            }
                            $htmlbody .='<div class="skill_box mobile-text-center">
                                         <div class="dddd header  header_box22">
                                            <div class=" skilltext" ><p>'.$value->skill.' </p>
                                            </div>

                                            <!--<div class="col-sm-5 skilltext" ><h5></h5>
                                            // </div> -->
                                            <div class=" ">
                                            <div class="text_button" style="'.$display2.'">
                                               <a href='.$text_url.' class="btn_sty btn">'.$text_name2.'</a>
                                               
                                               </div>
                                               <a  style="'.$display3.'" href="javascript:void(0);"class="expend_skills"><i class="fa fa-chevron-circle-up" aria-hidden="true"></i></a>
                                            </div>
                                         </div>
                                  
                                 <div class="content" data-id="true" style="'.$display.'">
                                  <div style="'.$display.'">
                                    <div class="d-flex aglin-items-center resposive_mt_20"> ';
                                    
                           $htmlbody .='<div class="A text-white '.$skill_with.' text-right ">
                                          <div class="align-top">
                                             <span class="text-white text-center font-size-08"> Required </span>
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

                                       <div class="progress-bar" role="progressbar" data-id="'.$value->skill_proficiency_label.'" style="width:25%;background:#425f7a;padding-top: 6px;">
                                        Skilled <label id="s"> </label>
                                       </div>

                                       <div class="progress-bar" role="progressbar" data-id="'.$value->skill_proficiency_label.'" style="width:25%;background:#5a4f92;padding-top: 6px;">
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
                                       <div class=""><a class="btn_sty improve btn" href="'.$text_url.'">'.$text_name.'</a></div>
                                    </div>
                                    <div class="improve_btn">
                                       <div class="text_button"><a class="btn_sty btn improve" href="'.$start_course_url.'">Start Course</a>
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
                              .set-alignment{
                                justify-content: flex-end;
                              }
                              .pr-50{
                                padding-right: 50px;
                              }

                             
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
                                  border-radius: 0px;
                               }
                               .expend_skills{
                                float: right;
                                font-size: 20px;
                               }

                               .btn_sty{
                                  background: none;
                                  border-radius: 30px;
                                  padding: 8px;
                                  border-color: purple;
                                 border: 2px solid #5a4fd5;
                                  color: white;
                                  padding: 10px 30px;
                               }
                               .btn_sty:hover{
                                  color: white;
                                  text-decoration: none;
                               }

				                        .set_goals_head{
				                        	color: #4abef7;
				                        }

                               

                               .skill_box{
                                  border: 1px solid gray;
                                  padding: 20px;
                                  cursor: pointer;
                               }

                               /*.my_skill{
                                  padding-left: 24px;
                               }*/
                               .progressbar{
                                  float: left;
                                  color: white;

                               }

                               #piechart{
                               position: absolute;
                                 left: -6px;
                             }

                             #columnchart_values{
                                  margin-top: 0px;
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
                                  height: 10px;

                               }
                            .skilltext{
                               color: white;
                            }

                            .improve_btn{
                            padding: 20px 0px;
                            }
                            .progress-t{
                               padding-top:10px ;
                               padding-bottom: 5px;
                            }
                            .progress-t span{
                               color: #fff;
                            }
                            .c-progress{
                               border-radius: 10px;
                               margin-bottom: 5px;
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

                            .flex_end{
                              display: flex;
                              align-items: center;
                              justify-content: flex-end;
                            }

                            .charts_bg{
                              background: #343a40;
                            }

                            .skilltext p{
                                margin: 0px;
                            }


                            @media(max-width: 568px){
                              .btn_sty{
                                padding: 5px !important;
                                font-size:11px;
                              }
                             .set_goals_head{
				                        	font-size: 11px;
				                      }
                              .header_box22{
                                flex-wrap: nowrap;
                              }

                            
                              [aria-label="A chart."]{
                                left: -54px !important; 
                              }

                              .flex_end{
                                display: block;
                              }
                            
                              #columnchart_values{
                              margin-top: 150px;
                            }
                            .set-alignment{
                              justify-content: center;
                          }

                          .pr-50{
                            padding-right: 0px;
                          }
                        }

                            


                            </style>

                            <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

                            <script type="text/javascript">
                                $(document).ready(function(){


                                  $(".header_box22").on("click",function(){
                                   
                                    var data_id=$(this).parent().children(".content").attr("data-id");
                                  var $this=$(this);

                                    if(data_id=="true"){
                                     $this.find("i").removeClass("fa-chevron-circle-up");
                                      $this.find("i").addClass("fa-chevron-circle-down");
                                      $(this).parent().children(".content").attr("data-id","false");
          
                                  }else{
                                    $(this).parent().children(".content").attr("data-id","true");
                                    $this.find("i").removeClass("fa-chevron-circle-down");
                                    $this.find("i").addClass("fa-chevron-circle-up");
           
                                  }
                               });

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