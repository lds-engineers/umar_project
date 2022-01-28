<?php
require('../../config.php');
global $USER,$DB;

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
		$std->userid=$userid;
		$std->no_of_course=$no_of_course;
		$std->day_hours=$day_hours;
		$std->week_hours=$week_hours;
		$std->modifiedby=$userid;
		$std->modifieddate=time();
		//print_r($std);
		$DB->update_record("usergoal",$std);
		$msg['status']=true;
		$msg['msg']="Goal set successfully";

		$message = new \core\message\message();
        $message->component         = 'mod_assign';
        $message->modulename         = 'assign_notification';
        $message->name              = 'assign_notification';
        $message->userfrom          = "2";
        $message->userto            = $userid;
        $message->smallmessage      = "Update Goal notification";//get_string('notification_message_subject', 'local_moodleoverflow',$a);
        $message->subject           = 'Update Goal notification ('.date('d-M-Y').')';//get_string('notification_message_subject', 'local_moodleoverflow',$a);
        $message->fullmessage       = "You have updatded set Goal weekly";//get_string('smeinviteemail', 'local_moodleoverflow',$a);
        $message->fullmessagehtml   = "You have updatded set Goal weekly";//get_string('smeinviteemail', 'local_moodleoverflow',$a);
        $message->fullmessageformat = FORMAT_MARKDOWN;
        // $message->fullmessageformat = FORMAT_PLAIN;
        $message->notification      = 1;



        message_send($message);
		echo json_encode($msg);
		exit();
	}
	$std->no_of_course=$no_of_course;
	$std->day_hours=$day_hours;
	$std->week_hours=$week_hours;
	$std->createdby=$userid;
	$std->createddate=time();
	$std->userid=$userid;
	//print_r($std);
	$DB->insert_record("usergoal",$std);
	$msg['status']=true;
	$msg['msg']="Goal set successfully";

	$message = new \core\message\message();
        $message->component         = 'mod_assign';
        $message->modulename         = 'assign_notification';
        $message->name              = 'assign_notification';
        $message->userfrom          = "2";
        $message->userto            = $userid;
        $message->smallmessage      = "Added Goal notification";//get_string('notification_message_subject', 'local_moodleoverflow',$a);
        $message->subject           = 'Added Goal notification ('.date('d-M-Y').')';//get_string('notification_message_subject', 'local_moodleoverflow',$a);
        $message->fullmessage       = "You have Added set Goal weekly";//get_string('smeinviteemail', 'local_moodleoverflow',$a);
        $message->fullmessagehtml   = "You have Added set Goal weekly";//get_string('smeinviteemail', 'local_moodleoverflow',$a);
        $message->fullmessageformat = FORMAT_MARKDOWN;
        // $message->fullmessageformat = FORMAT_PLAIN;
        $message->notification      = 1;



        message_send($message);
	echo json_encode($msg);
	exit();

}else{
	$msg['status']=false;
	$msg['msg']="All fields are  required";
	echo json_encode($msg);
}
