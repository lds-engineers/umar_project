<?php
require_once('locallib.php');
global $DB,$USER;
$courseid=$_POST['courseid'];
$sql="SELECT * FROM {skill_course_rating} WHERE courseid=?";
$data=$DB->get_record_sql($sql,array($courseid));
if(!empty($data)){
	$msg['status']=true;
	$msg['msg']="ok";
	$msg['no_of_user']=$data->no_of_user;
	$msg['rating_status']=$data->status;
	$msg['stars']=$data->stars;
	$msg['courseid']=$data->courseid;
	echo json_encode($msg);
	exit();
}else{
	$msg['status']=false;
	$msg['msg']="false";
	echo json_encode($msg);
	exit();
}