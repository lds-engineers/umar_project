<?php
require_once('locallib.php');
global $CFG,$USER,$DB;


$PAGE->set_heading("Course category");
$PAGE->set_title('Set Course category');
$newnotification_url=$CFG->wwwroot.$pluginpath."/category_settings.php";

$redirecturl = $CFG->wwwroot.$pluginpath."/category_settings.php";
$mform  = new category_settings();
if($mform->is_cancelled()) {
    redirect($CFG->wwwroot.$pluginpath);
} else if ($fromform=$mform->get_data()){    
  
	if($fromform->id){
		$fromform->modifiedby = $USER->id;
		$fromform->modifieddate = time();
		$DB->update_record("course_category_settings", $fromform);
		redirect($redirecturl,"Updated successfully");
	} else {
		$fromform->createdby = $USER->id; 
		$fromform->createddate = time();
		$DB->insert_record("course_category_settings", $fromform);
		redirect($redirecturl,"Updated successfully");
	}
  
}


   
   // $olddata=$DB->get_record("course_category_settings");
    $oldsql="SELECT * FROM {course_category_settings}";
    $olddata=$DB->get_record_sql($oldsql,array());
    if(!empty($olddata)){
    	$mform->set_data($olddata);
    }
  	


echo $OUTPUT->header();
$mform->display();

?>