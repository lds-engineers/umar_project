<?php
require_once('locallib.php');
global $DB,$USER;

$courseid2=$_POST['courseid2'];
$courseid3=$_POST['courseid3'];
$no_of_user=$_POST['no_of_user'];
$rating=$_POST['rating'];
$status=$_POST['status'];
$std=new stdClass();
if(!empty($courseid3)){
	$sql="SELECT * FROM {skill_course_rating} WHERE courseid=?";
	$data=$DB->get_record_sql($sql,array($courseid3));
	$std->id=$data->id;
	$std->no_of_user=$no_of_user;
	$std->stars=$rating;
	$std->status=$status;
	$std->modifieddate=time();
	$std->modifiedby=$USER->id;
	$DB->update_record("skill_course_rating",$std);
	$msg['status']=true;
	$msg['msg']="Course rating updated successfully";
	echo json_encode($msg);
	exit();

}else{
	$std->courseid=$courseid2;
	$std->no_of_user=$no_of_user;
	$std->stars=$rating;
	$std->status=$status;
	$std->createddate=time();
	$std->createdby=$USER->id;
	$DB->insert_record("skill_course_rating",$std);
	$msg['status']=true;
	$msg['msg']="Course rating added successfully";
	echo json_encode($msg);
	exit();
}