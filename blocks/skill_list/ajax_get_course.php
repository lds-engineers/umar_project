<?php
require_once('../../config.php');
global $DB,$USER,$CFG;

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
$subskill_id=$_GET['sub_skill_id'];
$pro_id=$_GET['profi_id'];
$course_asgin_sql="SELECT * FROM {assign_course_sub_skill} WHERE sub_skill_id=? AND proficiency_id=?";
$course_asign_data=$DB->get_records_sql($course_asgin_sql,array($subskill_id,$pro_id));
$course_arr=array();
$coursedata="";

         
                    if(!empty($course_asign_data)){

                        $j=0;
                        foreach($course_asign_data as $course_asign_list){
                          $course_com="";
                        
                            $course_sql="SELECT * FROM {course} WHERE id=? AND visible=?";
                            $course_data=$DB->get_record_sql($course_sql,array($course_asign_list->course_id,1));
                            if(!empty($course_data)){
                            	$course_url=$CFG->wwwroot.'/blocks/skill_list/course_details.php?id='.$course_data->id;
                               $image_url=getcourse_image($course_data->id);
                               $sql="SELECT * FROM {course_completions} WHERE course=? AND userid=? AND timecompleted IS NOT NULL";
                              //array_push($course_arr,$course_data);
                               $course_com_data=$DB->get_record_sql($sql,array($course_data->id,$USER->id));
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
                                    
   //                       <div class="progress vertical">
   //                              <div class="bar bar-success" style="width: 70%;"></div>
   //                      </div>

$coursedata.='  <div class="col_3 mr-30">

                  
                    
                   <div class="course_card">
                   
                    <div>
                    
                    <a href="'.$course_url.'">
                      
                          <div>
                               <img src="'.$image_url.'" alt="">
                     '.$course_com.'

                          </div>
                            <p>'.$course_data->fullname.'</p>
                    </a>
                 
                    </div>
                   
                    

                     
                   </div>
                </div>';

      
         $i++; }} } 
         echo $coursedata;

