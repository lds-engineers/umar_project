<?php

namespace local_skills\task;
 
/**
 * An example of a scheduled task.
 */
class goal_achieved_notification extends \core\task\scheduled_task {
 
    /**
     * Return the task's name as shown in admin screens.
     *
     * @return string
     */
    public function get_name(){
        return "Goal achieved notification";
    }
 
    /**
     * Execute the task.
     */
    public function execute() {
        global $DB, $CFG,$USER;
        echo "Executing...";
        $currentday = time();
        echo "Current Time:- ".date("Y-m-d H:i:s")."\n";
        $currentDate=strtotime(date('d F Y'));
       
        $notification_id="goal_achieved_notification";
        $sql="SELECT u.id,u.firstname,u.lastname,u.email,u.username,ugn.notification_id,ugn.senddate,ugn.sendtime,ugn.userid  FROM {user} u  JOIN {role_assignments} ra ON ra.userid=u.id JOIN {role} r ON r.id=ra.roleid LEFT JOIN {usergoalnotification} ugn ON ugn.userid=u.id and ugn.senddate='".$currentDate."' AND ugn.notification_id='".$notification_id."' WHERE r.id=? AND ugn.userid IS NULL LIMIT 50";

        $usergoal_data=$DB->get_records_sql($sql,array(5));
        if(!empty($usergoal_data)){
            foreach($usergoal_data as $list){
                $msgdata='';
                $usergoal_hour=self::usergoal_set($list->id);
                $total_spent_time=self::total_spent_time($list->id);
                if($total_spent_time>=$usergoal_hour && $usergoal_hour!=0 ){
                    
               
               
                $message = new \core\message\message();
                $message->component         = 'mod_assign';
                $message->modulename         = 'assign_notification';
                $message->name              = 'assign_notification';
                $message->userfrom          = "2";
                $message->userto            = $list->id;
                $message->smallmessage      = "Goal achieved notification";//get_string('notification_message_subject', 'local_moodleoverflow',$a);
                $message->subject           = 'Goal achieved notification ('.date('d-M-Y').')';//get_string('notification_message_subject', 'local_moodleoverflow',$a);
                $message->fullmessage       = "Goal achieved notification";//get_string('smeinviteemail', 'local_moodleoverflow',$a);
                $message->fullmessagehtml   = "<h1>You have achieved goal.</h1>";//get_string('smeinviteemail', 'local_moodleoverflow',$a);
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
    //}

        
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