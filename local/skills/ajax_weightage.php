<?php
require_once('../../config.php');
global $USER,$DB;
echo json_encode($USER);
$id=$_GET['id'];
//echo $id;