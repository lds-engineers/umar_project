<?php
//$id = optional_param('id', 0, PARAM_TEXT);
 

//require('locallib.php');
require_once('locallib.php');
global $DB,$USER,$PAGE;
$PAGE->requires->jquery();
$id= optional_param('id',0,PARAM_INT);


//$newnotification_url=$CFG->wwwroot.$pluginpath."/proficiency_level_setting.php";

$redirecturl = $CFG->wwwroot.$pluginpath."/proficiency_level_setting.php?id=".$id;
$mform  = new proficiency_level_setting();
//$mform->test();
if($mform->is_cancelled()) {
    redirect($CFG->wwwroot.$pluginpath);
} else if ($fromform=$mform->get_data()){    
  
	if($fromform->id){
		$fromform->modifiedby = $USER->id;
		$fromform->modifieddate = time();
		//$DB->update_record("proficiency_level", $fromform);
		redirect($redirecturl,"Updated successfully");
	} else {
		$fromform->createdby = $USER->id; 
		$fromform->createddate = time();
		//$fromform->id = $DB->insert_record("proficiency_level", $fromform);
	}
  
}

if($id){
   
    $olddata=$DB->get_record("proficiency_level",array("id"=>$id));
  	$mform->set_data($olddata);
}


echo $OUTPUT->header();
$mform->display();
$mform->display_proficiency_level_setting();
?>
<script type="text/javascript">
	$(function(){
		//alert("test");
		$('#id_minimum_range').attr('type',"number");
		$('#id_maximum_range').attr('type','number');
	});
</script>
<?php
echo $OUTPUT->footer();
