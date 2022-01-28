
    <?php 
        require_once('../../config.php');
        require_login();

        $skill_id=required_param('skill_id',PARAM_INT);
        $PAGE->requires->jquery();
        $PAGE->set_url('/blocks/skill_list/skilling_path.php', array('skill_id' => $skill_id));
        $PAGE->set_title('View Skilling Path');
        $PAGE->set_heading('User Skilling Path');
         echo $OUTPUT->header();
         global $CFG,$USER,$DB;

function getcourse_image($courseid) {
    global $DB, $CFG;
    $imageurl= "https://mumsatthetable.com/wp-content/uploads/2021/05/no-image-220x220.jpg";
    require_once($CFG->dirroot. '/course/classes/list_element.php');
    $course = $DB->get_record('course', array('id' => $courseid));
    $course = new core_course_list_element($course);
    foreach ($course->get_course_overviewfiles() as $file) {
        $isimage = $file->is_valid_image();
        $imageurl = file_encode_url("$CFG->wwwroot/pluginfile.php", '/'. $file->get_contextid(). '/'. $file->get_component(). '/'. $file->get_filearea(). $file->get_filepath(). $file->get_filename(), !$isimage);
        return $imageurl;
    }
    return $imageurl;
}

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
         $skill_sql="SELECT ask.skill_id,ask.skill_proficiency_label,ask.skill_weightage_id,sk.skill FROM {assign_skill} ask JOIN {skill} sk ON sk.id=ask.skill_id WHERE ask.user_id=? AND ask.skill_id=? ";
         $skill_data=$DB->get_record_sql($skill_sql,array($USER->id,$skill_id));
         echo "skill_weightage_id:".$skill_data->skill_weightage_id;
       
        
         $required_skill_id="";
         $proficiency_level_sql1="SELECT * FROM {proficiency_level}";
         $proficiency_level_data1=$DB->get_records_sql($proficiency_level_sql1);
         foreach($proficiency_level_data1 as $proficiency_level_list1){
            if($proficiency_level_list1->proficiency_level==$skill_data->skill_proficiency_label){
                $required_skill_id=$proficiency_level_list1->id;
            }

         }

         
         if(empty($skill_data)){
            redirect($CFG->wwwroot,"You enter wrong skilled id in url. ",null, \core\output\notification::NOTIFY_ERROR);
         }
         $skill_name=$skill_data->skill;
         $user_proficiency_sql="SELECT * FROM {user_proficiency_level} WHERE userid=? AND type=? AND skill_id=?";
         $user_proficiency_data=$DB->get_record_sql($user_proficiency_sql,array($USER->id,'skill',$skill_id));
         if(empty($user_proficiency_data)){
            $user_pro_obj=new stdClass();
            $user_pro_obj->userid=$USER->id;
            $user_pro_obj->type='skill';
            $user_pro_obj->proficiency_id=2;
            $user_pro_obj->createddate=time();
            $user_pro_obj->skill_id=$skill_id;
            $DB->insert_record("user_proficiency_level",$user_pro_obj);
         }
          $default_course_id = $DB->get_record_sql("SELECT  {skill_weightage}.default_course FROM {skill_weightage} where {skill_weightage}.id =?",array($skill_data->skill_weightage_id));
          /*echo "<pre>";
          print_r($default_course_id);
          echo "</pre>";*/
          $sub_skill_quizes = $DB->get_records_sql("SELECT sub_skill_id, quiz_id FROM {skill_quiz_mapping} WHERE course_id =? AND skill_id = ?",array($default_course_id->default_course,$skill_id));
      

           foreach($sub_skill_quizes as $quiz){
        
                      //sub_skill_quizes
                        $grades = $DB->get_record_sql("SELECT * FROM {quiz_grades} WHERE quiz =? AND userid =?",array($quiz->quiz_id,$USER->id));
     
                        if(count($grades)>0){

                           $quize_grades = round($grades->grade,2);

                           $quiz_grade_value = ($quize_grades*10);

                           $proficiency_level_data = $DB->get_records_sql("SELECT * FROM {proficiency_level}");

                           foreach($proficiency_level_data as $proficiency_level_list){

                              if($quiz_grade_value<=$proficiency_level_list->maximum_range){
                               
                                $user_proficiency_sub_skill_sql="SELECT * FROM {user_proficiency_level} WHERE type=? AND skill_id=? AND userid=?";//sub_skill_id
                                $user_proficiency_sub_skill_data=$DB->get_record_sql($user_proficiency_sub_skill_sql,array("subskill",$quiz->sub_skill_id,$USER->id));
                                if(empty($user_proficiency_sub_skill_data)){
                                    $subkill_obj=new stdClass();
                                    $subkill_obj->userid=$USER->id;
                                    $subkill_obj->skill_id=$quiz->sub_skill_id;
                                    $subkill_obj->proficiency_id=$proficiency_level_list->id;
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

                  

         ?>


        <div class="container skilling_path">
            <div>
            <div>
                <p class="skills_heading">
                    Skilling path for <span><?php echo $skill_name; ?></span>
                </p>
            </div>
            <?php
            $total_row=0;
            $total_completion_row=0;
                foreach($sub_skill_quizes as $subkill_lists){
                    /*echo "<pre>";
                    print_r($subkill_lists);
                    echo "</pre>";
                  */
                   
                    $user_sub_pro_l_sql="SELECT * FROM {user_proficiency_level} WHERE skill_id=? AND type=? AND userid=?";
                    $user_sub_pro_l_data=$DB->get_record_sql($user_sub_pro_l_sql,array($subkill_lists->sub_skill_id,'subskill',$USER->id));


                    $skill_weightage_meta_sql="SELECT * FROM {skill_weightage_meta} WHERE skill_id=? AND skill_weightage_id=? AND sub_skill_id=?";
                    $skill_weightage_meta_data=$DB->get_record_sql($skill_weightage_meta_sql,array($skill_id,$skill_data->skill_weightage_id,$subkill_lists->sub_skill_id));
                   /* echo "<pre>";
                    print_r($skill_weightage_meta_data);
                    echo "</pre>";*/
                    $subskill_proficiency_level=0;
                    if($skill_weightage_meta_data->sub_skill_proficiency=="Awareness"){
                        $subskill_proficiency_level=2;
                    }
                  if($skill_weightage_meta_data->sub_skill_proficiency=="Knowledge"){
                        $subskill_proficiency_level=3;
                    }
                    if($skill_weightage_meta_data->sub_skill_proficiency=="Skilled"){
                        $subskill_proficiency_level=4;
                    }
                    if($skill_weightage_meta_data->sub_skill_proficiency=="Mastery"){
                        $subskill_proficiency_level=5;
                    }
                    //echo $subskill_proficiency_level;

                    if($user_sub_pro_l_data->proficiency_id>=$subskill_proficiency_level){
                        continue;
                    }
                   // echo $user_sub_pro_l_data->proficiency_id.":".$subskill_proficiency_level;
                   // echo $user_sub_pro_l_data->proficiency_id." : ".$required_skill_id." Required<br>";
                    $sub_sql="SELECT * FROM {sub_skill} WHERE id=?";
                    $sub_datas=$DB->get_record_sql($sub_sql,array($subkill_lists->sub_skill_id));
                    /*echo "<pre>";
                    print_r($sub_datas);
                    echo "</pre>";*/

            ?>
            <div class="subskills">

                <div>
                    <div class="sub_heading">
                        <a href="javascript:void(0);" class="link">
                            <p class="subskills-title"><strong><?php echo $sub_datas->sub_skills; ?></strong></p>
                        </a>

                        <a href="#hide_row<?php echo $subkill_lists->sub_skill_id;?>" class="arrow" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="hide_row">
                            <i class="fa fa-chevron-circle-up" aria-hidden="true"></i>
                        </a>
                    </div>
                    <div></div>
                </div>
           

                <div class="collapse show" id="hide_row<?php echo $subkill_lists->sub_skill_id;?>">

                    <?php
                        $course_completion_flag=true;
                        $pro_level_data=$DB->get_records_sql("SELECT * FROM {proficiency_level} ORDER BY id ASC");
                        echo "user pro ".$user_sub_pro_l_data->proficiency_id.':Requered pro '.$subskill_proficiency_level.": Gap ";
                        $gap_lavel=($subskill_proficiency_level-$user_sub_pro_l_data->proficiency_id);
                        echo $gap_lavel;
                        foreach($pro_level_data as $pro_l_list){
                          // echo "<br>";
                          

                            $course_arr=array(0);
                               if($pro_l_list->id<=$user_sub_pro_l_data->proficiency_id || $pro_l_list->id>$subskill_proficiency_level ){
                                    continue;
                                }

                            $i=1;
                            $total_row++;

                            //subskill_proficiency_level
                           
                          
                    ?>

                    
                    <div class="h_comolete">
                        <p style="font-size: 15px;">
                         Courses to complete (<?php echo $pro_l_list->proficiency_level;?>)<!--." (id:".$pro_l_list->id.")"-->
                        </p>
                        <span style="color:gray;font-size: 14px;">Any one course complete</span>
                </div>

                <?php
                    if($user_sub_pro_l_data->proficiency_id<$pro_l_list->id AND $course_completion_flag==false){

                        
                ?>
                <div class="skill_disable mb-3">
                  <a href="javascript:void(0);" class="info_icon" >
                    <i class="fa fa-info-circle  red-tooltip" aria-hidden="true" data-placement="left" data-toggle="tooltip" title="This will be enable after after you complete previous level course"></i>
                  </a>
                </div>
            <?php } ?>
            <div class="dk flex-between flex_row <?php if($user_sub_pro_l_data->proficiency_id<$pro_l_list->id AND $course_completion_flag==false) echo 'row-disabled'; ?>" style="opacity: <?php if($user_sub_pro_l_data->proficiency_id<$pro_l_list->id AND $course_completion_flag==false) echo 0.4; ?>;" >
               

                <?php
                  
                    $course_asgin_sql="SELECT * FROM {assign_course_sub_skill} WHERE sub_skill_id=? AND proficiency_id=?";
                            $course_asign_data=$DB->get_records_sql($course_asgin_sql,array($subkill_lists->sub_skill_id,$pro_l_list->id));
                         
                            if(!empty($course_asign_data)){
                                foreach($course_asign_data as $dialog){
                                    array_push($course_arr,$dialog->course_id);
                                }
                            }
                            $courses=implode(',',$course_arr);
                           
                            $course_completion_sql="SELECT * FROM {course_completions} WHERE course IN ($courses) AND userid=? AND timecompleted IS NOT NULL";
                            $course_completion_data=$DB->get_records_sql($course_completion_sql,array($USER->id));
                              // echo $subkill_lists->sub_skill_id."subskill id<br>";

                              // echo $subskill_proficiency_level;
                          
                                if(!empty($course_completion_data)){
                                      $course_completion_flag=true;
                                      $total_completion_row++;
                                      if($user_sub_pro_l_data->proficiency_id == 4){
                                        $point = 90;
                                      }

                                      $update_subkill_obj=new stdClass();
                                      $update_subkill_obj->userid=$USER->id;
                                      $update_subkill_obj->skill_id=$user_sub_pro_l_data->sub_skill_id;
                                      $update_subkill_obj->proficiency_id = $subskill_proficiency_level;
                                      $update_subkill_obj->point=$point;
                                      $update_subkill_obj->createddate=time();
                                      $update_subkill_obj->type="subskill";
                                      $DB->update_record("user_proficiency_level",$update_subkill_obj);
                                      break;

                                  }else{
                                     $course_completion_flag=false;
                                  }

                          
                           
                    if(!empty($course_asign_data)){

                        $j=0;
                        foreach($course_asign_data as $course_asign_list){
                          $course_com="";
                            if($i>3){
                                break;
                            }
                            $course_sql="SELECT * FROM {course} WHERE id=? AND visible=?";
                            $course_data=$DB->get_record_sql($course_sql,array($course_asign_list->course_id,1));
                            if(!empty($course_data)){
                               
                                $course_image_url= getcourse_image($course_data->id);

                                $sql222="SELECT * FROM {course_completions} WHERE course=? AND userid=? AND timecompleted IS NOT NULL";
                              //array_push($course_arr,$course_data);
                               $course_com_data=$DB->get_record_sql($sql222,array($course_data->id,$USER->id));
                               if(!empty($course_com_data)){
                                $course_starttime=date('d-M-y(h:m) A',$course_com_data->timestarted);
                                $course_end=date('d-M-y(h:m) A',$course_com_data->timecompleted);
                                       $course_com='          <div class="complete_course">
                                <p class="m-0 ">Completed<i class="fa fa-check-circle ml-1" aria-hidden="true"></i>
</p>
                                <div>
                                    <p class="m-0 small_font">Start Time:- '.$course_starttime.'</p>
                                    <p class="m-0 small_font">End Time :- '.$course_end.'</p>
                                </div>

                               </div>';
                               }
                                    


                ?>

                  <div class="col_3 mr_30">
                   <div class="course_card"> 
                    <a href="<?php echo $CFG->wwwroot.'/blocks/skill_list/course_details.php?id='.$course_data->id; ?>">
                      
                          <div>
                               <img src="<?php echo $course_image_url; ?>" alt="<?php echo $course_data->fullname; ?>">
                              <?php echo $course_com; ?>

                          </div>
                            <p><?php echo $course_data->fullname; ?></p>
                    </a>
                   </div>
                </div>
            <?php $i++; }} } else{ ?>

                  <div class="col-12">
                    <p style="color:#5a4fd5">No course available</p>
                </div>
            <?php } if($i>3){?>


                  <div class="col_3 text-center">

                       <div class="view_all course_card">
                        <a href="javascript:void(0);" subskill-id="<?php echo $subkill_lists->sub_skill_id;?>" pro-id="<?php echo $pro_l_list->id; ?>" class="all-course-list">
                             <img src="<?php echo $CFG->wwwroot.'/theme/boost/pix/template.png'?>" alt="View All" class="img_s">
                        </a>
                        

                  </div>
                </div>
            <?php } ?>

                </div>
                  
    <?php } ?>


                </div>
           
             
            </div>
        <?php } ?>
                
            </div>


            <div class="container">
                <div class="ajax-data"></div>
            <!--     <div class="spinner-border"></div> -->

                <!--Update user prificient level table and -->
                <?php
               // echo $total_completion_row."<br>";
               //  echo $total_row."<br>";
                $total_per=(100*$total_completion_row)/$total_row;
                $got_percentage=number_format((float)$total_per, 2, '.', '');
               // echo $got_percentage;
                $std_pr_obj=new stdClass();
                foreach($proficiency_level_data1 as $p_list){
                    if($got_percentage<=$p_list->maximum_range){
                        if($user_proficiency_data){
                            $std_pr_obj->proficiency_id=$p_list->id;
                            $std_pr_obj->point=$got_percentage;
                            $std_pr_obj->id=$user_proficiency_data->id;
                            $std_pr_obj->modifieddate=time();
                            $DB->update_record("user_proficiency_level",$std_pr_obj);
                            break; 
                        }

                    }

                }
                
                ?>
                <div class="row">
                    <div class="col-12">
                       <!--    <h3>Get Certificate</h3> -->
                        <?php 
                            $user_skillsss_sql="SELECT * FROM {user_proficiency_level} WHERE userid=? AND type=? AND skill_id=?";
                            $user_skillsss_data=$DB->get_record_sql($user_skillsss_sql,array($USER->id,'skill',$skill_id));
                            $certificate_course_id = $DB->get_record_sql("SELECT  {skill_weightage}.certificate_course FROM {skill_weightage} where {skill_weightage}.id =?",array($skill_data->skill_weightage_id));

                            $certificate_course_sql="SELECT * FROM {course} WHERE id=? AND visible=?";
                            $certificate_course_data=$DB->get_record_sql($certificate_course_sql,array($certificate_course_id->certificate_course,1));

                            if($user_skillsss_data->point==100){

                            $certificate_course_id = $DB->get_record_sql("SELECT  {skill_weightage}.certificate_course FROM {skill_weightage} where {skill_weightage}.id =?",array($skill_data->skill_weightage_id));

                                enroll($certificate_course_id->certificate_course,$USER->id,5);
                                $certificate_course_sql="SELECT * FROM {course} WHERE id=? AND visible=?";
                                $certificate_course_data=$DB->get_record_sql($certificate_course_sql,array($certificate_course_id->certificate_course,1));

                                 
                        ?>
                        <h3>Get Certificate</h3>
                        <a href="<?php echo $CFG->wwwroot.'/course/view.php?id='.$certificate_course_id->certificate_course; ?>"><?php echo $certificate_course_data->fullname; ?></a>

                      <?php } //echo $certificate_course_id->certificate_course; ?>

                   
                    </div>
                    
                </div>
            </div>



        <style type="text/css">

            .skills_heading{
                font-size: 30px;
                font-weight: bold;
            }
            .course_card{
                position: relative;
            }

            .course_card img{
                height: 100%;
                width: 100%;
                object-fit: cover;
                border-radius: 5px;
            }

            .course_card p{
                font-weight: bold;
                margin: 15px 5px;
                letter-spacing: 0.5px;
            }

            .sub_heading{
                display: flex;
                justify-content: space-between;
                align-items: center;
            }

                .link{
                    text-decoration: none !important;
                    font-size: 18px;
                    color: #333;
                    cursor: unset;
                }

                .skilling_path .arrow,.info_icon{
                    font-size: 20px;
                    color: #5a4fd5 !important;
                }

                .info_icon{
                    display: flex;
                    justify-content: flex-end;
                    align-items: center;
                    font-size: 20px;
                }
               

                .h_comolete{
                    font-size: 18px;
                    padding-bottom: 20px;
                }

               .view_all{
                    border-radius: 4px;
                }

   


    .single_course{
        height: 200px;
    }

    .single_course p{
        font-size: 20px;
    }

    .complete_course{
       background-color: gray;
       padding: 10px;
       text-align: center;
        position: absolute;
        width: 100%;
        bottom: 35px;

}

.course_card a{
    text-decoration: none;
    color: white;
}

.small_font{
    font-size: 12px;
}



    @media(max-width: 768px){
        .view_all a{
            font-size: 9px;
            color: #fff;
            text-decoration: none;
            top: 5px;
        }
        
        .view_all p{
            margin-bottom: 0px;
        }

              
    .complete_course{
    background-color: gray;
    padding: 5px;
    text-align: center;
    position: absolute;
    width: 100%;
    bottom: 50px;
    font-size: 7px;
    border-bottom-right-radius: 4px;
    border-bottom-left-radius: 4px;
}

.small_font{
    font-size: 7px;
}
            
    }
    
    .skilling_path{
        background-color: #343a40;
        color: #fff;
        padding-top: 20px;
        border-radius: 4px;
    }
    .subskills-title{
        color: #fff;
    }
    .row-disabled a{
        pointer-events: none;
    }
    
.tooltip.top .tooltip-arrow {
  border-top-color: gray;
}

.tooltip.right .tooltip-arrow {
  border-right-color: #00acd6;
}

.tooltip.bottom .tooltip-arrow {
  border-bottom-color: #00acd6;
}

/*.tooltip.left .tooltip-arrow {
  border-left-color: #00acd6;
}*/
.tooltip.left .tooltip-arrow{
    border-left:5px solid gray !important
}
.tooltip-inner {
  background-color: gray !important;
  color: #fff;
  font-size:11px
}


    /*.skilling_path a,span{
        color: #fff;
    }*/


  /*  .loader {
  display: none;
  top: 50%;
  left: 50%;
  position: absolute;
  transform: translate(-50%, -50%);
}

.loading {
  border: 2px solid #ccc;
  width: 60px;
  height: 60px;
  border-radius: 50%;
  border-top-color: #1ecd97;
  border-left-color: #1ecd97;
  animation: spin 1s infinite ease-in;
}

@keyframes spin {
  0% {
    transform: rotate(0deg);
  }

  100% {
    transform: rotate(360deg);
  }
}
*/
/*.progress.vertical {
    position: relative;
    width: 20px;
    min-height: 240px;
    float: left;
    margin-right: 20px;
    background: none;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
    box-shadow: none;
    border: none;
}*/


        </style>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>-->
<script> 

$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();   
});
</script>

<script type="text/javascript">
    /* function spinner() {
        document.getElementsByClassName("loader")[0].style.display = "block";
    }*/
    $(function(){
       $('.skilling_path').on('click','.all-course-list',function(){
        var $this=$(this);
       // var $row=$(this).parents('.row');
            var subskill_id=$(this).attr('subskill-id');
            var pro_id=$(this).attr('pro-id');
           // alert(pro_id);
            $.ajax({
                type:"get",
                url:"<?php echo $CFG->wwwroot.'/blocks/skill_list/ajax_get_course.php'; ?>",
                data:{sub_skill_id:subskill_id,profi_id:pro_id},
                beforeSend:function(){
                    $($this).children('img').attr("src","<?php echo $CFG->wwwroot.'/theme/boost/pix/pleasewiat.jpg'; ?>");
                },
                success:function(response){
                   // alert(response);
                    // var data=JSON.parse(response);
                    // data.forEach(function(item){
                    //     console.log(item);
                    // });
                   //alert(response);
                   setTimeout(function(){
                    $($this).children('img').attr("src","<?php echo $CFG->wwwroot.'/theme/boost/pix/template.png'; ?>");
                     // $($this+" img").attr("src","<?php echo $CFG->wwwroot.'/theme/boost/pix/template.png'; ?>");
                    /*$($this).parents('.dk').fadeOut();
                        fadeIn('slow');*/
                          $($this).parents('.dk').html(response);
                   },2000);
                 
                },
                complete:function(){
                    
                }
            });
        });
    });
</script>


     <?php echo $OUTPUT->footer();?>

