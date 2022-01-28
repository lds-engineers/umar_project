<?php
require_once('../../config.php');
global $DB, $CFG, $USER;
$pluginpath = "/local/skills";
$systemcontext   = context_system::instance();
require_login();
//$skill_id=required_param('skill_id',PARAM_INT);
if(!is_siteadmin()){
    redirect($CFG->wwwroot, "You don't have permission to access this page");
}
    
require_once($CFG->libdir.'/formslib.php');
class proficiency_level_setting extends moodleform{
    function definition(){
        global $DB,$USER,$CFG;
        $mform=$this->_form;
        $id= optional_param('id',0,PARAM_INT);
        if(isset($id) && $id>0){


        $mform->addElement('header', 'proficiency_level_setting', "Proficiency level Setting");
        $mform->addElement("text","minimum_range","Input Minimum Range",array("max"=>100));
        $mform->settype("minimum_range", PARAM_INT);
        $mform->addRule("minimum_range","Please input minimum range","required","client");
        $mform->addElement("text","maximum_range","Input Minimum Range",array("max"=>100));
         $mform->settype("maximum_range", PARAM_INT);
        $mform->addRule("maximum_range","Please input maximum range","required","client");
        $mform->addElement("hidden","id");
        $this->add_action_buttons();
     }

    }
      public function validation($data, $files) {
        global $DB;
        $errors = array();
        return $errors;
    }
    public function display_proficiency_level_setting(){
         global $DB,$CFG;
        echo "<br/>";
        echo "<h2>Proficiency Level Setting List</h2>";
        $allsetting = $DB->get_records_sql("Select * FROM {proficiency_level}", array());
        echo "<table class='table table-stripped'>";
        echo "<tr>";
        echo "<th>Name</th>";
        echo "<th>Minimum Range</th>";
        echo "<th>Maximum Range</th>";
        echo "<th>Action</th>";
        echo "</tr>";
        foreach ($allsetting as $key => $setting) {
            // if($setting->enddate < time()){
            //     $setting->enddate1 = strtotime("+1 year", date("d F ", $setting->enddate).date("Y"));
            // }
            echo "<tr>";
            echo "<td>".$setting->proficiency_level."</td>";
            echo "<td>".$setting->minimum_range."</td>";
             echo "<td>".$setting->maximum_range."</td>";
            echo "<td><a href='".$CFG->wwwroot."/local/skills/proficiency_level_setting.php?id=".$setting->id."'>Edit</a></td>";//".$CFG->wwwroot."/local/skills/proficiency_level_setting.php?id=".$setting->id."
            echo "</tr>";
        }
        echo "</table>";
    }
}
class assign_skills extends moodleform{
    function definition(){
        global $DB,$USER,$CFG;
        $mform=$this->_form;
        $mform->addElement('header', 'assign_user_skill', "Assign User Skill");
        $options = array(                                                                                                           
    'multiple' => false ,
    'noselectionstring' =>"No selection"                                                                                                          
);  
$usersql="SELECT * FROM {user} WHERE deleted=? AND suspended=? ORDER BY id DESC";   
$userdata=$DB->get_records_sql($usersql,array(0,0));
$user_arr=array("0"=>"");

foreach($userdata as $userlist){
    $user_arr[$userlist->id]=$userlist->firstname." ".$userlist->lastname;
}  
$mform->addElement('autocomplete', 'userid', 'Select User: ', $user_arr, $options);
$skill_sql="SELECT * FROM {skill}";
$skill_data=$DB->get_records_sql($skill_sql);
$skill_arr=array('0'=>"Select Skill");
foreach($skill_data as $skill_list){
    $skill_arr[$skill_list->id]=$skill_list->skill;
}
$mform->addElement("select","skillid","Select Skill:",$skill_arr);

$wei_sql="SELECT * FROM {skill_weightage} ORDER BY id DESC";
$wei_data=$DB->get_records_sql($wei_sql);
$wei_arr=array("0"=>"");
foreach($wei_data as $wei_list){
    $wei_arr[$wei_list->id]=$wei_list->id;
}
$mform->addElement("html","<div class='wei-select'>");
$mform->addElement('autocomplete', 'weight_id', 'Select skill weightage: ', $wei_arr, $options);
$mform->addElement("html","</div>");

        $this->add_action_buttons();
        $mform->addElement("html","<div class='subskill-list'></div>");


    }
      public function validation($data, $files) {
        global $DB;
        $errors = array();
        return $errors;
    }
    public function display_proficiency_level_setting(){
         global $DB,$CFG;
        echo "<br/>";
        echo "<h2>Setting</h2>";
        $allsetting = $DB->get_records_sql("Select * FROM {proficiency_level}", array());
        echo "<table class='table table-stripped'>";
        echo "<tr>";
        echo "<th>Name</th>";
        echo "<th>Minimum Range</th>";
        echo "<th>Maximum Range</th>";
        echo "<th>Action</th>";
        echo "</tr>";
        foreach ($allsetting as $key => $setting) {
            // if($setting->enddate < time()){
            //     $setting->enddate1 = strtotime("+1 year", date("d F ", $setting->enddate).date("Y"));
            // }
            echo "<tr>";
            echo "<td>".$setting->proficiency_level."</td>";
            echo "<td>".$setting->minimum_range."</td>";
             echo "<td>".$setting->maximum_range."</td>";
            echo "<td><a href='".$CFG->wwwroot."/local/skills/proficiency_level_setting.php?id=".$setting->id."'>Edit</a></td>";//".$CFG->wwwroot."/local/skills/proficiency_level_setting.php?id=".$setting->id."
            echo "</tr>";
        }
        echo "</table>";
    }
}
//1642185000    
class user_goal_notifications{
    function __construct(){

    }

    public function user_goal_progress_notification(){
        global $DB,$USER,$CFG;
        $usergoal_data=null;
        $currentDate=strtotime(date('d F Y'));
        $backday = strtotime("-1 day", $currentDate);
        echo date('l',$backday);//$backday;
        die;
        //echo $currentDate;
        $notification_id="progress_goal";

     //  echo  get_config('block_skill_list', 'block_skill_list_goal_not_set_notification');
        $sql="SELECT u.id,u.firstname,u.lastname,u.email,u.username,ug.no_of_course,ug.day_hours,ug.week_hours,ugn.notification_id,ugn.senddate,ugn.sendtime,ugn.userid  FROM {user} u JOIN {usergoal} ug ON u.id=ug.userid JOIN {role_assignments} ra ON ra.userid=u.id JOIN {role} r ON r.id=ra.roleid LEFT JOIN {usergoalnotification} ugn ON ugn.userid=u.id and ugn.senddate='".$currentDate."' AND ugn.notification_id='".$notification_id."' WHERE r.id=? AND ugn.userid IS NULL LIMIT 50";

        $usergoal_data=$DB->get_records_sql($sql,array(5));
        foreach($usergoal_data as $list){
            $std=new stdClass();
            $std->userid=$list->id;
            $std->notification_id=$notification_id;
            $std->senddate=$currentDate;
            $std->sendtime=time();
            $DB->insert_record("usergoalnotification",$std);
        }
        echo "<pre>";
        print_r($usergoal_data);
        echo "</pre>";

       
        
    }
    public function today_total_time(){
        global $USER,$CFG,$PAGE,$DB;

        $currentDate=strtotime(date('d F Y'));

        $today= date("l",$currentDate);
        if($today=="Monday"){
        $monday = strtotime("last monday");
        }else{
            $monday = date('w', $monday)==date('w') ? $monday+7*86400 : $monday; 
        }

    
    $sunday = strtotime(date("Y-m-d",$monday)." +6 days");
   
    $data_arr=array();
 
    switch($today){
        case "Monday":
            $days=$sunday;
        break;
        case "Sunday":
            $days=strtotime(date("Y-m-d",$monday)." +5 days");
        break;
        case "Saturday":
            $days=strtotime(date("Y-m-d",$monday)." +4 days");
        break;
        case "Friday":
              $days=strtotime(date("Y-m-d",$monday)." +3 days");
        break;
        case "Thursday":
              $days=strtotime(date("Y-m-d",$monday)." +2 days");
        break;
        case "Wednesday":
            $days=strtotime(date("Y-m-d",$monday)." +1 days");
        break;
        case "Tuesday":
              $days=$monday;
        break;
    }

    for($i = $monday; $i <= $days;) {
        $time=0;
        $nextday = strtotime("+1 day", $i);
        echo date('d-M-Y',$i).'<br>';

        $sql="SELECT COALESCE(sum(duration),0) as totaltime FROM {attendanceregister_session} WHERE login BETWEEN ? AND ? AND userid=? ";
        $data=$DB->get_record_sql($sql,array($i,($nextday-1),23));
      
        $seconds=$data->totaltime;
        $secs = $seconds % 60;
        $hrs = $seconds / 60;
        $mins = $hrs % 60;
        $hrs = $hrs / 60;
        $data_arr[date('d-M-Y',$i)]=(int)$hrs.'.'.(int)$mins;//$data->totaltime;
    
   // array_push($data_arr,$data->totaltime);
        $i = $nextday;
    }
    echo "<pre>";
    print_r($data_arr);
    echo "</pre>";


}

    public function enroll($courseid, $userid, $roleid) {
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
        add_to_log($courseid, 'course', 'enrol', '../enrol/users.php?id='.$courseid, $courseid, $userid); //there should be userid somewhere!
      }
    }
  }
}


class category_settings extends moodleform{
    function definition(){
        global $DB,$USER,$CFG;
        $mform=$this->_form;
        $mform->addElement('header', 'category_settings', "Category Settings");
        $sql="SELECT * FROM {course_categories} WHERE visible=?";
        $data=$DB->get_records_sql($sql,array(1));
        $option=array();
        foreach($data as $list){
            $option[$list->id]=$list->name;
        }
        $mform->addElement("select","default_course_category","Select Default Course category",$option);
        $mform->addElement("select","certificate_course_category","Select Certificate Course category",$option);
        $mform->addElement("html",'<div class="aaaaa">');
        $mform->addElement("hidden","id");
        $mform->addElement('html',"</div>");
        $this->add_action_buttons();


    }
      public function validation($data, $files) {
        global $DB;
        $errors = array();
        return $errors;
    }
    public function display_proficiency_level_setting(){
         global $DB,$CFG;
        echo "<br/>";
        echo "<h2>Setting</h2>";
        $allsetting = $DB->get_records_sql("Select * FROM {proficiency_level}", array());
        echo "<table class='table table-stripped'>";
        echo "<tr>";
        echo "<th>Name</th>";
        echo "<th>Minimum Range</th>";
        echo "<th>Maximum Range</th>";
        echo "<th>Action</th>";
        echo "</tr>";
        foreach ($allsetting as $key => $setting) {
            // if($setting->enddate < time()){
            //     $setting->enddate1 = strtotime("+1 year", date("d F ", $setting->enddate).date("Y"));
            // }
            echo "<tr>";
            echo "<td>".$setting->proficiency_level."</td>";
            echo "<td>".$setting->minimum_range."</td>";
             echo "<td>".$setting->maximum_range."</td>";
            echo "<td><a href='".$CFG->wwwroot."/local/skills/proficiency_level_setting.php?id=".$setting->id."'>Edit</a></td>";//".$CFG->wwwroot."/local/skills/proficiency_level_setting.php?id=".$setting->id."
            echo "</tr>";
        }
        echo "</table>";
    }
}
//Goal encouraging notification