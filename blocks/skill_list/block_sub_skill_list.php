
<?php 
    require_once('../../config.php');
    require_once($CFG->dirroot.'/course/renderer.php');
    
     echo $OUTPUT->header();
     global $CFG, $DB, $USER, $PAGE;
     $user_id = optional_param('id', $USER->id, PARAM_INT); 
      $id=required_param('skill_id',PARAM_INT);
     if ($USER->id) {
        // code...
     }
require_once('style_css.php');
 ?>




<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script type="text/javascript">
    // $(document).ready(function(){
    //      $(".header").click(function () {
    //         $header = $(this);
    //         $content = $header.next();
    //         $content.slideToggle(500, function () {
    //         });
    //     });
    // });
  function progressBarfun(progressVal,totalPercentageVal,class1,class2,class3,class4) {
   
   /*var strokeVal = (4.64 * 100) /  totalPercentageVal;
   var x = document.querySelector('.progress-circle-prog');
    x.style.strokeDasharray = progressVal * (strokeVal) + ' 999';
   var el = document.querySelector('.progress-text'); 
   var from = $('.progress-text').data('progress');
   $('.progress-text').data('progress', progressVal);
   var start = new Date().getTime();*/

   var strokeVal = (4.64 * 100) /  totalPercentageVal;
   var x = document.querySelector('.'+class1);
    x.style.strokeDasharray = progressVal * (strokeVal) + ' 999';
   var el = document.querySelector('.'+class2); 
   var from = $('.'+class2).data(class3);
   $('.'+class2).data(class3, progressVal);
   $('.'+class2).data(class3, progressVal);
   $v = (100-progressVal);

   $('.'+class4).append($v+'%');
   var start = new Date().getTime();

   setTimeout(function() {
       var now = (new Date().getTime()) - start;
       var progress = now / 700;
       el.innerHTML = progressVal / totalPercentageVal * 100 + '%';
       if (progress < 1) setTimeout(arguments.callee, 10);
   }, 10);



}
</script>

      <div class="container">
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
               
            </div>
         </div>

         <div class="card-body my_skill_body">
            <?php 
                 /// $id = $_GET['skill_id'];

                    $cours_id = $DB->get_record_sql("SELECT DISTINCT {skill_weightage}.default_course FROM {skill_weightage} where {skill_weightage}.skill_id = $id");
                 /*   echo "<pre>";
                    print_r($cours_id);
                    echo "</pre>";*/

                     $quizs = $DB->get_records_sql("SELECT sub_skill_id, quiz_id FROM {skill_quiz_mapping} WHERE course_id = $cours_id->default_course AND skill_id = $id");
                    


                     $sub_skill_id = array();
                     $profi_lvls = array();
                     foreach($quizs as $quiz){

                        $grades = $DB->get_record_sql("SELECT * FROM {quiz_grades} WHERE quiz = $quiz->quiz_id AND userid = $user_id ");
     
                        if(count($grades)>0){

                           $quize_grades = round($grades->grade,2);

                           $quiz_grade_value = ($quize_grades*10);

                           $quiz_marks = $DB->get_records_sql("SELECT * FROM {quiz_marks}");

                           $sub_skill_id[] = $quiz->sub_skill_id;
                           foreach($quiz_marks as $quiz_mark){

                              if($quiz_mark->marks >= $quiz_grade_value ){

                                 $proficiency_levels = $DB->get_record_sql("SELECT * FROM {proficiency_level} WHERE id = $quiz_mark->proficiency_level_id");

                                 $profi_lvls[] = $proficiency_levels->proficiency_level;
                                
                                 break;
                              }
                           }
                        } 
                     }
                  $profi_lvl = array_combine($sub_skill_id,$profi_lvls);
                  $sub_skills_ids = $DB->get_records_sql("SELECT * from {sub_skill}  where skill_id = $id");
               



                  foreach ($sub_skills_ids as $key => $sub_skills_id) {
                     $class1 = 'prc'.$key;
                     $class2 = 'pt'.$key;
                     $class3 = 'p'.$key;
                     $class4 = 'r'.$key;
                     $avg = 0;
                    
                                       ?>
                     <div class="position-relative main_block"> 
                        <div class="box">
                           <h3 class="text-white header" id=" "><?=$sub_skills_id->sub_skills?></h3>
                           <div class="card-body">
                              <div class="row">
                                 <div class="col-sm-6 position-relative">
                                    <div class="progress <?php echo $class3;?>">
                                       <svg class="progress-circle" xmlns="http://www.w3.org/2000/svg">
                                          <circle class="progress-circle-back"cx="80" cy="80" r="74"></circle>
                                          <circle class="progress-circle-prog <?php echo $class1;?>" cx="80" cy="80" r="74"></circle>
                                       </svg>
                                         <div class="progress-text <?php echo $class2;?>" data-progress="0">0%</div>
                                    </div> 
                                    <div class="t_position">
                                      <p class="text-white"><span class="<?php echo $class4;?>"> </span> &nbsp;remaning <br> to upgrade next level </p>  
                                    </div>
                                 </div>
                                 <div class="col-sm-6">
                                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRhrTii_hg1J_KW9s035VmYZMdqUi4cM_mVVtdV6on9vEPrJzOpkoOh32qJZ1JTHHc9nd8&usqp=CAU" height="200px">
                                 </div>
                                 <div class="col-sm-12">
                                    <div class="row p_top">
                                       <div class="col-sm-12 col-lg-12">
                                          <h3 class="text-white header"><a href="skilling_path.php?subskill_id=<?=$sub_skills_id->id; ?>&level=<?=$profi_lvl[$key]; ?>">Skilling Path </a> </h3>

                                          <div class="col-sm-12 col-lg-12">
                                             <ul class="steps">
                                                <?php 
                                                   if($profi_lvl[$key] == 'Awareness'){
                                                      $profi_id = 2;
                                                   }elseif ($profi_lvl[$key] == 'Knowledge') {
                                                      $profi_id = 3;
                                                   } elseif ($profi_lvl[$key] == 'Skilled') {
                                                      $profi_id = 4;
                                                   }elseif ($profi_lvl[$key] == 'Mastery') {
                                                      $profi_id = 5;
                                                   }
                                                    // get course id by sub_skill_id and profiency id  

                                                   $course_id_by_sub_skill_id = $DB->get_records_sql("SELECT DISTINCT course_id FROM {assign_course_sub_skill} WHERE sub_skill_id = $sub_skills_id->id AND proficiency_id = $profi_id ");
                                                  
                                                   if(count($course_id_by_sub_skill_id)){
                                                       $i=1;
                                                      foreach ($course_id_by_sub_skill_id as $value) {
                                                        // get course name by course id
                                                         $sum = 0;
                                                         $course = $DB->get_record_sql("SELECT * FROM {course} WHERE id = $value->course_id ");
                                                            $chelper = new \coursecat_helper();
                                                            $courseobj = new \core_course_list_element($course);
                                                            $completion = new \completion_info($course);
                                                               // First, let's make sure completion is enabled.
                                                               if ($completion->is_enabled()) {
                                                                   $percentage = \core_completion\progress::get_course_progress_percentage($course, $user_id);

                                                                   if (!is_null($percentage)) {
                                                                       $percentage = floor($percentage);
                                                                   }

                                                                   if (is_null($percentage)) {
                                                                       $percentage = 0;
                                                                   }
                                                               }
                                                                  
                                                         $no = count($course_id_by_sub_skill_id);
                                                         if($i == 1){
                                                            $step = 'active';
                                                         }else{
                                                             $step = 'inactive';
                                                         } ?>
                                                         <li class="step step--incomplete step--<?php echo $step;?>">
                                                               <span class="step__icon"></span>
                                                               <a href="course_details.php">
                                                                  <span class="step__label"><?=$course->fullname?>
                                                                  </span>
                                                               </a>
                                                         </li>
                                                         <?php $i++; 
                                                      } 
                                                         $sum = $sum + $percentage;
                                                         $avg = ($sum/$no); 

                                                         if($avg == 0){
                                                            $learning = 'Start Learning';
                                                         } else{
                                                            $learning = 'Continue Learning';
                                                         }
                                                   }  ?>
                                             </ul>
                                          </div>
                                       </div>
                                    </div>
                                 </div>
                                 <div class="col-sm-12">
                                    <label class="text-white header">Level</label> 
                                    <div class="space-between">
                                       <div class="improve_btn">
                                          <a class="btn_sty improve " href="block_sub_skill_list"><?=$profi_lvl[$key]?></a>
                                       </div>
                                       <div class="improve_btn">
                                          <a class="btn_sty" href="course_details.php"><?=$learning?></a>
                                       </div>
                                    </div>
                                 </div>
                              </div>
                           </div>
                        </div>
                     </div>
                     <br/><br/>
                    <?php 
                     echo "<script> progressBarfun({$avg},100,'{$class1}','{$class2}','{$class3}','{$class4}');</script>";
                  } ?>
               </div>
            </div>
         <?php
   echo $OUTPUT->footer();?>
<script type="text/javascript">

// secod progressBar

$('.steps').on('click', '.step--active', function() {
  $(this).removeClass('step--incomplete').addClass('step--complete');
  $(this).removeClass('step--active').addClass('step--inactive');
  $(this).next().removeClass('step--inactive').addClass('step--active');
});

$('.steps').on('click', '.step--complete', function() {
  $(this).removeClass('step--complete').addClass('step--incomplete');
  $(this).removeClass('step--inactive').addClass('step--active');
  $(this).nextAll().removeClass('step--complete').addClass('step--incomplete');
  $(this).nextAll().removeClass('step--active').addClass('step--inactive');
});

</script>

