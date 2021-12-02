<?php require_once("../../config.php");
echo $OUTPUT->header();
include("common_css.php");
?>

<div class="container-flow">
   <div class="row">
      <div class="col-sm-12">
         <div class="box">
            <h3 class="card-header" id="category-listing-title">Assign skills course</h3>
            <div class="card-body">
               <form class="form-horizontal" action="manage.php" method="post">
                  <div class="row">
                     <div class="col-sm-6">
                        <div class="form-group">
                           <label class="control-label" for="course">Course:</label>
                           <div class="col-sm-12">
                              <select class="form-control" id="course" name="course[]" multiple>
                                 <?php 
                                    $courses = $DB->get_records_sql("SELECT * FROM {course} order by id DESC");
                                    foreach($courses as $course){
                                 ?>
                                 <option value="<?=$course->id?>"><?=$course->fullname ?></option>
                                 <?php } ?>
                              </select>
                           </div>
                        </div>
                        <div class="form-group">
                           <label class="control-label" for="skill">Skill: </label>
                           <div class="col-sm-12 course_skill"></div>
                        </div>
                     </div>
                     <div class="col-sm-6">
                        <div class="form-group">
                         <label class="control-label" for="pwd">Sub Skill: </label>
                         <div class="col-sm-12">
                           <div class="toggle-box-region sub_skill"></div> 
                         </div>
                       </div> 
                    </div>
                  </div>
                 <div class="form-group">
                   <div class="col-sm-offset-2 col-sm-10">
                     <input type="hidden" name="flg" value="courseSkill">
                     <button type="submit" class="btn btn-primary btn_prop">Assign skill to course</button>
                   </div>
                 </div>
               </form> 
            </div>
         </div>
      </div>
   </div>
    <div class="row">
      <div class="col-sm-12">
         <div class="box">
            <h3 class="card-header" id="category-listing-title">Browse Assign skills course</h3>
            <div class="card-body">
               <form class="form-horizontal" action="manage.php" method="post">
                  <div class="row">
                     <div class="col-sm-6">
                        <div class="form-group">
                           <label class="control-label" for="course">Course:</label>
                           <div class="col-sm-12">
                              <select class="form-control" id="update_course" name="course">
                                 <option value="">Select One</option>
                                 <?php 
                                    $courses = $DB->get_records_sql("SELECT DISTINCT {course_skill}.course_id,{course}.fullname,{course}.id FROM {course} INNER JOIN {course_skill} ON {course}.id = {course_skill}.course_id");
                                    
                                    foreach($courses as $course){ ?>
                                    <option value="<?=$course->course_id?>"><?=$course->fullname ?></option>
                                 <?php } ?>
                              </select>
                           </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="skill">Skill: </label>
                            <div class="col-sm-12 upadte_skill"></div>
                        </div>
                     </div>
                     <div class="col-sm-6">
                        <div class="form-group">
                         <label class="control-label" for="pwd">Sub Skill: </label>
                         <div class="col-sm-12">
                           <div class="toggle-box-region upadte_sub_skill" > </div> 
                         </div>
                       </div> 
                    </div>
                  </div>
                  <div class="form-group">
                     <div class="col-sm-offset-2 col-sm-10">
                        <input type="hidden" name="flg" value="update_courseSkill">
                        <button type="submit" class="btn btn-primary update_btn_prop">Update Assign skill to course</button>
                     </div>
                 </div>
               </form> 
            </div>
         </div>
      </div>
   </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
      $('.btn_prop').prop('disabled', true);   //For add assign skiil to course display label button disabled 
      $('.update_btn_prop').prop('disabled', false); //For update assign skiil to course display label button disabled 

       $("#course").click(function(){    // Change course display unassigned course list for assigned skill 
         var course_id = $(this).val();
         // alert(course_id);
         $.ajax({
            type: "GET",
            url: "<?php echo $CFG->wwwroot;?>"+"/local/skills/manage.php?id="+course_id+"&flg=exit_course_skill",
            contentType: "application/html",
            dataType: "html",
            success: function (result) {
               $('.course_skill').html(result);
            },
            error: function (xhr, textStatus, errorThrown) { alert(textStatus + ':' + errorThrown); }
        });
      });

      $("#skill").click(function(){  // Change skill dispaly sub skill list for assigned proficiancy label
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
     
      $("#update_course").change(function(){   // For update exits skill of sub skill change to course
         var course_id = $(this).val();
         $.ajax({
            type: "GET",
             url: "<?php echo $CFG->wwwroot;?>"+"/local/skills/manage.php?id="+course_id+"&flg=update_exit_course_skill",
             contentType: "application/html",
             dataType: "html",
            success: function (result) {
               $('.upadte_skill').html(result);
            },
            error: function (xhr, textStatus, errorThrown) { alert(textStatus + ':' + errorThrown); }
        });
      });
   });
</script>
<?php
   echo $OUTPUT->footer();