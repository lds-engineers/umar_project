<?php require_once("../../config.php");
echo $OUTPUT->header();

global $CFG, $DB, $PAGE, $USER;

include("common_css.php");  //common css file

?>
<div class="container-flow">
   <div class="box">
      <h3 class="card-header" id="category-listing-title">Assign course to sub skill</h3>
      <div class="card-body">
         <div class="row">
            <div class="col-sm-6">
               <form class="form-horizontal" action="manage.php" method="post">
                  <div class="form-group">
                     <label class="control-label" for="course">Course:</label>
                     <select class="form-control" id="course" name="course">
                        <option>Select One </option>
                        <?php
                        $default_cat_data=$DB->get_record_sql("SELECT * FROM {course_category_settings}");
                        $default_course_category=null;
                           $certificate_course_category=null;
                        if(!empty($default_cat_data)){
                           $default_course_category=$default_cat_data->default_course_category;
                           $certificate_course_category=$default_cat_data->certificate_course_category;
                        }

                           $sql="SELECT c.id,c.fullname FROM {course} c JOIN {course_categories} cc ON cc.id=c.category WHERE cc.id NOT IN($default_course_category,$certificate_course_category) AND c.visible=? AND cc.visible=? ORDER BY c.id DESC"; 
                           $courses = $DB->get_records_sql($sql,array(1,1));
                           foreach($courses as $course){
                        ?>
                        <option value="<?=$course->id?>"><?=$course->fullname ?></option>
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
                                         <input type="hidden" name="sub_skill_id[]" value="<?=$subSkill->id?>">
                                         </td>
                                         <td>
                                          <select name="proficiency_id[]" class="form-control proficiency">
                                             <option value="">none </option>
                                             <?php 
                                                $proficiencys = $DB->get_records_sql("SELECT * FROM {proficiency_level}");
                                                foreach($proficiencys as $proficiency){ ?>
                                                <option value="<?=$proficiency->id?>"><?=$proficiency->proficiency_level?></option>
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
                        <input type="hidden" name="flg" value="assign_course_to_sub_skill">
                        <button type="submit" class="btn btn-primary btn_prop" >Asign course to sub skill </button>
                     </div>
                 </div>
               </form> 
            </div>
            <div class="col-sm-6">
               <form class="form-horizontal" action="manage.php" method="post">
                 <div class="update_data"></div>
               </form> 
            </div>
         </div>
      </div>
   </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>  
<script type="text/javascript">
   $(document).ready(function() {

     
     $("#course").select2();
     $("#update_course").select2();

     $("#course").change(function(){  
    
      var course_id = $(this).val();
     
         $.ajax({   //For display assigned course with sub skill
            type: "GET",
            url: "<?php echo $CFG->wwwroot;?>"+"/local/skills/manage.php?course_id="+course_id+"&flg=update_assigned_course_to_sub_skill",
            contentType: "application/html",
            dataType: "html",
            success: function (result) {
               $('.update_data').html(result);
            },
            error: function (xhr, textStatus, errorThrown) { alert(textStatus + ':' + errorThrown); }
        });
      });

    // $("#update_user").change(function(){               // Display assigned skill list for update subskill
    //   var user_id = $(this).val();
    //      $.ajax({
    //         type: "GET",
    //          url: "<?php echo $CFG->wwwroot;?>"+"/local/skills/manage.php?id="+user_id+"&flg=browse_exit_skill",
    //          contentType: "application/html",
    //          dataType: "html",
    //         success: function (result) {
    //            $('.browse_skill_data').html(result);
    //         },
    //         error: function (xhr, textStatus, errorThrown) { alert(textStatus + ':' + errorThrown); }
    //     });
    //   });
   });
</script>




<?php
   echo $OUTPUT->footer();