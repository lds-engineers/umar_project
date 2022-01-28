<?php
require_once('locallib.php');
$usergaol_obj=new user_goal_notifications();
echo "<pre>";
	print_r($usergaol_obj->user_goal_notication());
	echo "<br>".time();
echo "</pre/";


