<?php

namespace local_skills\task;
 
/**
 * An example of a scheduled task.
 */
class goal_not_set_notification extends \core\task\scheduled_task {
 
    /**
     * Return the task's name as shown in admin screens.
     *
     * @return string
     */
    public function get_name(){
        return "Goal not set notification";
    }
 
    /**
     * Execute the task.
     */
    public function execute() {
        global $DB, $CFG,$USER,$CFG;
        echo "Executing...";
        $currentday = time();
        echo "Current Time:- ".date("Y-m-d H:i:s")."\n";
        $currentDate=strtotime(date('d F Y'));
        $today=date('l',$currentDate);
       // echo $total;
        $val=-1;
        //echo $currentDate;
        switch ($today) {
            case 'Sunday':
                    $val=0;
            break;
             case 'Monday':
                    $val=1;
            break;
             case 'Tuesday':
                    $val=2;
            break;
             case 'Wednesday':
                    $val=3;
            break;
             case 'Thursday':
                    $val=4;
            break;
             case 'Friday':
                    $val=5;
            break;
             case 'Saturday':
                    $val=6;
            break;
            default:
               
                break;
        }
        $notification_id="goal_not_set_notification";
        $skill_list_goal_not_set_notification_day=$CFG->block_skill_list_goal_not_set_notification;


     //  echo  get_config('block_skill_list', 'block_skill_list_goal_not_set_notification');
        if($val==$skill_list_goal_not_set_notification_day){
            $sql="SELECT u.id,u.firstname,u.lastname,u.email,u.username,ugn.notification_id,ugn.senddate,ugn.sendtime,ugn.userid  FROM {user} u  JOIN {role_assignments} ra ON ra.userid=u.id JOIN {role} r ON r.id=ra.roleid LEFT JOIN {usergoal} ug ON ug.userid=u.id LEFT JOIN {usergoalnotification} ugn ON ugn.userid=u.id and ugn.senddate='".$currentDate."' AND ugn.notification_id='".$notification_id."' WHERE r.id=? AND ugn.userid IS NULL AND ug.userid IS NULL LIMIT 50";

            $usergoal_data=$DB->get_records_sql($sql,array(5));
            if(!empty($usergoal_data)){
                foreach($usergoal_data as $list){
                    
                $message = new \core\message\message();
                $message->component         = 'mod_assign';
                $message->modulename         = 'assign_notification';
                $message->name              = 'assign_notification';
                $message->userfrom          = "2";
                $message->userto            = $list->id;
                $message->smallmessage      = "Goal Not set notification";//get_string('notification_message_subject', 'local_moodleoverflow',$a);
                $message->subject           = 'Goal Not set notification ('.date('d-M-Y').')';//get_string('notification_message_subject', 'local_moodleoverflow',$a);
                $message->fullmessage       = "Please set your gaol";//get_string('smeinviteemail', 'local_moodleoverflow',$a);
                $message->fullmessagehtml   = "<h1>Please set your goal</h1>".'<a href="'.$CFG->wwwroot.'/blocks/skill_list/set_weekly_goals.php">Set Goal</a>';//get_string('smeinviteemail', 'local_moodleoverflow',$a);
                $message->fullmessageformat = FORMAT_MARKDOWN;
                // $message->fullmessageformat = FORMAT_PLAIN;
                $message->notification      = 1;



                message_send($message);
                $std= new \stdClass();
                $std->userid=$list->id;
                $std->notification_id=$notification_id;
                $std->senddate=$currentDate;
                $std->sendtime=time();
                $DB->insert_record("usergoalnotification",$std);
            }
        }
 
        }

        
}
    public function progress_reports($userid){
        global $USER,$CFG,$PAGE,$DB;

        $currentDate=strtotime(date('d F Y'));


        $today= date("l",$currentDate);
        if($today=="Monday"){
        $monday = strtotime("last monday");
        }else{
            $monday = date('w', $monday)==date('w') ? $monday+7*86400 : $monday; 
        }

    
    //$sunday = strtotime(date("Y-m-d",$monday)." +6 days");
   
    $data_arr=array();
 

    for($i = $monday; $i <$currentDate;) {
        $time=0;
        $nextday = strtotime("+1 day", $i);
       // echo date('d-M-Y',$i).'<br>';

        $sql="SELECT COALESCE(sum(duration),0) as totaltime FROM {attendanceregister_session} WHERE login BETWEEN ? AND ? AND userid=? ";
        $data=$DB->get_record_sql($sql,array($i,($nextday-1),23));
      
        $seconds=$data->totaltime;
        $secs = $seconds % 60;
        $hrs = $seconds / 60;
        $mins = $hrs % 60;
        $hrs = $hrs / 60;
        $data_arr[date('d-M-Y',$i)]=(int)$hrs.'.'.(int)$mins;//$data->totaltime;
    
        
        $i = $nextday;
    }

    return $data_arr;
    /*echo "<pre>";
    print_r($data_arr);
    echo "</pre>";*/


}
    private function usergoal_set($userid){
        global $DB,$USER,$CFG;
        $weekly_goal_set=0;
        $sql="SELECT * FROM {usergoal} WHERE userid=?";
        $userdata=$DB->get_record_sql($sql,array($userid));
        if(!empty($userdata)){
            $weekly_goal_set=$userdata->week_hours;
        }
        return $weekly_goal_set;
    }
    private function total_spent_time($userid){
        $total=0;
        $userdata=$this->progress_reports($userid);
        foreach($userdata as $val){
            $total=$total+$val;    
        }
        return $total;
        
    }
}