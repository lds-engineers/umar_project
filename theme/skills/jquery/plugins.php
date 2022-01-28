<?php
// This line protects the file from being accessed by a URL directly.
defined('MOODLE_INTERNAL') || die();

$plugins=array(
	'validate'=>array("files"=>array("jquery.validate.min.js")),
	'additional_methods'=>array('files'=>array("additional-methods.min.js"))
);