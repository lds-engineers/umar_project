<?php


require_once('../../config.php');

global $CFG, $DB, $PAGE, $USER;
if($_POST){       //Access post data
	if($_POST['flg']=='skill'){
	 $DB->execute("UPDATE {skill} SET skill= '{$_POST['skills']}' WHERE id = '{$_POST['id']}'");
	   redirect(new moodle_url("/local/skills/index.php"), "Skills updated Successfull", null, \core\output\notification::NOTIFY_SUCCESS);
	}elseif($_POST['flg']=='sub_skill'){
		
		$DB->execute("UPDATE {sub_skill} SET sub_skills = '{$_POST['sub_skills']}' WHERE id = '{$_POST['id']}'");
		  redirect(new moodle_url("/local/skills/index.php"), "Sub Skills updatede Successfull", null, \core\output\notification::NOTIFY_SUCCESS);
	}elseif($_POST['flg']=='assignSkill'){  // submit record for mapped user to skill
		
		$dataObj = new stdClass();
      $dataObj->user_id = $_POST['user'];
      $dataObj->skill_id = $_POST['skill'];
      $dataObj->skill_proficiency_label = $_POST['skill_proficiency_label'];
      $dataObj->createdby=$USER->id;
      $dataObj->createddate=time();
      $dataObj->skill_weightage_id=$_POST['weightage_id'];
		$dataObj->id = $DB->insert_record('assign_skill',$dataObj); // Insert skill data in (mdl_assign_skill) table
		$assign_skill_id = $dataObj->id;
		if ($assign_skill_id) {
			for ($j=0; $j <count($_POST['sub_skill_id']); $j++) { 
				$sub_skills_data = $_POST['sub_skill_id'][$j];
				$pre_skills_data = $_POST['proficiency_level'][$j];
				$pre_skill = substr($pre_skills_data,0,strpos($pre_skills_data, '-'));
				$dataObj1 = new stdClass();
				$dataObj1->assign_skill_id = $assign_skill_id;
				$dataObj1->skill_id = $_POST['skill'];
				$dataObj1->sub_skill_id = $sub_skills_data;
				$dataObj1->proficiency_level = $pre_skill;
				$dataObj->id = $DB->insert_record('skill_proficiency_level',$dataObj1);
			}
			redirect(new moodle_url("/local/skills/assignskill.php"), "Skills Assign Successfull", null, \core\output\notification::NOTIFY_SUCCESS);
		}else{
			redirect(new moodle_url("/local/skills/assignskill.php"), "Something wrong", null, \core\output\notification::NOTIFY_ERROR);
		}
	}elseif($_POST['flg']=='update_assign_Skill'){
		global $USER;
		$skill_id = $_POST['skill'];
		$skill_proficiency_label  = $_POST['skill_proficiency_label'];
		$user_id = $_POST['user'];
		$weightage_id=$_POST['weightage_id'];
		$modifiedby=$USER->id;
		$modifieddate=time();
		
		$DB->execute("UPDATE {assign_skill} SET skill_proficiency_label = '{$skill_proficiency_label}',skill_weightage_id={$weightage_id},modifiedby={$modifiedby}, modifieddate='{$modifieddate}' WHERE skill_id = $skill_id AND user_id = $user_id");			
		for ($j=0; $j <count($_POST['sub_skill_id']) ; $j++) { 
			$sub_skills_data = $_POST['sub_skill_id'][$j];
			$pre_skills_data = $_POST['proficiency_level'][$j];
			$assign_skill_id = $_POST['assign_skill_id'][$j];
			$pre_skill = substr($pre_skills_data,0,strpos($pre_skills_data,'-')); // find profiency label value 
			$dataObj1 = new stdClass();
			$dataObj1->proficiency_level = $pre_skill;			   
		   $DB->execute("UPDATE {skill_proficiency_level} SET proficiency_level = '{$pre_skill}' WHERE id = $assign_skill_id ");
		}
		redirect(new moodle_url("/local/skills/assignskill.php"), "Upadate Successfull", null, \core\output\notification::NOTIFY_SUCCESS);
	}elseif($_POST['flg']=='courseSkill'){    // Submit record for mapped course to skill
		for ($i=0; $i <count($_POST['course']) ; $i++) { 	
			$course_id = $_POST['course'][$i];
			$skill_proficiency_label  = $_POST['skill_proficiency_label'];
				$skill_id = $_POST['skill'];
				$dataObj = new stdClass();
		      $dataObj->course_id = $course_id;
		      $dataObj->skill_id = $skill_id;
		      $dataObj->skill_proficiency_label = $skill_proficiency_label;
				$dataObj->id = $DB->insert_record('course_skill',$dataObj);
				$assign_course_skill_id = $dataObj->id; // inserted id
				for ($j=0; $j <count($_POST['sub_skill_id']) ; $j++) { 

					$sub_skills_data = $_POST['sub_skill_id'][$j];
					$pre_skills_data = $_POST['proficiency_level'][$j];
					$pre_skill = substr($pre_skills_data,0,strpos($pre_skills_data,'-'));
					   
					$data1 = new stdClass();
					$data1->assign_course_skill_id = $assign_course_skill_id;
					$data1->course_skill_id = $skill_id;
					$data1->course_sub_skill_id = $sub_skills_data;
					$data1->course_proficiency_level = $pre_skill;
					// echo "<pre>";
					// print_r($data1);
					$id = $DB->insert_record('course_proficiency_level',$data1);
				}
		}
		redirect(new moodle_url("/local/skills/courseskill.php"), "Course Skill Assign Successfull", null, \core\output\notification::NOTIFY_SUCCESS);
	}elseif($_POST['flg']=='update_courseSkill'){   // For Update course skill 
		$course_id = $_POST['course'];
		$skill_id = $_POST['skill'];
		$skill_proficiency_label = $_POST['skill_proficiency_label'];
	   $DB->execute("UPDATE {course_skill} SET skill_proficiency_label = '{$skill_proficiency_label}' WHERE skill_id = $skill_id AND course_id = $course_id");
		
		$course_ids = $DB->get_record_sql("SELECT id FROM {course_skill} where course_id IN ($course_id)");

		for ($j=0; $j <count($_POST['sub_skill_id']) ; $j++) { 

			$sub_skills_data = $_POST['sub_skill_id'][$j];
			$pre_skills_data = $_POST['proficiency_level'][$j];
			$assign_course_skill_id = $_POST['assign_course_skill_id'][$j];
			$pre_skill = substr($pre_skills_data,0,strpos($pre_skills_data,'-'));
         
			$assign_course_skill_id = $assign_course_skill_id;
			$course_skill_id = $skill_id;
			$course_sub_skill_id = $sub_skills_data;
			$course_proficiency_level = $pre_skill;
			
         $DB->execute("UPDATE {course_proficiency_level} SET course_proficiency_level = '{$course_proficiency_level}' WHERE id = $assign_course_skill_id ");	
		}
		redirect(new moodle_url("/local/skills/courseskill.php"), "Update Course Skill Successfull", null, \core\output\notification::NOTIFY_SUCCESS);
	}elseif($_POST['flg']=='skill_quiz_mapping'){   // For mapped quiz to skill
		$course_id = $_POST['course'];
			for($k=0; $k <count($_POST['skill']) ; $k++){
				$skill_id = $_POST['skill'][$k];
				$Skillsname = $DB->get_record_sql("SELECT id,skill FROM {skill} where id = $skill_id");
				$sub_skill_id = "subskillid".$Skillsname->id;
				$quiz_id = "quizid".$Skillsname->id;
				for ($j=0; $j <count($_POST[$sub_skill_id]) ; $j++) { 
					$sub_skills_data_id = $_POST[$sub_skill_id][$j];
					$quiz_data_id =$_POST[$quiz_id][$j];
					$quiz = new stdClass();
					$quiz->course_id = $course_id;
					$quiz->skill_id = $skill_id;
					$quiz->sub_skill_id = $sub_skills_data_id;
					$quiz->quiz_id  = $quiz_data_id;
					$id = $DB->insert_record('skill_quiz_mapping',$quiz);
				}
			}
		redirect(new moodle_url("/local/skills/skill_quiz_mapping.php"), "course skill quiz assinged Successfull", null, \core\output\notification::NOTIFY_SUCCESS);
	}elseif($_POST['flg']=='update_skill_quiz_mapping'){
		$course_id = $_POST['course'];
		for($k=0; $k <count($_POST['skill']) ; $k++){
			$skill_id = $_POST['skill'][$k];
			$Skillsname = $DB->get_record_sql("SELECT id,skill FROM {skill} where id = $skill_id");
			$upsub_skill_id = "subskillid".$Skillsname->id;  //For define sub skill unick id
			$quiz_id = "quizid".$Skillsname->id;             // For define  quiz id with skill name
			for ($j=0; $j <count($_POST[$quiz_id]); $j++) { 
				$sub_skills_data_id = $_POST[$upsub_skill_id][$j];
				$quiz_data_id =$_POST[$quiz_id][$j];
				$skill_id = $skill_id;
				$sub_skill_id = $sub_skills_data_id;
				$DB->execute("UPDATE {skill_quiz_mapping} SET quiz_id = '{$quiz_data_id}' WHERE course_id = $course_id AND skill_id = $skill_id AND sub_skill_id = $sub_skill_id");
			}
		}
		redirect(new moodle_url("/local/skills/skill_quiz_mapping.php"), "update skill quiz mapping Successfull", null, \core\output\notification::NOTIFY_SUCCESS);
	}elseif($_GET['flg']=='add_skill_weightage'){

	  //Add skill weightage
		if ($_POST['skill_proficiency']) {
			$skill_id = $_POST['skill'];
			$skill_proficiency = $_POST['skill_proficiency'];
			$default_course = $_POST['default_course'];
			$certificate_course=$_POST['skill_certificate_course'];
			$skill_weit = new stdClass();
			$skill_weit->skill_id = $skill_id;
			$skill_weit->skill_proficiency = $skill_proficiency;
			$skill_weit->default_course = $default_course;
			$skill_weit->certificate_course=$certificate_course;
			$skill_weit->id = $DB->insert_record('skill_weightage',$skill_weit);
			$inserted_id = $skill_weit->id; // inserted id 
		   
			if($inserted_id){
				for ($i=0; $i <count($_POST['sub_skill_id']) ; $i++){ 
					$sub_skill_id = $_POST['sub_skill_id'][$i];
					$sub_skill_proficiency =$_POST['sub_skill_proficiency'][$i];
					$skill_weit_meta = new stdClass();
					$skill_weit_meta->skill_weightage_id = $inserted_id;
					$skill_weit_meta->skill_id = $skill_id;
					$skill_weit_meta->sub_skill_id = $_POST['sub_skill_id'][$i];
					$skill_weit_meta->sub_skill_proficiency = $_POST['sub_skill_proficiency'][$i];
			
				   $skill_weit_meta->id = $DB->insert_record('skill_weightage_meta',$skill_weit_meta);
				}
				if($skill_weit_meta->id){
					$msg['status']=true;
					$msg['msg']="Added Successfully";
					echo json_encode($msg);
					die;
			    // redirect(new moodle_url("/local/skills/skill_weightage.php"), "Add  Successfull", null, \core\output\notification::NOTIFY_SUCCESS);
				}else{
					$msg['status']=false;
					$msg['msg']="Something wrong";
					echo json_encode($msg);
			     //redirect(new moodle_url("/local/skills/skill_weightage.php"), "Something Wrong", null, \core\output\notification::NOTIFY_ERROR);
				}
			}
		}
		else{
			$msg['status']=false;
					$msg['msg']="Something wrong";
					echo json_encode($msg);
			//redirect(new moodle_url("/local/skills/skill_weightage.php"), "please select skill and skill proficiency_level", null, \core\output\notification::NOTIFY_ERROR);
		}
   }elseif($_GET['flg']=='update_skill_weightage'){

      // upadte skill weightage
		if ($_POST['update_skill_proficiency']) {
			$certificate_course=$_POST['skill_certificate_course'];
			/*echo "<pre>";
			print_r($_POST);
			echo "</pre>";
			die;*/
			$default_course = $_POST['default_course'];
      	for ($k=0; $k <count($_POST['skill_wetg_id']); $k++){ 
				$default_course = $_POST['default_course'];
				$skill_wetg_id = $_POST['skill_wetg_id'][$k];
				$skill_proficiency = $_POST['update_skill_proficiency'][$k];
				$DB->execute("UPDATE {skill_weightage} SET skill_proficiency = '{$skill_proficiency}',default_course = '{$default_course}',certificate_course = '{$certificate_course}' WHERE id = $skill_wetg_id");

				$update_sub_skill_id_data = 'update_sub_skill_id'.$skill_wetg_id;
				$update_sub_skill_proficiency_data = 'update_sub_skill_proficiency'.$skill_wetg_id;
				for ($i=0; $i< count($_POST[$update_sub_skill_id_data]); $i++){ 
					$update_sub_skill_id = $_POST[$update_sub_skill_id_data][$i];
					$update_sub_skill_proficiency = $_POST[$update_sub_skill_proficiency_data][$i];

				 $DB->execute("UPDATE {skill_weightage_meta} SET sub_skill_proficiency = '{$update_sub_skill_proficiency}' WHERE skill_weightage_id = $skill_wetg_id AND sub_skill_id = $update_sub_skill_id");
				}
				   
			}
			//redirect(new moodle_url("/local/skills/skill_weightage.php"), "Updated Successfull", null, \core\output\notification::NOTIFY_SUCCESS);
			$msg['status']=true;
			$msg['msg']="Updated Successfull";
			echo json_encode($msg);
			die;
		}
		else{
			//redirect(new moodle_url("/local/skills/skill_weightage.php"), "Something wrong", null, \core\output\notification::NOTIFY_ERROR);
			$msg['status']=false;
			$msg['msg']="Something wrong";
			echo json_encode($msg);
			die;
		}
   }elseif($_POST['flg']=='assign_course_to_sub_skill'){  //Add course to sub skill
   	// 
		if ($_POST['course']) {
			$course_id = $_POST['course'];
			
			for ($i=0; $i <count($_POST['sub_skill_id']) ; $i++){ 
				$objdata = new stdClass();
				$objdata->course_id  = $course_id;
				$objdata->sub_skill_id = $_POST['sub_skill_id'][$i];
				$objdata->proficiency_id = $_POST['proficiency_id'][$i];

			
		
			   $objdata->id = $DB->insert_record('assign_course_sub_skill',$objdata);
			}
			if($objdata->id){
		     redirect(new moodle_url("/local/skills/assign_course_sub_skill.php"), "Add  Successfull", null, \core\output\notification::NOTIFY_SUCCESS);
			}else{
		     redirect(new moodle_url("/local/skills/assign_course_sub_skill.php"), "Something Wrong", null, \core\output\notification::NOTIFY_ERROR);
			}
		}
		else{
			redirect(new moodle_url("/local/skills/skill_weightage.php"), "please select skill and skill proficiency_level", null, \core\output\notification::NOTIFY_ERROR);
		}
   }elseif($_POST['flg']=='update_course_to_sub_skill'){  //Upadte course to sub skill
   	
		if ($_POST['update_course']) {
			$course_id = $_POST['update_course'];
			for ($i=0; $i <count($_POST['update_sub_skill_id']) ; $i++){ 
				
				$update_course_id  = $course_id;
				$update_sub_skill_id = $_POST['update_sub_skill_id'][$i];
				$update_proficiency_id = $_POST['update_proficiency_id'][$i];

		 		$updatedata->id = $DB->execute("UPDATE {assign_course_sub_skill} SET course_id = '{$update_course_id}',proficiency_id = '{$update_proficiency_id}' WHERE course_id = $course_id AND sub_skill_id = $update_sub_skill_id");
			}
		
		   redirect(new moodle_url("/local/skills/assign_course_sub_skill.php"), "Update  Successfull", null, \core\output\notification::NOTIFY_SUCCESS); 
		}
   }elseif($_POST['flg']=='learning_path_submit'){

   	$learning_path = $_POST['learning_path'];
   	$title = $_POST['title'];
   	$description = $_POST['description'];
   	$passing_criterion = $_POST['passing_criterion'];
   	
   	$dataObj = new stdClass();
		$dataObj->learning_path = $_POST['learning_path'];
		$dataObj->title = $_POST['title'];
		$dataObj->description = $_POST['description'];
		$dataObj->passing_criterion = $_POST['passing_criterion'];
		$dataObj->id = $DB->insert_record('learning_path',$dataObj);
		if($dataObj->id){
			redirect(new moodle_url("/local/skills/learning_path_form.php"), "inserted Successfull", null, \core\output\notification::NOTIFY_SUCCESS);
		}else{
			redirect(new moodle_url("/local/skills/skill_weightage.php"), "Something wrong", null, \core\output\notification::NOTIFY_ERROR);
		}
   }
   elseif($_POST['flg']=='learning_path_update'){
   	$id = $_POST['id'];
   	$learning_path = $_POST['learning_path'];
   	$title = $_POST['title'];
   	$description = $_POST['description'];
   	$passing_criterion = $_POST['passing_criterion'];	
   	$dataObj = new stdClass();
   	$dataObj->id = $id;
		$dataObj->learning_path = $_POST['learning_path'];
		$dataObj->title = $_POST['title'];
		$dataObj->description = $_POST['description'];
		$dataObj->passing_criterion = $_POST['passing_criterion'];	
      $dataObj->id = $DB->update_record('learning_path', $dataObj); 
		if($dataObj->id){
			redirect(new moodle_url("/local/skills/learning_path_form.php"), "updated Successfull", null, \core\output\notification::NOTIFY_SUCCESS);
		}else{
			redirect(new moodle_url("/local/skills/skill_weightage.php"), "Something wrong", null, \core\output\notification::NOTIFY_ERROR);
		}
   }
}
if($_GET){
	
	if ($_GET['flg']=='delete1') {  // For delete skill record
		$id = $_GET['id'];
	    $DB->execute("DELETE FROM {skill} WHERE id = '".$id."'");
      	redirect(new moodle_url("/local/skills/index.php"), "Deleted Successfull", null, \core\output\notification::NOTIFY_SUCCESS);
      
   }elseif($_GET['flg']=='delete2'){ //For delete sub skill list   
   	$id = $_GET['id'];
   	$DB->execute("DELETE FROM {sub_skill} WHERE id = '".$id."'");
      	redirect(new moodle_url("/local/skills/index.php"), "Deleted Successfull", null, \core\output\notification::NOTIFY_SUCCESS);
      
   }elseif($_GET['flg']=='delete_user_assigned_skill'){  // For delete assign_skill and skill_proficiency_level both
   	$id = $_GET['id'];
   	$DB->execute("DELETE {assign_skill} ,{skill_proficiency_level} FROM {assign_skill} INNER JOIN {skill_proficiency_level} ON {assign_skill}.id = {skill_proficiency_level}.assign_skill_id WHERE {skill_proficiency_level}.assign_skill_id = {$id} ");
      	redirect(new moodle_url("/local/skills/assignskill.php"), "Deleted Successfull", null, \core\output\notification::NOTIFY_SUCCESS);
      
   }elseif($_GET['flg']=='delete_course_assigned_skill'){
   	$id = $_GET['id'];
   	$DB->execute("DELETE {course_skill},{course_proficiency_level} FROM {course_skill} INNER JOIN {course_proficiency_level} ON {course_skill}.id = {course_proficiency_level}.assign_course_skill_id WHERE {course_proficiency_level}.assign_course_skill_id = {$id} ");
      	redirect(new moodle_url("/local/skills/courseskill.php"), "Deleted Successfull", null, \core\output\notification::NOTIFY_SUCCESS);     
   }elseif($_GET['flg']=='delete_mapped_quiz_skill'){
   	$id = $_GET['id'];
   	$course_id = $_GET['course_id'];
   	$DB->execute("DELETE FROM {skill_quiz_mapping} WHERE skill_id = $id AND course_id = $course_id");
      redirect(new moodle_url("/local/skills/skill_quiz_mapping.php"), "Deleted Successfull", null, \core\output\notification::NOTIFY_SUCCESS);
      
   }elseif($_GET['flg']=='delete_skill_weightage'){
   	$id = $_GET['id'];
   	$DB->execute("DELETE {skill_weightage},{skill_weightage_meta} FROM {skill_weightage} INNER JOIN {skill_weightage_meta} ON {skill_weightage}.id = {skill_weightage_meta}.skill_weightage_id WHERE {skill_weightage_meta}.skill_weightage_id = {$id} ");
      	redirect(new moodle_url("/local/skills/skill_weightage.php"), "Deleted Successfull", null, \core\output\notification::NOTIFY_SUCCESS);
      
   }elseif($_GET['flg']=='delete_learning_path') {
	    $DB->execute("DELETE FROM {delete_learning_path} WHERE id = '".$id."'");
      	redirect(new moodle_url("/local/skills/learning_path_form.php"), "Deleted Successfull", null, \core\output\notification::NOTIFY_SUCCESS);
      
   }elseif($_GET['flg']=='assign_sub_skill'){   // Display sub skill list 
   		$ids = $_GET['id'];
   		$skill = $DB->get_record_sql("SELECT * FROM {skill} where id = $ids");
      ?>  
      <div class="Skills">
		   <div class="skill_level"></div>
      	<input id="skill" type="hidden" value="<?=$skill->id?>">
         <input class="toggle-box" id="toggleId-<?=$skill->id?>" type="checkbox">
         <label for="toggleId-<?=$skill->id?>"><?=$skill->skill?></label>
         <div class="row toggle-box-content"> 
            <table class="table table-striped">
               <thead>
                  <tr>
                     <th scope="col">Sr No </th>
                     <th scope="col">Sub Skill</th>
                     <th scope="col">Proficiency Level</th> 
                  </tr>
               </thead>
               <tbody>
                  <?php 
                     $subSkills = $DB->get_records_sql("SELECT * FROM {sub_skill} where {sub_skill}.skill_id = $skill->id");
                     $i=1;
                     foreach($subSkills as $subSkill){
                  ?>
                  	<tr>
	                    <td scope="col"><?=$i?></td>
	                    <td scope="col"><?=$subSkill->sub_skills?><input type="hidden" name="sub_skill_id[]" value="<?=$subSkill->id?>">
	                    </td>
	                    <td>
			 					<select name="proficiency_level[]" class="form-control proficiency">
			 						<option value="">Select One </option>
			 						<option value="">None</option>
			 						<option value="Awareness-<?=$subSkill->id?>">Awareness</option>
			 						<option value="Knowledge-<?=$subSkill->id?>">Knowledge</option>
			 						<option value="Skilled-<?=$subSkill->id?>">Skilled</option>
			 						<option value="Mastery-<?=$subSkill->id?>">Mastery</option>
			 					</select>	
	                    </td>
                  	</tr>
                  <?php $i++; } ?>
               </tbody>
            </table>
         </div>
      </div>
      <script type="text/javascript">
   		var proficiency = [];   
	      $(".proficiency").change(function(){  // Assign level to skill
	         proficiency.push($(this).val());  
	         var id = $("#skill").val();
	         $.ajax({
	            type: "GET",
	            url: "<?php echo $CFG->wwwroot;?>"+"/local/skills/manage.php?id="+id+"&proficiency="+proficiency+"&flg=assin_level_of_skill",
	             //data: {'id': id,'audio': 'audio'},
	            contentType: "application/html",
	            dataType: "html",
	            success: function (result) {
	               //alert(result);
	               $('.skill_level').html(result);  
	               if(result){
                    $('.btn_prop').prop('disabled', false);	
	               } else{
    						$('.btn_prop').prop('disabled', true);
	               }
	            },
	            error: function (xhr, textStatus, errorThrown) { alert(textStatus + ':' + errorThrown); }
	        });
	      });
      </script>  	
	<?php }
	elseif($_GET['flg']=='exit_skill'){?>
		<select class="form-control" id="skill1" name="skill">
			<option>Select one</option>
         <?php  $skill_id_value = array();
	         $skills_ids = $DB->get_records_sql("SELECT skill_id FROM {assign_skill} where user_id = '".$_GET['id']."'");
          if(count($skills_ids)){
	         foreach($skills_ids as $skills_id){
	         	$skill_id_value[] = $skills_id->skill_id;
	         }
	         $ids = implode(",",$skill_id_value);
	         $skills = $DB->get_records_sql("SELECT * FROM {skill} WHERE id NOT IN (".$ids.")");
	      }
	      else{
	         $skills = $DB->get_records_sql("SELECT * FROM {skill} ");
	      }
	       
	         foreach($skills as $skill){
         ?>
         	<option value="<?=$skill->id?>"><?=$skill->skill?></option>

      	<?php } ?>
      </select>
      <script type="text/javascript">
	      $("#skill1").change(function(){
	         var id = $(this).val(); //skill_id
	        $.ajax({
	            type: "GET",
	             url: "<?php echo $CFG->wwwroot;?>"+"/local/skills/manage.php?id="+id+"&flg=assign_sub_skill",
	             //data: {'id': id,'audio': 'audio'},
	             contentType: "application/html",
	             dataType: "html",
	            success: function (result) {
	              // alert(result);
	               $('.sub_skill').html(result);
	            },
	            error: function (xhr, textStatus, errorThrown) { alert(textStatus + ':' + errorThrown); }
	        });
	      });
      </script>
	<?php 
	}elseif($_GET['flg']=='browse_exit_skill'){ ?>
		<select class="form-control" id="browse_skill" name="skill">
			<option>Select one</option>
         <?php 
         $skills_ids = $DB->get_records_sql("SELECT skill_id FROM {assign_skill} where user_id = '".$_GET['id']."'");
         
         if(count($skills_ids)){
	         foreach($skills_ids as $skills_id){
	         	$skill_id_value[] = $skills_id->skill_id;
	         }
	         $ids = implode(",",$skill_id_value);
	         $skills = $DB->get_records_sql("SELECT * FROM {skill} WHERE id IN (".$ids.")");
	      }
	      else{
	         $skills = $DB->get_records_sql("SELECT * FROM {skill} ");
	      }
	       
	         foreach($skills as $skill){
         ?>
         	<option value="<?=$skill->id?>"><?=$skill->skill?></option>

      	<?php } ?>
      </select>
      <script type="text/javascript">
	      $("#browse_skill").change(function(){
	         var skill_id = $(this).val(); 
	         var user_id = $("#update_user").val();
	        $.ajax({
	            type: "GET",
	             url: "<?php echo $CFG->wwwroot;?>"+"/local/skills/manage.php?skill_id="+skill_id+"&user_id="+user_id+"&flg=browse_assign_sub_skill",
	             //data: {'id': id,'audio': 'audio'},
	             contentType: "application/html",
	             dataType: "html",
	            success: function (result) {
	              // alert(result);
	               $('.browse_sub_skill').html(result);
	            },
	            error: function (xhr, textStatus, errorThrown) { alert(textStatus + ':' + errorThrown); }
	        });
	      });
      </script>
	<?php 
	}elseif($_GET['flg']=='browse_assign_sub_skill'){
   		$skill_id = $_GET['skill_id'];
   		$user_id = $_GET['user_id'];
	      $skills = $DB->get_record_sql("SELECT * FROM {skill} WHERE id = $skill_id ");
	  
	      $user_assign_skill_id = $DB->get_record_sql("SELECT skill_weightage_id,id,skill_proficiency_label FROM {assign_skill} where skill_id = $skill_id AND user_id = $user_id");
      ?> 
		   <div class="Skills">
		   	<div class="skill_level" id="up_pro"><?=$user_assign_skill_id->skill_proficiency_label?></div>
		   	<div class="skill_level" ></div>
		      <div class="tresh">
		      	<a onClick="javascript: return confirm('Are you sure to delete');" href="manage.php?flg=delete_user_assigned_skill&id=<?=$user_assign_skill_id->id?>" class="btn btn-primary" class="btn btn-primary delete" ><i class="fa fa-trash-o"></i>
		      	</a>
		      </div>
		      <input type="hidden" name="skill_proficiency_label" class="course_skill_proficiency_label" value="<?=$user_assign_skill_id->skill_proficiency_label?>">
		      <input class="toggle-box" id="toggleId-<?=$skills->id?>" type="checkbox">
 				<label class="heading"  for="toggleId-<?=$skills->id?>"><?=$skills->skill?> </label>
         	<div class="row toggle-box-content"> 
	            <table class="table table-striped">
	               <thead>
	                  <tr>
	                     <th scope="col">Sr No </th>
	                     <th scope="col">Sub Skill</th>
	                     <th scope="col">Proficiency Level</th>
	                  </tr>
	               </thead>
	               <tbody>
	               	<input type="hidden" id="skill" name="skill" value="<?=$skills->id?>">
	               	<input type="hidden" name="weightage_id" id="updateweightage_id" value="<?php echo $user_assign_skill_id->skill_weightage_id; ?>">
	                  <?php 
	                     $subSkills = $DB->get_records_sql("SELECT * FROM {sub_skill} where {sub_skill}.skill_id = $skills->id");
	                     $i=1;
	                     foreach($subSkills as $subSkill){
								$prof_lavel_value = $DB->get_record_sql("SELECT id,proficiency_level,sub_skill_id  FROM {skill_proficiency_level} where assign_skill_id = $user_assign_skill_id->id AND skill_id = $skills->id AND sub_skill_id = $subSkill->id");
	                  ?>
	                  	<tr>
		                    <td scope="col"><?=$i?></td>
		                    <td scope="col"><?=$subSkill->sub_skills?><input type="hidden" name="sub_skill_id[]" value="<?=$prof_lavel_value->sub_skill_id?>">
		                    	<input type="hidden" name="assign_skill_id[]" value="<?=$prof_lavel_value->id?>">
		                    </td>
		                    <td>
					 					<select name="proficiency_level[]" class="form-control proficiency">
					 						<option value="">None</option>
					 						<option value="Awareness-<?=$subSkill->id?>" <?php if($prof_lavel_value->proficiency_level=="Awareness") echo 'selected'; ?>>Awareness</option>

					 						<option value="Knowledge-<?=$subSkill->id?>" <?php if($prof_lavel_value->proficiency_level=="Knowledge") echo 'selected';?>>Knowledge</option>

					 						<option value="Skilled-<?=$subSkill->id?>" <?php if($prof_lavel_value->proficiency_level=="Skilled") echo 'selected';?>>Skilled</option>

					 						<option value="Mastery-<?=$subSkill->id?>" <?php if($prof_lavel_value->proficiency_level=="Mastery") echo 'selected';?>>Mastery</option>
					 					</select>	
		                    </td>
	                  	</tr>
	                  <?php $i++; }?>
	               </tbody>
	            </table>
         	</div>
       	</div>
       	<script type="text/javascript">
      		var proficiency = []; 
		      $(".proficiency").change(function(){  // Assign level to skill update sub skill profiency labe
		         proficiency.push($(this).val()); 
		         var id = $("#skill").val();
		         $.ajax({
		            type: "GET",
		            url: "<?php echo $CFG->wwwroot;?>"+"/local/skills/manage.php?id="+id+"&proficiency="+proficiency+"&flg=assin_level_of_skill",
		            contentType: "application/html",
		            dataType: "html",
		            success: function (result) {
		               $('.skill_level').html(result);  
		               var v = $(".skill_proficiency").val();
		               $(".course_skill_proficiency_label").val(v);
		               if(result){
		               	$("#up_pro").hide();
                       $('.update_btn_prop').prop('disabled', false);	
		               } else{
		               	$("#up_pro").show();
       						$('.update_btn_prop').prop('disabled', true);
		               }
		            },
		            error: function (xhr, textStatus, errorThrown) { alert(textStatus + ':' + errorThrown); }
		        });
		      });
      	</script>
   <?php } 	
   elseif($_GET['flg']=='exit_course_skill'){ // display assgned skill to course  ?> 
		<select class="form-control" id="skill" name="skill" >
			<option>Select One</option>
         <?php 
          	$skills_ids = $DB->get_records_sql("SELECT skill_id FROM {course_skill} where  course_id IN (".$_GET['id'].")");
          	if(count($skills_ids)){
		         foreach($skills_ids as $skills_id){
		         	$skill_id_value[] = $skills_id->skill_id;
		         }
	         	$ids = implode(",",$skill_id_value);
	         	$skills = $DB->get_records_sql("SELECT * FROM {skill} WHERE id NOT IN (".$ids.")");
	      	}
		      else{
		         $skills = $DB->get_records_sql("SELECT * FROM {skill} ");
		      }
            foreach($skills as $skill){
         ?>
             <option value="<?=$skill->id?>"><?=$skill->skill?></option> 
     		 <?php } ?>
      </select> 
      <script type="text/javascript">
      	$("#skill").change(function(){
         	var id = $(this).val();
           	$.ajax({
               type: "GET",
                url: "<?php echo $CFG->wwwroot;?>"+"/local/skills/manage.php?id="+id+"&flg=assign_sub_skill_course",
                contentType: "application/html",
                dataType: "html",
               success: function (result) {
                  $('.sub_skill').html(result);
               },
               error: function (xhr, textStatus, errorThrown) { alert(textStatus + ':' + errorThrown); }
           });
      	});
      </script>
	<?php }
	elseif($_GET['flg']=='assign_sub_skill_course'){   // For assign sub skill to course
		$ids = $_GET['id'];
		$skills = $DB->get_records_sql("SELECT * FROM {skill} where id IN (".$ids.")");
      foreach($skills as $skill){ ?>
      <div class="Skills">
		   <div class="skill_level"> </div>
         <input id="skill" type="hidden" value="<?=$skill->id?>">
         <input class="toggle-box" id="toggleId-<?=$skill->id?>" type="checkbox">
         <label for="toggleId-<?=$skill->id?>"><?=$skill->skill?> </label>
         <div class="row toggle-box-content"> 
            <table class="table table-striped">
               <thead>
                  <tr>
                     <th scope="col">Sr No </th>
                     <th scope="col">Sub Skill</th>
                     <th scope="col">Proficiency Level </th> 
                  </tr>
               </thead>
               <tbody>
                  <?php 
                     $subSkills = $DB->get_records_sql("SELECT * FROM {sub_skill} where {sub_skill}.skill_id = $skill->id");
                     $i=1;
                     foreach($subSkills as $subSkill){
                  ?>
                  	<tr>
	                    <td scope="col"><?=$i?></td>
	                    <td scope="col"><?=$subSkill->sub_skills?><input type="hidden" name="sub_skill_id[]" value="<?=$subSkill->id?>" class="sub_skill_id"></td>
	                    <td>
			 					<select name="proficiency_level[]" class="form-control proficiency">
			 						<option value="">Select One </option>
			 						<option value=""> None </option>
			 						<option value="Awareness-<?=$subSkill->id?>">Awareness</option>
			 						<option value="Knowledge-<?=$subSkill->id?>">Knowledge</option>
			 						<option value="Skilled-<?=$subSkill->id?>">Skilled</option>
			 						<option value="Mastery-<?=$subSkill->id?>">Mastery</option>
			 					</select>	
	                    </td>
                  	</tr>
                  <?php $i++; } ?>
               </tbody>
            </table>
         </div>
      </div>
      <?php } ?>
       	<script type="text/javascript">
      		var proficiency = [];    
		      $(".proficiency").change(function(){  // Assign level to skill
		         proficiency.push($(this).val());  
		         var id = $("#skill").val();
		         $.ajax({
		            type: "GET",
		            url: "<?php echo $CFG->wwwroot;?>"+"/local/skills/manage.php?id="+id+"&proficiency="+proficiency+"&flg=assin_level_of_skill",
		            contentType: "application/html",
		            dataType: "html",
		            success: function (result) {
		               $('.skill_level').html(result);
		               if(result){
                       $('.btn_prop').prop('disabled', false);	
		               } else{
       						$('.btn_prop').prop('disabled', true);
		               }
		            },
		            error: function (xhr, textStatus, errorThrown) { alert(textStatus + ':' + errorThrown); }
		        });
		      });
      	</script> 
		<?php	
		}elseif($_GET['flg']=='update_exit_course_skill'){ ?>
		<select class="form-control" id="update_skill" name="skill" >
			<option>Select One</option>
         <?php 
          	$skills_ids = $DB->get_records_sql("SELECT skill_id FROM {course_skill} where  course_id IN (".$_GET['id'].")");
          		$skill_id_value = array();
          	if(count($skills_ids)){
		         foreach($skills_ids as $skills_id){
		         	$skill_id_value[] = $skills_id->skill_id;
		         }
	         	$ids = implode(",",$skill_id_value);
	         	$skills = $DB->get_records_sql("SELECT * FROM {skill} WHERE id IN (".$ids.")");
	      	}
		      else{
		         $skills = $DB->get_records_sql("SELECT * FROM {skill}");
		      }
            foreach($skills as $skill){
         ?>
              <option value="<?=$skill->id?>"><?=$skill->skill?></option>  
     		 <?php } ?>
      </select> 
      <script type="text/javascript">
      	$("#update_skill").change(function(){
         	var skill_id = $(this).val();
         	var course_id = $("#update_course").val();
           	$.ajax({
               type: "GET",
                url: "<?php echo $CFG->wwwroot;?>"+"/local/skills/manage.php?skil_id="+skill_id+"&course_id="+course_id+"&flg=update_course_skill",
                contentType: "application/html",
                dataType: "html",
               success: function (result) {
                  $('.upadte_sub_skill').html(result);
               },
               error: function (xhr, textStatus, errorThrown) { alert(textStatus + ':' + errorThrown); }
           });
      	});
      </script>
		<?php 
	}elseif($_GET['flg']=='update_course_skill'){
   		$course_id = $_GET['course_id'];
   		$skill_id = $_GET['skil_id'];
   		$skills = $DB->get_record_sql("SELECT * FROM {skill} WHERE id = $skill_id ");
	      $course_assign_skill_id = $DB->get_record_sql("SELECT id,skill_proficiency_label FROM {course_skill} where skill_id = $skill_id AND course_id = $course_id");
      ?>
      <div class="Skills">
      	<div class="skill_level" id="up_pro_cor"><?=$course_assign_skill_id->skill_proficiency_label?></div>
		   <div class="skill_level"></div>
	      <div class="tresh">
	      	 <a onClick="javascript: return confirm('Are you sure to delete');" href="manage.php?flg=delete_course_assigned_skill&id=<?=$course_assign_skill_id->id?>" class="btn btn-primary" class="btn btn-primary delete" ><i class="fa fa-trash-o"></i></a>
	      </div>
	       <input type="hidden" name="skill_proficiency_label" class="skill_proficiency_label" value="<?=$course_assign_skill_id->skill_proficiency_label?>">
         <input id="update_skill" type="hidden" value="<?=$skills->id?>">
	      <input class="toggle-box" id="toggleId-<?=$skills->id?>" type="checkbox">
	      <label for="toggleId-<?=$skills->id?>"><?=$skills->skill?> </label>
         <div class="row toggle-box-content"> 
            <table class="table table-striped">
               <thead>
                  <tr>
                     <th scope="col">Sr No </th>
                     <th scope="col">Sub Skill</th>
                     <th scope="col">Proficiency Level </th> 
                  </tr>
               </thead>
               <tbody>
                  <?php 
                     $subSkills = $DB->get_records_sql("SELECT * FROM {sub_skill} where {sub_skill}.skill_id = $skills->id");
                     $i=1;
                     foreach($subSkills as $subSkill){
                     	
							$prof_lavel_value = $DB->get_record_sql("SELECT id,course_sub_skill_id,course_proficiency_level FROM {course_proficiency_level} where assign_course_skill_id = $course_assign_skill_id->id AND course_skill_id = $skills->id AND course_sub_skill_id = $subSkill->id");
                  ?>
               	<tr>
                    <td scope="col"><?=$i?></td>
                    <td scope="col"><?=$subSkill->sub_skills?><input type="hidden" name="sub_skill_id[]" value="<?=$prof_lavel_value->course_sub_skill_id ?>">
                    		<input type="hidden" name="assign_course_skill_id[]" value="<?=$prof_lavel_value->id?>">
                    </td>
                    <td>
		 					<select name="proficiency_level[]" class="form-control course_proficiency">
			 						<option value=" ">None</option>
			 						<option value="Awareness-<?=$subSkill->id?>" <?php if($prof_lavel_value->course_proficiency_level=="Awareness") echo 'selected'; ?>>Awareness</option>

			 						<option value="Knowledge-<?=$subSkill->id?>" <?php if($prof_lavel_value->course_proficiency_level=="Knowledge") echo 'selected'; ?>>Knowledge</option>

			 						<option value="Skilled-<?=$subSkill->id?>" <?php if($prof_lavel_value->course_proficiency_level=="Skilled") echo 'selected'; ?>>Skilled</option>

			 						<option value="Mastery-<?=$subSkill->id?>" <?php if($prof_lavel_value->course_proficiency_level=="Mastery") echo 'selected'; ?>>Mastery</option>
			 					</select>	
                    </td>
               	</tr>                  
               	<?php $i++; } ?>
               </tbody>
            </table>
         </div>
      </div>
      <script type="text/javascript">
   		var proficiency = [];    
	      $(".course_proficiency").change(function(){  // Assign level to skill
	         proficiency.push($(this).val());  
	         var skill_id = $("#update_skill").val();
	         $.ajax({
	            type: "GET",
	            url: "<?php echo $CFG->wwwroot;?>"+"/local/skills/manage.php?id="+skill_id+"&proficiency="+proficiency+"&flg=assin_level_of_skill",
	            contentType: "application/html",
	            dataType: "html",
	            success: function (result) {
	                 $('.skill_level').html(result);  
		               var v = $(".skill_proficiency").val();
		               $(".skill_proficiency_label").val(v);
	               if(result){
	               	
	               	$("#up_pro_cor").hide();
                     $(".update_btn_prop").prop('disabled',false);	
	               } else{
	               	// alert("ont ok");
	              	   $("#up_pro_cor").show();
    						$(".update_btn_prop").prop('disabled', true);
	               }
	            },
	            error: function (xhr, textStatus, errorThrown) { alert(textStatus + ':' + errorThrown); }
	        });
	      });
   	</script> 
  <?php 	}elseif($_GET['flg']=='assin_level_of_skill'){
			$id = $_GET['id'];
			$proficiency = $_GET['proficiency'];
	
			$arr = (explode(",",$proficiency));   // profiency value
			
			$new = (array_reverse($arr));         // reverse profiency value 

			$check_skill_weightage_id = 0;
			$check = array();

			$check_counter = 0;
			$wt = array();                      // value of proficeny-1         
			$dub_new = $new;
 			for($j=0; $j<count($dub_new); $j++) {

				$weightage_value = explode('-',$dub_new[$j]);
				array_push($wt,$weightage_value[1]);
			}
	
			$unick_key = array();
			$wt_key = array();
			$unk = array_unique($wt);     // remove dublicay of array

        foreach ($unk as $key => $val) {     //   index value of unique array 
        	array_push($unick_key,$key);
        }
 		 
 		   foreach ($wt as $key => $value) {
 		   	array_push($wt_key,$key);            // index value of total profiency value
 		   }
 		 
 		   $co = array_diff($wt_key,$unick_key);     // different of unique array and total

			 $result = array();
			 
			foreach($co as $val => $c){
			   array_push($result,$val);           // push different value of key
			}

         $another_new = $new;

			if(!(empty($result))){
			 	foreach ($result as $key => $value) {     
			 		unset($another_new[$value]);              // remove array with finde differnt value 
			 	}
				$re_index = array_values($another_new);		// re-endex of array 		 
				$new = $re_index;
			}
			 
			for($i=0; $i<count($new); $i++) {

				$prof_value = explode('-',$new[$i]);

				$skills_weigh_lists = $DB->get_records_sql("SELECT skill_weightage_id FROM {skill_weightage_meta} WHERE skill_id = $id AND sub_skill_id = $prof_value[1] AND sub_skill_proficiency = '{$prof_value[0]}' ");
				foreach($skills_weigh_lists as $skills_weigh_list){
					array_push($check, $skills_weigh_list->skill_weightage_id);
				}

				if($check_skill_weightage_id == $skills_weigh_list->skill_weightage_id) {
					$check_counter = $check_counter + 1;
				}
				if($i<count($new)) {
					$check_skill_weightage_id = $skills_weigh_list->skill_weightage_id;
					$check_counter = $check_counter + 1;
				}	
			}
			   $c = array_count_values($check); 
				$val = array_search(max($c), $c);
             
				if($c[$val] > 2) {
	        		$skill_proficiencys = $DB->get_record_sql("SELECT id,skill_proficiency  FROM {skill_weightage} WHERE id = $val");
	        		?>
	        		<h5><?=$skill_proficiencys->skill_proficiency;?>
	        		<script type="text/javascript">
	        			document.getElementById("updateweightage_id").value = "<?php echo $skill_proficiencys->id;?>";
	        		</script>
	        			<input type="hidden" name="weightage_id" value="<?php echo $skill_proficiencys->id; ?>">
	        			<input type="hidden" name="skill_proficiency_label" class="skill_proficiency" value="<?=$skill_proficiencys->skill_proficiency;?>">
	        		</h5>
	         <?php }
		}
	elseif($_GET['flg']=='mapped_quiz_skill'){
	   $ids = $_GET['id'];
		$course_id = $_GET['course_id'];
		$mapped_skills_ids = $DB->get_record_sql("SELECT DISTINCT skill_id FROM {skill_quiz_mapping} where course_id = $course_id AND skill_id IN (".$ids.")");
			if ($mapped_skills_ids->skill_id == $ids) {
				echo "Already assigned quizs";
			}else{
				$skills = $DB->get_records_sql("SELECT * FROM {skill} where id IN (".$ids.")");
      		foreach($skills as $skill){ ?>
		         <input class="toggle-box" id="toggleId-<?=$skill->id?>" type="checkbox">
		         <label for="toggleId-<?=$skill->id?>"><?=$skill->skill?> <?=$mapped_skills_ids->skill_id?></label>
		         <div class="row toggle-box-content"> 
		            <table class="table table-striped">
		               <thead>
		                  <tr>
		                     <th scope="col">Sr No </th>
		                     <th scope="col">Sub Skill</th>
		                     <th scope="col">Quiz</th> 
		                  </tr>
		               </thead>
		               <tbody>
		                  <?php 
		                     $subSkills = $DB->get_records_sql("SELECT * FROM {sub_skill} where {sub_skill}.skill_id = $skill->id");
		                     $i=1;
		                     foreach($subSkills as $subSkill){
		                     	$Skillsname = $DB->get_record_sql("SELECT id,skill FROM {skill} where id = $subSkill->skill_id");
		                  ?>
		                  	<tr>
			                    <td scope="col"><?=$i?></td>
			                    <td scope="col"><?=$subSkill->sub_skills?><input type="hidden" name="subskillid<?=$Skillsname->id;?>[]" value="<?=$subSkill->id?>"></td>
			                    <td>
					 					<select name="quizid<?=$Skillsname->id;?>[]" class="form-control"> 
					 						<option value="">Select one</option>
					 						<?php 
		                           $quizs = $DB->get_records_sql("SELECT * FROM {quiz} where course = $course_id");  
		                              foreach($quizs as $quiz){
		                           ?>
		                              <option value="<?=$quiz->id?>"><?=$quiz->name?> </option> 
		                            <?php } ?>
					 					</select>	
			                    </td>
		                  	</tr>
		                
		                  <?php $i++; } ?>
		               </tbody>
		            </table>
		         </div>
      			<?php 
            } 			
         }
	}elseif($_GET['flg']=='mapped_course_skill'){ ?>
		<input type="hidden" name="course_id" id="course_id" value="<?=$_GET['id']?>">
		<select class="form-control" id="skill" name="skill[]" multiple>
         <?php 
          	$skills_ids = $DB->get_records_sql("SELECT DISTINCT skill_id FROM {skill_weightage} where default_course IN (".$_GET['id'].")");
          	if(count($skills_ids)){
		         foreach($skills_ids as $skills_id){
		         	$skill_id_value[] = $skills_id->skill_id;
		         }
	         	$ids = implode(",",$skill_id_value);
	         	$skills = $DB->get_records_sql("SELECT * FROM {skill} WHERE id IN (".$ids.")");
	      	}
		      else{
		         $skills = $DB->get_records_sql("SELECT * FROM {skill} ");
		      }
            foreach($skills as $skill){ ?>
            <option value="<?=$skill->id?>"><?=$skill->skill?></option> 
     		<?php } ?>
      </select> 
      <script type="text/javascript">
      	$("#skill").click(function(){
	         var id = $(this).val();
	         var course_id = $("#course_id").val();
           	$.ajax({
               type: "GET",
                url: "<?php echo $CFG->wwwroot;?>"+"/local/skills/manage.php?id="+id+"&course_id="+course_id+"&flg=mapped_quiz_skill",
                contentType: "application/html",
                dataType: "html",
               success: function (result) {
                  $('.sub_skill').html(result);
               },
               error: function (xhr, textStatus, errorThrown) { alert(textStatus + ':' + errorThrown); }
           });
         });
      </script>
	<?php }
	elseif($_GET['flg']=='update_mapped_course_skill'){ ?>
		<input type="hidden" name="course_id" id="update_course_id" value="<?=$_GET['id']?>">
		<select class="form-control" id="update_skill" name="skill[]" multiple>
         <?php 
          	$skills_ids = $DB->get_records_sql("SELECT DISTINCT {skill_quiz_mapping}.skill_id  FROM {skill_quiz_mapping} where course_id IN (".$_GET['id'].")");
          	if(count($skills_ids)){
		         foreach($skills_ids as $skills_id){
		         	$skill_id_value[] = $skills_id->skill_id;
		         }
	         	$ids = implode(",",$skill_id_value);
	         	$skills = $DB->get_records_sql("SELECT * FROM {skill} WHERE id IN (".$ids.")");
	      	}
		      else{
		         $skills = $DB->get_records_sql("SELECT * FROM {skill} ");
		      }
            foreach($skills as $skill){ ?>
             <option value="<?=$skill->id?>"><?=$skill->skill?></option> 
     		 <?php } ?>
      </select> 
      <script type="text/javascript">
      	$("#update_skill").click(function(){
         	var id = $(this).val();
         	var course_id = $("#update_course_id").val();
           	$.ajax({
               type: "GET",
                url: "<?php echo $CFG->wwwroot;?>"+"/local/skills/manage.php?id="+id+"&course_id="+course_id+"&flg=update_mapped_quiz_skill",
                contentType: "application/html",
                dataType: "html",
               success: function (result) {
                  $('.update_sub_skill').html(result);
               },
               error: function (xhr, textStatus, errorThrown) { alert(textStatus + ':' + errorThrown); }
           	});
     		});
      </script>
	<?php }elseif($_GET['flg']=='update_mapped_quiz_skill'){
   		$ids = $_GET['id'];
   		$course_id = $_GET['course_id'];
   		$skills = $DB->get_records_sql("SELECT * FROM {skill} where id IN (".$ids.")");
         foreach($skills as $skill){ ?>
         <div class="row">
	      	<div class="col-sm-6">
		         <input class="toggle-box" id="toggleId-<?=$skill->id?>" type="checkbox">
		         <label for="toggleId-<?=$skill->id?>"><?=$skill->skill?> </label>
		      </div>
		      <div class="col-sm-6">
		       	 <a onClick="javascript: return confirm('Are you sure to delete');" href="manage.php?flg=delete_mapped_quiz_skill&id=<?=$skill->id?>&course_id=<?=$course_id?>" class="btn btn-primary" class="btn btn-primary delete" ><i class="fa fa-trash-o"></i></a>
		      </div>
         </div>
         <div class="row toggle-box-content"> 
            <table class="table table-striped">
               <thead>
                  <tr>
                     <th scope="col">Sr No </th>
                     <th scope="col">Sub Skill</th>
                     <th scope="col">Quiz</th> 
                  </tr>
               </thead>
               <tbody>
                  <?php 
                     $subSkills = $DB->get_records_sql("SELECT * FROM {sub_skill} where {sub_skill}.skill_id = $skill->id");
                     $i=1;
                     foreach($subSkills as $subSkill){
                     	$Skillsname = $DB->get_record_sql("SELECT id,skill FROM {skill} where id = $subSkill->skill_id");
							$quiz_value = $DB->get_record_sql("SELECT id,quiz_id FROM {skill_quiz_mapping} where course_id = $course_id AND skill_id = $skill->id AND sub_skill_id = $subSkill->id");
                  ?>
                  	<tr>
	                    <td scope="col"><?=$i?></td>
	                    <td scope="col"><?=$subSkill->sub_skills?><input type="hidden" name="subskillid<?=$Skillsname->id;?>[]" value="<?=$subSkill->id?>"></td>
	                    <td>
			 					<select name="quizid<?=$Skillsname->id;?>[]" class="form-control"> 
			 						
			 						<?php 
                           $quizs = $DB->get_records_sql("SELECT * FROM {quiz} where course = $course_id"); 

                              foreach($quizs as $quiz){
                           ?>
                           <option value="<?=$quiz->id?>" <?php if($quiz_value->quiz_id == $quiz->id) echo 'selected' ?>  ><?=$quiz->name?> </option> 
				 						
                            <?php } ?>
			 					</select>	
	                    </td>
                  	</tr>
                  <?php $i++; } ?>
               </tbody>
            </table>
         </div>
      <?php } 	
	}elseif($_GET['flg']=='skill_weightage'){  /// skill weightage for sub skill with lavel
		$ids = $_GET['id']; // skill id
 		$skills = $DB->get_records_sql("SELECT * FROM {skill} where id = $ids");
	   foreach($skills as $skill){ ?>
	      <div class="edit_weightage Skills">
	         <div class="tresh">
	            <select name="skill_proficiency" class="form-control" required>
	               <!-- <option value="">Select One </option> -->
	               <option value="Awareness">Awareness</option>
	               <option value="Knowledge">Knowledge</option>
	               <option value="Skilled">Skilled</option>
	               <option value="Mastery">Mastery</option>
	            </select>
	         </div>
		      <input class="toggle-box" id="toggleId-<?=$skill->id?>" type="checkbox">
		      <label for="toggleId-<?=$skill->id?>"><?=$skill->skill?> </label>
		         <div class="row toggle-box-content"> 
		            <table class="table table-striped">
		               <thead>
		                  <tr>
		                     <th scope="col">Sr No </th>
		                     <th scope="col">Sub Skill</th>
		                     <th scope="col">Proficiency Level </th> 
		                  </tr>
		               </thead>
		               <tbody>
		                  <?php 
		                     $subSkills = $DB->get_records_sql("SELECT * FROM {sub_skill} where {sub_skill}.skill_id = $skill->id");
		                     $i=1;
		                     foreach($subSkills as $subSkill){
		                     	$Skillsname = $DB->get_record_sql("SELECT skill FROM {skill} where id = $subSkill->skill_id");?>
		                  	<tr>
			                     <td scope="col"><?=$i?></td>
			                     <td scope="col"><?=$subSkill->sub_skills?> 
			                     	<input type="hidden" name="sub_skill_id[]" value="<?=$subSkill->id?>">
			                     </td>
			                     <td>
					 					<select name="sub_skill_proficiency[]" class="form-control">
					 						<option value="">None </option>
					 						<option value="Awareness">Awareness</option>
					 						<option value="Knowledge">Knowledge</option>
					 						<option value="Skilled">Skilled</option>
					 						<option value="Mastery">Mastery</option>
					 					</select>	
			                    </td>
		                  	</tr>
		                  <?php $i++; } ?>
		               </tbody>
		            </table>
		         </div><br>
		   	</div> 
	   <?php } 	  
	}elseif($_GET['flg']=='assigned_default_course'){ 
	$skill_id = $_GET['id']; 
		$defaul_category_sql="SELECT * FROM {course_category_settings}";
		$defaul_category_data=$DB->get_record_sql($defaul_category_sql,array());
		$default_course_category_id=null;
		$certificate_course_category_id=null;
		if(!empty($defaul_category_data)){
			$default_course_category_id=$defaul_category_data->default_course_category;
			$certificate_course_category_id=$defaul_category_data->certificate_course_category;
		}
	?>
	<div class="col-sm-6">
		<label>default Course</label>
		<select class="form-control" id="default_course" name="default_course">
         <option value="">Select one</option> 
          <?php 
				$cours_id = $DB->get_record_sql("SELECT DISTINCT {skill_weightage}.default_course,{course}.fullname,{course}.id FROM {course} INNER JOIN {skill_weightage} ON {course}.id = {skill_weightage}.default_course where {skill_weightage}.skill_id = $skill_id");
    
            $course_sql="SELECT c.id,c.fullname FROM {course} c JOIN {course_categories} cc on cc.id=c.category WHERE c.visible=? AND cc.visible=? AND cc.id=?";
            $courses=$DB->get_records_sql($course_sql,array(1,1,$default_course_category_id));

            foreach($courses as $course){
         ?>
         	<option value="<?=$course->id?>"<?php if ($cours_id->id == $course->id) echo 'selected'?> ><?=$course->fullname ?></option>
         <?php } ?>
      </select>
      </div>

      <div class="col-sm-6">
      	<label>Skill based certificate course</label>
		<select class="form-control" id="skill_certificate_course" name="skill_certificate_course" >
         <option value="">Select one</option> 
          <?php 
				$cours_id = $DB->get_record_sql("SELECT DISTINCT {skill_weightage}.certificate_course,{course}.fullname,{course}.id FROM {course} INNER JOIN {skill_weightage} ON {course}.id = {skill_weightage}.certificate_course where {skill_weightage}.skill_id = $skill_id");
           // $courses = $DB->get_records_sql("SELECT * FROM {course} order by id DESC");
            $course_sql="SELECT c.id,c.fullname FROM {course} c JOIN {course_categories} cc on cc.id=c.category WHERE c.visible=? AND cc.visible=? AND cc.id=?";
            $courses=$DB->get_records_sql($course_sql,array(1,1,$certificate_course_category_id));

            foreach($courses as $course){
         ?>
         	<option value="<?=$course->id?>"<?php if ($cours_id->id == $course->id) echo 'selected'?> ><?=$course->fullname ?></option>
         <?php } ?>
      </select>
      </div>
	<?php 
	}elseif($_GET['flg'] == "update_assigned_course_to_sub_skill"){
   	$course_id = $_GET['course_id'];

   	$assign_course = $DB->get_record_sql("SELECT course_id FROM {assign_course_sub_skill} where course_id = $course_id");
   	if($assign_course->course_id == $course_id){
   	?>
   		<div class="form-group">
	      <label class="control-label" for="course">Course:</label>
	      <select class="form-control" id="update_course" name="update_course">
	         <option> Select One </option>
	         <?php
	            $courses = $DB->get_records_sql("SELECT * FROM {course} ");
	            foreach($courses as $course){
	         ?>
	         <option value="<?=$course->id?>" <?php if($assign_course->course_id == $course->id) echo 'selected'?>><?=$course->fullname ?>
	         	
	         </option>
	         <?php } ?>
	      </select> 
	      </div>
		   <div class="form-group">
		      <div class="toggle-box-region sub_skill" >
		         <label class="control-label" for="skill"> Sub Skill: </label>	        
	            <div class="row toggle-box-content"> 
	               <table class="table table-striped">
	                  <thead>
	                     <tr>
	                        <th scope="col">Sr No </th>
	                        <th scope="col">Sub Skill</th>
	                        <th scope="col">Proficiency Level</th> 
	                     </tr>
	                  </thead>
	                  <tbody>
	                     <?php 
	                        $subSkills = $DB->get_records_sql("SELECT * FROM {sub_skill}");
	                        $i=1;
	                        foreach($subSkills as $subSkill){
	                     ?>
	                        <tr>
	                          	<td scope="col"><?=$i?></td>
	                          	<td scope="col"><?=$subSkill->sub_skills?>
	                          	<input type="hidden" name="update_sub_skill_id[]" value="<?=$subSkill->id?>">
	                          	</td>
	                          	<td>
	                            <select name="update_proficiency_id[]" class="form-control proficiency">
	                              <option value="0"> None </option> 
	                              <?php 
	                               $as_prof_lvl = $DB->get_record_sql("SELECT {proficiency_level}.proficiency_level,{assign_course_sub_skill}.proficiency_id FROM {assign_course_sub_skill} INNER JOIN {proficiency_level} on {assign_course_sub_skill}.proficiency_id = {proficiency_level}.id  where course_id = $course_id AND sub_skill_id = $subSkill->id");

	                                 $proficiencys = $DB->get_records_sql("SELECT * FROM {proficiency_level}");
	                                 foreach($proficiencys as $proficiency){ ?>
	                                 <option value="<?=$proficiency->id?>" <?php if($as_prof_lvl->proficiency_id == $proficiency->id) echo 'selected';?> ><?=$proficiency->proficiency_level?>
	                                 </option> 
	                              <?php } ?>
	                           </select>  
	                          	</td>
	                        </tr>
	                     <?php $i++; } ?>
	                  </tbody>
	               </table>
	            </div>
		      </div> 
		   </div>
		   <div class="form-group">
	         <div class="col-sm-offset-2 col-sm-10">
	            <input type="hidden" name="flg" value="update_course_to_sub_skill">
	            <button type="submit" class="btn btn-primary">Update Asign course to sub skill </button>
	         </div>
	      </div>
	<?php }
   }elseif($_GET['flg']=='skill_weightage_list'){  /// skill weightage for sub skill with lavel
	$ids = $_GET['id'];
 	$skills_weit_lists = $DB->get_records_sql("SELECT * FROM {skill_weightage} where skill_id = $ids");
 	$default_courses = $DB->get_record_sql("SELECT DISTINCT default_course FROM {skill_weightage} where skill_id = $ids");
 	 	if(count($skills_weit_lists)){
 	 		foreach ($skills_weit_lists as $skills_weit_list){
		 		$skills_weightages = $DB->get_record_sql("SELECT * FROM {skill} where id = $skills_weit_list->skill_id");
		 		?>
		 		<div class="edit_weightage Skills">
		         <div class="tresh">
		            <select name="update_skill_proficiency[]" class="form-control">
		               <option value=" ">Selecte One</option>
		               <option value="Awareness"<?php if($skills_weit_list->skill_proficiency =="Awareness") echo 'selected';?> >Awareness</option>
		               <option value="Knowledge" <?php if($skills_weit_list->skill_proficiency =="Knowledge") echo 'selected';?> >Knowledge</option>
		               <option value="Skilled" <?php if($skills_weit_list->skill_proficiency =="Skilled") echo 'selected';?> >Skilled</option>
		               <option value="Mastery" <?php if($skills_weit_list->skill_proficiency =="Mastery") echo 'selected';?> >Mastery</option>
		            </select>
		         </div>
		         <div class="delete">
			      	<a onClick="javascript: return confirm('Are you sure to delete');" href="manage.php?flg=delete_skill_weightage&id=<?=$skills_weit_list->id?>" class="btn btn-primary" class="btn btn-primary delete" ><i class="fa fa-trash-o"></i>
			      	</a>
		         </div>
		         <input type="hidden" name="update_skill" value="<?=$skills_weightages->id ?>">
		         <input type="hidden" name="default_course" value="<?=$default_courses->default_course ?>">
		         <input type="hidden" name="skill_wetg_id[]" value="<?=$skills_weit_list->id?>">
		         <input class="toggle-box" id="toggleIds-<?=$skills_weit_list->id?>" type="checkbox">
		         <label for="toggleIds-<?=$skills_weit_list->id?>"><?=$skills_weightages->skill?> </label>
		         <div class="row toggle-box-content"> 
		            <table class="table table-striped">
		               <thead>
		                  <tr>
		                     <th scope="col">Sr No </th>
		                     <th scope="col">Sub Skill</th>
		                     <th scope="col">Proficiency Level </th> 
		                  </tr>
		               </thead>
		               <tbody>
		                  <?php 
		                     $skill_wtge_sub_lists = $DB->get_records_sql("SELECT swm.sub_skill_id,swm.id,swm.sub_skill_proficiency,swm.skill_weightage_id FROM {skill_weightage_meta} as swm WHERE skill_weightage_id = $skills_weit_list->id");
		                    
		                     $i=1;
		                     foreach($skill_wtge_sub_lists as $skill_wtge_sub_list){

		                       $subSkills = $DB->get_record_sql("SELECT {sub_skill}.sub_skills,{sub_skill}.id FROM {sub_skill} where id = $skill_wtge_sub_list->sub_skill_id");
		                       ?>
		                     <tr>
		                        <td scope="col"><?=$i?></td>
		                        <td scope="col"><?=$subSkills->sub_skills?>
		                           <input type="hidden" name="update_sub_skill_id<?=$skills_weit_list->id?>[]" value="<?=$subSkills->id?>">
		                        </td>
		                        <td>
		                        <select name="update_sub_skill_proficiency<?=$skills_weit_list->id?>[]" value="<?=$subSkills->id?>[]" class="form-control" >
		                        	<option value="">None</option>
		                           <option value="Awareness"<?php if($skill_wtge_sub_list->sub_skill_proficiency =="Awareness") echo 'selected';?> >Awareness</option>
		                           <option value="Knowledge" <?php if($skill_wtge_sub_list->sub_skill_proficiency =="Knowledge") echo 'selected';?> >Knowledge</option>
		                           <option value="Skilled" <?php if($skill_wtge_sub_list->sub_skill_proficiency =="Skilled") echo 'selected';?> >Skilled</option>
		                           <option value="Mastery" <?php if($skill_wtge_sub_list->sub_skill_proficiency =="Mastery") echo 'selected';?> >Mastery</option> 
		                        </select>   
		                       </td>
		                     </tr>
		                  <?php $i++; } ?>
		               </tbody>
		            </table>
		         </div><br>
		      </div>
   			<?php 
   		}	  
	   }
   }
}

?>