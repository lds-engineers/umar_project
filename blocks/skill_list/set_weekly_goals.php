<?php
require_once('locallib.php');
$PAGE->set_url(new moodle_url('/blocks/skill_list/set_weekly_goals.php'));
$PAGE->set_title('Set Weekly Goals');
$PAGE->set_heading('Set Weekly Goal');
$PAGE->requires->jquery();
$PAGE->requires->jquery_plugin('validate', 'theme_skills');//additional_methods
$PAGE->requires->jquery_plugin('additional_methods', 'theme_skills');
global $DB, $CFG,$USER;
$sql="SELECT * FROM {usergoal} WHERE userid=?";
$userdata=$DB->get_record_sql($sql,array($USER->id));
$day_hours=$userdata->day_hours;
$no_of_course=$userdata->no_of_course;
$week_hours=$userdata->week_hours;
echo $OUTPUT->header();?>

<form class="form-horizontal" id="usersetgoal">
	<div class="flex-row mb-3">
		<!--  -->
		<div class="col_3">
			<div>
				<label>No of courses</label>
					<input type="text" name="no_of_course" placeholder="Enter No of course in Week" class="form-control" value="<?php echo $no_of_course; ?>">
			</div>
		</div>
		<div class="col_3">
				<label>Hour In Day</label>
					<input type="text" name="day_hours" placeholder="Enter hour in day" class="form-control" id="day_hours" value="<?php echo $day_hours; ?>">				
		</div>
		<div class="col_3">
			<div>
				<label>Hour In week</label>
					<input type="text" name="week_hours" placeholder="Enter hour in Week" class="form-control" value="<?php echo $week_hours; ?>">
			</div>
		</div>
		<div class="col_3">
			<label></label>
			<div class="btn-bg">
				<input type="hidden" name="userid" value="<?php echo $USER->id; ?>" >
				<input type="submit" name="submit" class="btn btn-submit text-white" value="Set Goal">
			</div>
		</div>
	</div>	
</form>

<!--Modal -->

  <div class="modal" id="myModal">
    <div class="modal-dialog mymodals">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
       <!--    <h4 class="modal-title">Modal Heading</h4> -->
          <!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
        </div>
        
        <!-- Modal body -->
        <div class="modal-body text-center">
          <a href="<?php echo $CFG->wwwroot; ?>" class="btn btn-primary" >Goto Dashboard</a>
          <button type="button" class="btn btn-danger" data-dismiss="modal">Stay On This Page</button>
        </div>
        
        <!-- Modal footer -->
        <div class="modal-footer">
        	
        </div>
        
      </div>
    </div>
  </div>
<!---End Modal-->
<style type="text/css">
	.error{
		color: red;
		weight: 300;
	}
	.mymodals{
		position: relative;
		top: 175px;
	}

	.flex-row{
		display: flex;
		flex-wrap: wrap;
		justify-content: center;
		align-items: center;
		padding: 5px;
		position: relative;
	}

	.col_3{
		margin-right: 10px;
	}

	.btn-bg{
		background-color: #6a4cff;
		text-align: center;
		margin-top: 7px;
	}
	/*#day_hours-error{
		position: absolute;
	}*/
	[name=submit]{
		background-color: transparent;
	}
	[name="userid"]{
		background-color: transparent;
	}
	.col_3 input[type="text"]:not(.error), .btn-bg {
   	 margin-bottom: 30.5px;
	}
	.btn:focus, .btn.focus{
		box-shadow: none;
	}

	.btn-bg input{
		width: 100%;
	}


</style>
<script type="text/javascript">
	$(function(){

	/*jQuery.validator.addMethod("greaterThan", function(value, element, params) {    
    if (!/Invalid|NaN/.test(value)){
        return value > $(params[0]).val();
    }    
    return isNaN(value) && isNaN($(params[0]).val()) || (Number(value) > Number($(params[0]).val())); 
},'Must be greater than {1}.');*/
		$('#usersetgoal').validate({
			rules:{
				no_of_course:{
					required:true,
					digits:true,
					min:1,
					max:7
				},
				day_hours:{
					required:true,
					digits:true,
					min:1,
					max:24
				},
				week_hours:{
					required:true,
					digits:true

					
					
				}
			},
			messages:{
				day_hours:{
					digits:"Please enter numeric number."
				},
				no_of_course:{
					digits:"Please enter numeric number."
				}
				

			},
			submitHandler:function(form){
				console.log(form);
				$.ajax({
					type:"GET",
					url:"<?php echo $CFG->wwwroot.'/blocks/skill_list/ajax_set_goals.php'?>",
					data:$(form).serialize(),
					beforeSend:function(){
						$('.btn-submit').prop('disabled',true);
						$('.btn-submit').val("Please Wait...");					},
					success:function(response){
						var data=JSON.parse(response);
						//setTimeout(function(){
							if(data.status==true){
								$('#myModal').modal('show');

								//window.location.href="<?php echo $CFG->wwwroot;?>";
							}else{
								alert(data.msg);
							}
						//},2000);
						

					},
					complete:function(){
						$('.btn-submit').prop('disabled',false);
						$('.btn-submit').val("Set Goal");
					}
				});
				return false;
			}
		});
	});
</script>
<?php
echo $OUTPUT->footer();