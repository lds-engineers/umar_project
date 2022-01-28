<?php
require('../../../config.php');
global $DB,$USER;

$userid=$USER->id;
$no_of_course=$_GET['no_of_course'];
$day_hours=$_GET['day_hours'];
$week_hours=$_GET['week_hours'];
if(isset($no_of_course) && !empty($no_of_course) && isset($day_hours) && !empty($day_hours) && isset($week_hours) && !empty($week_hours)){
	$std=new stdClass();
	$sql="SELECT * FROM mdl_usergoal WHERE userid=?";
	$userdata=$DB->get_record_sql($sql,array($userid));

	if(!empty($userdata)){
		$std->id=$userdata->id;
		$std->no_of_course=$no_of_course;
		$std->day_hours=$day_hours;
		$std->week_hours=$week_hours;
		$std->modifiedby=$userid;
		$std->modifieddate=time();
		$DB->update_record("usergoal",$std);
		$msg['status']=true;
		$msg['msg']="Goal set successfully";
		echo json_encode($msg);
		exit();
	}
	$std->no_of_course=$no_of_course;
	$std->day_hours=$day_hours;
	$std->week_hours=$week_hours;
	$std->createdby=$userid;
	$std->createddate=time();
	$DB->insert_record("usergoal",$std);
	$msg['status']=true;
	$msg['msg']="Goal set successfully";
	echo json_encode($msg);
	exit();

}else{
	$msg['status']=false;
	$msg['msg']="All fields are  required";
	echo json_encode($msg);
}
