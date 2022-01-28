<?php

require_once('locallib.php');
global $USER,$CFG,$PAGE;
//$PAGE->header();
$monday = strtotime("last monday");

$monday = date('w', $monday)==date('w') ? $monday+7*86400 : $monday;

$sunday = strtotime(date("Y-m-d",$monday)." +6 days");
$data_arr=array();

for ($i = $monday; $i <= $sunday;) {
	$time=0;
    $nextday = strtotime("+1 day", $i);
   // echo $nextday;


   	$sql="SELECT COALESCE(sum(duration),0) as totaltime FROM {attendanceregister_session} WHERE login BETWEEN ? AND ? AND userid=? ";
   	$data=$DB->get_record_sql($sql,array($i,($nextday-1),23));
   	/*	echo "<pre>";
    echo date("l", $i). " - " . date("d m Y h:i:s A", $i)." - ".date("d m Y h:i:s A", $nextday-1)."<br>";
    print_r($data);
    echo "</pre>";*/
     //$duration = Math.floor(( $data->totaltime / (1000 * 60 * 60)) % 24);
    $seconds=$data->totaltime;
    $secs = $seconds % 60;
	$hrs = $seconds / 60;
	$mins = $hrs % 60;
	$hrs = $hrs / 60;
	if((int)$hrs>0 AND (int)$mins>0){
		$time=(int)$hrs."h:".(int)$mins."m";
	}elseif((int)$hrs==0 AND (int)$mins>0){
		$time=(int)$mins."m";
	}elseif((int)$mins==0 AND (int)$hrs>0){
		$time=(int)$mins."h";
	}else{
		$time=(int)$mins.'m';
	}
	
    array_push($data_arr, $time);
    $i = $nextday;
}
$this_week_sd = date("Y-m-d",$monday);

$this_week_ed = date("Y-m-d",$sunday);

$obj=new user_goal_notifications();
//$obj->user_goal_progress_notification();
//$obj->today_total_time();
echo $CFG->block_skill_list_goal_not_set_notification;
//echo $CFG->block_skill_list_goal_not_set_notification;
/*echo "<pre>";
print_r($data_arr);
echo "</pre>";*/

//echo "Current week range from $this_week_sd to $this_week_ed ";

//$PAGE->footer();

//goal_encouraging_notification