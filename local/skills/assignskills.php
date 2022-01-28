<?php
require_once('locallib.php');
global $CFG;
$id= optional_param('id',0,PARAM_INT);


$newnotification_url=$CFG->wwwroot.$pluginpath."/assignskills.php";

$redirecturl = $CFG->wwwroot.$pluginpath."/assignskills.php";
$mform  = new assign_skills();
if($mform->is_cancelled()) {
    redirect($CFG->wwwroot.$pluginpath);
} else if ($fromform=$mform->get_data()){    
  
	if($fromform->id){
		$fromform->modifiedby = $USER->id;
		$fromform->modifieddate = time();
		//$DB->update_record("proficiency_level", $fromform);
	} else {
		$fromform->createdby = $USER->id; 
		$fromform->createddate = time();
		//$fromform->id = $DB->insert_record("proficiency_level", $fromform);
	}
  
}

if($id){
   
    $olddata=$DB->get_record("assign_skill",array("id"=>$id));
  	$mform->set_data($olddata);
}


echo $OUTPUT->header();
$mform->display();
//$mform->display_proficiency_level_setting();
?>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function(){
		$(".wei-select select").change(function(){
			//alert($(this).val());
			var wei_id=$(this).val();
			if(wei_id!=""){
				$.ajax({
					type:"get",
					url:"<?php echo $CFG->wwwroot.'/local/skills/ajax_weightage.php'?>",
					data:{id:wei_id},
					success:function(response){
						alert(response);
					}
				});
			}
		});
	});
</script>
<?php
echo $OUTPUT->footer();
