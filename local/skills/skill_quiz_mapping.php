<?php require_once("../../config.php");
global $DB,$USER,$CFG;
echo $OUTPUT->header();
include("common_css.php");
?>

<div class="container-flow">
   <div class="row">
      <div class="col-sm-12">
         <div class="box">
            <h3 class="card-header" id="category-listing-title">Skill Quiz mapping</h3>
            <div class="card-body">
               <form class="form-horizontal" action="manage.php" method="post">
                  <div class="row">
                     <div class="col-sm-6">
                        <div class="form-group">
                           <label class="control-label" for="course">Course:</label>
                           <div class="col-sm-12">
                              <select class="form-control" id="course" name="course">
                                 <option value="">Select one</option>
                                  <?php 
                                    $courses = $DB->get_records_sql("SELECT DISTINCT {skill_weightage}.default_course,{course}.fullname,{course}.id FROM {course} INNER JOIN {skill_weightage} ON {course}.id = {skill_weightage}.default_course");
                                    
                                    foreach($courses as $course){
                                 ?>
                                 <option value="<?=$course->id?>"><?=$course->fullname ?></option>
                                 <?php } ?>
                              </select>
                           </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="skill">Skill: </label>
                            <div class="col-sm-12 course_skill">
                               
                              
                            </div>
                        </div> 
                     </div>
                     <div class="col-sm-6">
                        <div class="form-group">
                         <label class="control-label" for="pwd">Sub Skill: </label>
                         <div class="col-sm-12">
                           <div class="toggle-box-region sub_skill" >
                            
                           </div> 

                         </div>
                       </div> 
                    </div>
                  </div>
                 
                 <div class="form-group">
                   <div class="col-sm-offset-2 col-sm-10">
                     <input type="hidden" name="flg" value="skill_quiz_mapping">
                     <button type="submit" class="btn btn-primary">Skill quiz mapping</button>
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
            <h3 class="card-header" id="category-listing-title">Browse Skill Quiz mapping</h3>
            <div class="card-body">
               <form class="form-horizontal" action="manage.php" method="post">
                  <div class="row">
                     <div class="col-sm-6">
                        <div class="form-group">
                           <label class="control-label" for="course">Course:</label>
                           <div class="col-sm-12">
                              <select class="form-control" id="upcourse" name="course">
                                 <option value="">Select one</option>
                                  <?php 
                                    $courses = $DB->get_records_sql("SELECT DISTINCT {skill_quiz_mapping}.course_id,{course}.fullname,{course}.id FROM {course} INNER JOIN {skill_quiz_mapping} ON {course}.id = {skill_quiz_mapping}.course_id");
                                    
                                    foreach($courses as $course){
                                 ?>
                                 <option value="<?=$course->id?>"><?=$course->fullname ?></option>
                                 <?php } ?>
                              </select>
                           </div>
                        </div>
                        <div class="form-group">
                           <label class="control-label" for="skill">Skill: </label>
                           <div class="col-sm-12 upcourse_skill"></div>
                        </div> 
                     </div>
                     <div class="col-sm-6">
                        <div class="form-group">
                        <label class="control-label" for="pwd">Sub Skill: </label>
                        <div class="col-sm-12">
                           <div class="toggle-box-region update_sub_skill" ></div> 
                        </div>
                       </div> 
                     </div>
                  </div>
                  <div class="form-group">
                     <div class="col-sm-offset-2 col-sm-10">
                        <input type="hidden" name="flg" value="update_skill_quiz_mapping">
                        <button type="submit" class="btn btn-primary">Update Skill quiz mapping</button>
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
      
      $("#course").change(function(){
         var course_id = $(this).val();
          // alert(course_id);
         $.ajax({
            type: "GET",
             url: "<?php echo $CFG->wwwroot; ?>"+"/local/skills/manage.php?id="+course_id+"&flg=mapped_course_skill",
             //data: {'id': id,'audio': 'audio'},
             contentType: "application/html",
             dataType: "html",
            success: function (result) {
              // alert(result);
               $('.course_skill').html(result);
            },
            error: function (xhr, textStatus, errorThrown) { alert(textStatus + ':' + errorThrown); }
        });
      });
      $("#upcourse").change(function(){
         var course_id = $(this).val();
          // alert(course_id);
         $.ajax({
            type: "GET",
             url: "<?php echo $CFG->wwwroot; ?>"+"/local/skills/manage.php?id="+course_id+"&flg=update_mapped_course_skill",
             //data: {'id': id,'audio': 'audio'},
             contentType: "application/html",
             dataType: "html",
            success: function (result) {
              // alert(result);
               $('.upcourse_skill').html(result);
            },
            error: function (xhr, textStatus, errorThrown) { alert(textStatus + ':' + errorThrown); }
        });
      });
   });
</script>
<?php
   echo $OUTPUT->footer();