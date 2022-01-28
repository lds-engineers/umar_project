<?php
require_once('../../config.php');
global $DB,$USER,$CFG;
require_once($CFG->dirroot.'/course/externallib.php');
require_once($CFG->libdir.'/formslib.php');

     require_login();
     class blocksApi{
     	function __construct(){

     	}
     	/*public function check_user_enrolment($courseid){
     		global $DB,$USER;
     		$sql="SELECT  "
     	}*/
     	public function course_summary($courseid){
     		global $DB,$USER;
     		$sql="SELECT * FROM {course} WHERE id=? AND visible=?";
     		$course_data=$DB->get_record_sql($sql,array($courseid,1));
               return $course_data;
     		
     	}
          public function check_course($courseid){
               global $DB,$USER,$CFG;
               $sql="SELECT * FROM {course} WHERE id=? AND visible=?";
               $course_data=$DB->record_exists_sql($sql,array($courseid,1));
               if($course_data){
                    return true;
               }
               return false;
          }
          public function course_content($courseid){
               global $DB,$USER,$CFG;
               $obj1 = new core_course_external();
               //array("options"=>array('ids'=>$courseid));
               //$course_array=array("ids"=>array($courseid));
              // $course_detail=$obj1->get_courses($course_array);
               $sectiondetails =$obj1->get_course_contents($courseid);
            
               //$data=courselib::get_course_contents($courseid);
               return $sectiondetails;//array('course_section'=>$course_detail);

          }

          public function getcourse_image($courseid) {
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

          public  function enroll($courseid, $userid, $roleid) {
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
        //add_to_log($courseid, 'course', 'enrol', $CFG->wwwroot.'/enrol/users.php?id='.$courseid, $courseid, $userid); //there should be userid somewhere!
      }
    }
  }
  
     }

     