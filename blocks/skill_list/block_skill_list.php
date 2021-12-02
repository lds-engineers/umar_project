
<script src="https://use.fontawesome.com/47886b77a3.js"></script>

<style type="text/css">
  
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
      border: 2px solid #c87ec8;
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
    
</script>
<?php
class block_skill_list extends block_base {
   public function init() {
      // $this->title = get_string('skill_list', 'block_skill_list');
   }
   // The PHP tag and the curly bracket for the class definition 
   // will only be closed after there is another function added in the next section.

    function enroll($courseid, $userid, $roleid) {
     global $CFG, $DB, $USER, $PAGE;
        $enrollmentID = $DB->get_record_sql("SELECT * FROM {enrol} WHERE enrol = 'manual' AND courseid = $courseid");
        /*  print_r($enrollmentID); 
          die;*/
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
               add_to_log($courseid, 'course', 'enrol', '../enrol/users.php?id='.$courseid, $courseid, $userid); //there should be userid somewhere!
              
           }
         }
      }
   public function get_content() {
   global $CFG, $DB, $USER, $PAGE;
   $id = optional_param('id', $USER->id, PARAM_INT); 


      if ($this->content !== null) {
          return $this->content;
      }
       $siklls = $DB->get_records_sql("SELECT DISTINCT {assign_skill}.skill_id,{assign_skill}.skill_proficiency_label,{skill}.id,{skill}.skill  FROM {skill} INNER JOIN {assign_skill} ON {skill}.id = {assign_skill}.skill_id WHERE {assign_skill}.user_id ='".$id."'");
       // echo "<pre>";
       // print_r($siklls);


      
      $this->content =  new stdClass;
   
      $htmlbody   = '<div class="container">
                        <div class="card-body my_skill_body">
                           <div class="row">
                              <div class="col-sm-6">
                                 <div class="progressbar">
                                   <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRthuL703AV9RF1QEy3Q4zySyQBrinKSOk6Ow&usqp=CAU" width="150px">
                                 </div>
                                 <div class="progressbar_text">
                                    <p><b>151hrs</b></p>
                                    <p>Spent for learning</p>
                                 </div>
                              </div>
                              <div class="col-sm-6">
                                 <div class="graph">
                                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcZk2saoiqfBJfwq7AsiwgJocHyVL03Nur1dEKdPfUV1a3XCDtHMYVlaWi41JQr7mAyQc&usqp=CAU" width="150px">
                                 </div>
                                 <div class="graph_text">
                                    <p><b>45hrs</b></p>
                                    <p>This week</p>
                                 </div>
                              </div>
                           </div> 
                        </div>
                         <div class="card-body my_skill_body">
                           <div class="row">
                          
                              <div class="col-sm-6">
                                 <h3 class="my_skill text-white">My Skills</h3>
                              </div>
                              <div class="col-sm-6">
                                 <a href="#" class="btn_sty">Set Weekly Goal</a>
                              </div>
                           </div>
                        </div>

                        <div class="card-body my_skill_body">';
                           foreach ($siklls as $value) {
                              
                              $cours_id = $DB->get_record_sql("SELECT DISTINCT {skill_weightage}.default_course FROM {skill_weightage} where {skill_weightage}.skill_id = $value->id");

                              $course_lavel = $DB->get_record_sql("SELECT skill_proficiency_label FROM {course_skill} WHERE course_id = $cours_id->default_course AND skill_id = $value->id");



                              $this->enroll($cours_id->default_course,$id,5); 

                              $quizs = $DB->get_records_sql("SELECT id FROM {quiz} WHERE course = $cours_id->default_course");
                              // echo "<pre>";
                              // print_r($quizs);
                              $pro = array();
                              $sum = 0;
                              foreach($quizs as $quiz){

                                 $grades = $DB->get_record_sql("SELECT * FROM {quiz_grades} WHERE quiz = $quiz->id AND userid = $id ");

                                 if( count($grades)>0){

                                    $quize_grades = round($grades->grade,2)."<br><br>";

                                    $quiz_grade_value = ($quize_grades*10);

                                    $quiz_marks = $DB->get_records_sql("SELECT * FROM {quiz_marks}");

                                 
                                    foreach($quiz_marks as $quiz_mark){

                                       if($quiz_mark->marks >= $quiz_grade_value ){

                                          $proficiency_levels = $DB->get_record_sql("SELECT * FROM {proficiency_level} WHERE id = $quiz_mark->proficiency_level_id");

                                          $pro[] = $proficiency_levels->proficiency_level;

                                          $sum = $sum + $quiz_mark->marks;

                                          echo $proficiency_levels->proficiency_level."<br><br>";
                                          break;
                                       }
                                    }
                                 }
                              }
                              ?>
                             <div>
                              <?php
                              echo $sum;
                               echo "<pre>";
                               print_r($pro);

                               $avg = $sum/3;
                               if($avg == 40){
                                 $course_lavel_v = "Awareness";
                               }if($avg == 60){
                                 $course_lavel_v = "Knowledge";
                               }if($avg == 80){
                                 $course_lavel_v = "Skilled";
                               }if($avg == 100){
                                 $course_lavel_v = "Mastery";
                               }

                               echo "==========================";
                               ?>
                            </div>
 

                             <?php


                             // $course_lavel_v = "Knowledge";
                              $skill_prof_lab = $value->skill_proficiency_label;
                            
                             $a= "Awareness";
                             $k = "Knowledge";
                             $s = "Skilled";
                             $m = "Mastery";
                             $width ='';
                             $skill_with = '';

                             if($course_lavel_v == $a){
                              $width="w-25";
                             }elseif($course_lavel_v == $k){
                               $width="w-50";
                             }elseif($course_lavel_v == $s){
                               $width="w-75";
                             }elseif($course_lavel_v == $m){
                              $width="w-100";
                             }

                           if($skill_prof_lab == $a){
                              $skill_with = 'w-25';

                             }elseif($skill_prof_lab == $k){
                               $skill_with="w-50";
                             
                             }elseif($skill_prof_lab == $s){
                               $skill_with="w-75";
                               
                             }elseif($skill_prof_lab == $m){
                              $skill_with="w-100";
                          
                             }

                                     
      $htmlbody .=            '<div class="skill_box">
                                 <div class="row header">
                                    <div class="col-sm-4 skilltext" ><h5>'.$value->skill.' </h5>
                                    </div>

                                    <div class="col-sm-5 skilltext" ><h5></h5>
                                    </div> 
                                    <div class="text_button col-sm-3">
                                       <a href='.$CFG->wwwroot.'/course/view.php?id='.$cours_id->default_course.' class="btn_sty">Access Skills</a>
                                    </div>
                                 </div>
                                  
                                 <div class="content">

                                    <div class="d-flex aglin-items-center abcd">';
                                    
                        $htmlbody .= '<div class="A text-white '.$skill_with.' text-right ">
                                          <div>
                                             <span class="text-white text-center"> Requied </span>
                                          </div>
                                          <div>
                                             <i class="fa fa-caret-down text-white" aria-hidden="true"></i>
                                          </div>
                                       </div>';

                        
                      $htmlbody .=  '</div>

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

                                       <div class="progress-bar" role="progressbar" data-id="'.$value->skill_proficiency_label.'" style="width:25%;background:#5caaf0;padding-top: 6px;">
                                        Mastery <label id="m"> </label>
                                       </div>
                                    </div>

                                    <div class="d-flex aglin-items-center">
                                       <div class="A text-white '.$width.' text-right ">
                                          <div>
                                             <i class="fa fa-caret-up" aria-hidden="true"></i>
                                          </div>

                                          <div>
                                             <span class="text-white text-center">You are here</span>
                                          </div>
                                       </div> 
                                    </div>

                                    <div class="improve_btn">
                                       <div class="text_button"><a class="btn_sty improve" href="'.$CFG->wwwroot.'/blocks/skill_list/block_sub_skill_list.php">Improve Skills</a></div>
                                    </div>
                                 </div>
                              </div>
                              <br>
                             '; 
                            }
      $htmlbody   .=    '</div>
                     </div>';  
       
      $this->content->text = $htmlbody;

      $this->content->footer = '';
     
        return $this->content;
    }
}
?>
<script type="text/javascript">
   $(document).ready(function(){



   });
</script>