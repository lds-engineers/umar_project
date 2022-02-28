<?php
require_once('locallib.php');
global $DB,$PAGE,$OUTPUT,$USER,$CFG;
$PAGE->requires->jquery();
  $PAGE->requires->jquery_plugin('ui');
  $PAGE->requires->jquery_plugin('ui-css');
$PAGE->set_heading("Course Rating");
$PAGE->set_title('Course Rating');
echo $OUTPUT->header();
?>
	<form class="form-horizontal" id="form-rating">
		<div class="row mb-3">
			<div class="col-6">
				<input type="text" name="courseid" placeholder="Enter Course Name" class="form-control" id="course_id" required=""/>
				
			</div>
			<div class="col-6">
				<input type="text" name="no_of_user" placeholder="Enter no of user" class="form-control" id="no_of_user" required="">
			</div>
			
		</div>
		<div class="row mb-3">
			<div class="col-6">
				<select class="form-control" name="rating" id="rating" required="">
					<option value="">Select Course Rating</option>
					<option value="1">1</option>
					<option value="1.5">1.5</option>
					<option value="2">2</option>
					<option value="2.5">2.5</option>
					<option value="3">3</option>
					<option value="3.5">3.5</option>
					<option value="4">4</option>
					<option value="4.5">4.5</option>
					<option value="5">5</option>
				</select>
			</div>
			<div class="col-6">
				<select class="form-control" name="status" id="status" required="">
					<option value="">Select Status</option>
					<option value="1">Active</option>
					<option value="0">Deactive</option>
				</select>
			</div>
		</div>
		<div class="row mb-3">
			<div class="col-12">
				<input type="hidden" name="courseid2" value="" id="courseid2">
				<input type="hidden" name="courseid3" value="" id="courseid3">
				<input type="submit" name="submit" value="Submit" class="btn btn-info btn-submit">
			</div>
		</div>
		
	</form>
	<script type="text/javascript">
	
		$(function(){
		$('#form-rating').submit(function(e){
			e.preventDefault();
			$.ajax({
				type:"POST",
				url:"ajax_add_course_rating.php",
				data:$('#form-rating').serialize(),
				beforeSend:function(){
					$('.btn-submit').prop('disabled',true);
					$('.btn-submit').val('Please Wait...');
				},
				success:function(response){
					var res=JSON.parse(response);
					if(res.status==true){
						alert(res.msg);
						window.location.reload();
					}else{
						alert("Please try agin");
						window.location.reload();
					}
					
				},
				complete:function(){
					$('.btn-submit').prop('disabled',false);
					$('.btn-submit').val('Submit');
				}
			});
		});
			$( "#course_id" ).autocomplete({
  				source: function( request, response ) {
   				// Fetch data
   				$.ajax({
    				url: "ajax-course-rating.php",
    				type: 'post',
    				dataType: "json",
    				data: {
     					search: request.term
    				},
    				success: function( data ) {
     					response( data );
    				}
   		});
  	},
  		select: function (event, ui) {
     		// Set selection
     		$('#course_id').val(ui.item.label); // display the selected text
     		$('#courseid2').val(ui.item.value); // save selected id to input
     		var courseid=ui.item.value;
     		$.ajax({
     			type:"POST",
     			url:"ajax_get_rating_data.php",
     			data:{courseid:courseid},
     			success:function(response){
     				console.log(response);
     				var res=JSON.parse(response);
     				if(res.status==true){
     					$('#courseid3').val(res.courseid);
     					$('#rating').val(res.stars);
     					$('#status').val(res.rating_status);
     					$('#no_of_user').val(res.no_of_user);

     				}
     			}
     		});
     		return false;
  		},
  		focus: function(event, ui){
     	/*$( "#autocomplete" ).val( ui.item.label );
     	$( "#selectuser_id" ).val( ui.item.value );
     	return false;*/
   },
 });

		});
	</script>
<?php
echo $OUTPUT->footer();