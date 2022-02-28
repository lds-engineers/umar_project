<?php require_once("../../config.php");
echo $OUTPUT->header();

global $CFG, $DB, $PAGE, $USER;

include("common_css.php");  //common css file

?>
<div class="container-flow">
   <div class="row">
      <div class="col-sm-12">
         <div class="box">
            <h3 class="card-header" id="category-listing-title">Assign Skills</h3>
            <div class="card-body">
               <form class="form-horizontal" action="manage.php" method="post">
                  <div class="row">
                     <div class="col-sm-6">
                        <div class="form-group">
                           <label class="control-label" for="user">User:</label>
                           <div class="col-sm-12">
                              <select class="form-control" id="user" name="user">
                                 <option>Select One </option>
                                 <?php 
                                    $users = $DB->get_records_sql("SELECT * FROM {user} where deleted = 0");
                                    foreach($users as $user){
                                 ?>
                                 <option value="<?=$user->id?>"><?=$user->firstname?> <?=$user->lastname?></option>
                              <?php } ?>
                              </select> 
                           </div>
                        </div>
                        <div class="form-group">
                            <label class="control-label" for="skill">Skill: </label>
                            <div class="col-sm-12 skill_data"></div>
                        </div>
                     </div>
                     <div class="col-sm-6">
                        <div class="form-group">
                         <label class="control-label" for="pwd">Sub Skill: </label>
                         <div class="col-sm-12">
                           <div class="toggle-box-region sub_skill" ></div> 
                         </div>
                       </div> 
                     </div>
                  </div>
                  <div class="form-group">
                     <div class="col-sm-offset-2 col-sm-10">
                        <input type="hidden" name="flg" value="assignSkill">
                        <button type="submit" class="btn btn-primary btn_prop" >Asign skill to user</button>
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
            <h3 class="card-header" id="category-listing-title">Browse Assign Skills</h3>
            <div class="card-body">
               <form class="form-horizontal" action="manage.php" method="post">
                  <div class="row">
                     <div class="col-sm-6">
                        <div class="form-group">
                           <label class="control-label" for="user">User:</label>
                           <div class="col-sm-12">
                              <select class="form-control" id="update_user" name="user">
                                 <option value="">select one</option>
                                 <?php 
                                   $users = $DB->get_records_sql("SELECT DISTINCT {assign_skill}.user_id,{user}.id,{user}.firstname,{user}.lastname FROM {user} INNER JOIN {assign_skill} ON {user}.id = {assign_skill}.user_id");
                                    foreach($users as $user){ ?>
                                    <option value="<?=$user->id?>"><?=$user->firstname?> <?=$user->lastname?></option>
                                 <?php } ?>
                              </select> 
                           </div>
                        </div>
                        <div class="form-group">
                           <label class="control-label" for="skill">Skill: </label>
                           <div class="col-sm-12 browse_skill_data"></div>
                        </div>
                     </div>
                     <div class="col-sm-6">
                        <div class="form-group">
                        <label class="control-label" for="pwd">Sub Skill List : </label>
                        <div class="col-sm-12">
                           <div class="toggle-box-region browse_sub_skill"> </div> 
                        </div>
                       </div> 
                     </div>
                  </div>
                 <div class="form-group">
                   <div class="col-sm-offset-2 col-sm-10">
                     <input type="hidden" name="flg" value="update_assign_Skill">
                     <button type="submit" class="btn btn-primary update_btn_prop">Update Asign skill to user</button>
                   </div>
                 </div>
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

      $('.btn_prop').prop('disabled', true);
      $('.update_btn_prop').prop('disabled', false);
      $("#user").select2();

     $("#user").change(function(){   
      var user_id = $(this).val();
         $.ajax({                  //For display not assigend skill list  change on user
            type: "GET",
             url: "<?php echo $CFG->wwwroot;?>"+"/local/skills/manage.php?id="+user_id+"&flg=exit_skill",
             contentType: "application/html",
             dataType: "html",
            success: function (result) {
               $('.skill_data').html(result);
            },
            error: function (xhr, textStatus, errorThrown) { alert(textStatus + ':' + errorThrown); }
        });
      });

    $("#update_user").change(function(){               // Display assigned skill list for update subskill
      var user_id = $(this).val();
         $.ajax({
            type: "GET",
             url: "<?php echo $CFG->wwwroot;?>"+"/local/skills/manage.php?id="+user_id+"&flg=browse_exit_skill",
             contentType: "application/html",
             dataType: "html",
            success: function (result) {
               $('.browse_skill_data').html(result);
            },
            error: function (xhr, textStatus, errorThrown) { alert(textStatus + ':' + errorThrown); }
        });
      });
   });
</script>

<?php
   echo $OUTPUT->footer();