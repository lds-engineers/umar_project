<?php
require_once('locallib.php');
global $DB,$USER;
$search=$_POST['search'];

if(isset($_POST['search'])){
 $search = $_POST['search'];

 $query = "SELECT * FROM {course} WHERE fullname like'".$search."%'";
 $result =$DB->get_records_sql($query);

 $response = array();
 foreach($result as $list){
   $response[] = array("value"=>$list->id,"label"=>$list->fullname);
 }

 echo json_encode($response);
}

exit;