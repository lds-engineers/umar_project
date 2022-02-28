<?php 
/*
 * This is learning goal the part of user enrolment
 * $author sushilkumar@lds-international.in
 *  
 *  */

require_once('../../config.php');
require_once('skill_form.php');
require_once('sub_skill_form.php');
include('common_css.php');
global $CFG, $DB, $PAGE, $USER;
if(!is_siteadmin()){
   redirect(new moodle_url("/"), "You don't have permission to view this page", null, \core\output\notification::NOTIFY_WARNING);
}
$PAGE->set_context(context_system::instance());
$PAGE->set_pagelayout('base');
$title = "Add Skills";
$PAGE->set_title($title);
$PAGE->set_heading($title);
$PAGE->set_url('/local/skills/index.php');
echo $OUTPUT->header();
$skill_mform = new Skill_form();
$sub_skill_mform = new Sub_skill_form();

// for add skills
if ($skill_mform->is_cancelled()) {
   redirect($CFG->wwwroot.'/');   
} else if ($dataform = $skill_mform->get_data()) {
   if(isset($dataform->save)){
      $skill_mform->addskills($dataform);
      redirect(new moodle_url("/local/skills/index.php"), "Add Skills Successfull", null, \core\output\notification::NOTIFY_SUCCESS);
   }
}
// For add sub_skill

if ($sub_skill_mform->is_cancelled()) {
   redirect($CFG->wwwroot.'/');   
} else if ($sub_dataform = $sub_skill_mform->get_data()) {
   if(isset($sub_dataform->save)){
      $sub_skill_mform->addsubskills($sub_dataform);
      redirect(new moodle_url("/local/skills/index.php"), "Add Skills Successfull", null, \core\output\notification::NOTIFY_SUCCESS);
   }		
}?>
<div class="container-flow">
   <div class="row">
      <div class="col-sm-6">
         <div class="box">
            <h3 class="card-header" id="category-listing-title">Add Skills</h3>
            <div class="card-body">
              <?php $skill_mform->display() ;?>
            </div>
         </div>
      </div>
      <div class="col-sm-6">
         <div class="box">
            <h3 class="card-header" id="category-listing-title">Add Sub Skills</h3>
            <div class="card-body">
              <?php $sub_skill_mform->display() ;?>
            </div>
         </div>
      </div>
   </div>
   <div class="row">
      <div class="col-sm-6">
         <div class="box">
            <h3 class="card-header" id="category-listing-title">Skills List</h3>
            <div class="card-body">
               <table class="table table-striped">
                  <thead>
                     <tr>
                        <th scope="col">Sr No </th>
                        <th scope="col">Skill</th>
                        <th scope="col">Action</th>
                        
                     </tr>
                  </thead>
                  <tbody>
                     <?php 
                        $skills = $DB->get_records_sql("SELECT * FROM {skill}");
                        $i=1;
                        foreach($skills as $skill){
                     ?>
                     <tr>
                        <th scope="col"><?=$i?></th>
                        <th scope="col"><?=$skill->skill?></th>
                         <td>
                           <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal<?=$skill->id?>">
                              <i class="fa fa-pencil" aria-hidden="true"></i></a>&nbsp;
                           <a onClick="javascript: return confirm('Are you sure to delete');" href="manage.php?flg=delete1&id=<?=$skill->id?>" class="btn btn-primary" class="btn btn-primary delete" ><i class="fa fa-trash-o"></i></a></td>
                     </tr>
                     <tr>
                        <!-- Modal -->
                        <div class="modal fade" id="exampleModal<?=$skill->id?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                          <div class="modal-dialog" role="document">
                            <div class="modal-content">
                              <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Edit Skills</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">&times;</span>
                                </button>
                              </div>
                              <form action="manage.php" method="post"> 
                                 <div class="modal-body">
                                     <div class="form-group">
                                       <label for="email1">Skills</label>
                                       <input type="test" class="form-control" id="skills" name="skills"  value="<?=$skill->skill?>" aria-describedby="emailHelp" >
                                       <!-- <small id="emailHelp" class="form-text text-muted">Your information is safe with us.</small> -->
                                     </div>
                                 </div>
                                 <div class="modal-footer">
                                    <input type="hidden" value="<?=$skill->id?>" name="id">
                                    <input type="hidden" value="skill" name="flg">
                                   <button type="submit" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                   <button type="submit" class="btn btn-primary">Upadte</button>
                                 </div>
                              </form>
                            </div>
                          </div>
                        </div>
                     </tr>
                  <?php $i++; } ?>
                  </tbody>
               </table>
            </div>
         </div>
      </div>
      <div class="col-sm-6">
         <div class="box">
            <h3 class="card-header" id="category-listing-title">Sub Skills List</h3>
            <div class="card-body">
               <div class="toggle-box-region">
                   <?php 
                        $skills = $DB->get_records_sql("SELECT * FROM {skill}");
                        $i=1;
                        foreach($skills as $skill){
                     ?>
                        <input class="toggle-box" id="toggleId-<?=$skill->id?>" type="checkbox">
                        <label for="toggleId-<?=$skill->id?>"><?=$skill->skill?> </label>
                        <div class="row toggle-box-content"> 
                           <table class="table table-striped">
                              <thead>
                                 <tr>
                                    <th scope="col">Sr No </th>
                                    <th scope="col">Sub Skill</th>
                                    <th scope="col">Action</th>
                                 </tr>
                              </thead>
                              <tbody>
                                 <?php 
                                    $subSkills = $DB->get_records_sql("SELECT * FROM {sub_skill} where {sub_skill}.skill_id = $skill->id");
                                    $i=1;
                                    foreach($subSkills as $subSkill){
                                 ?>
                                 <tr>
                                    <th scope="col"><?=$i?></th>
                                    <th scope="col"><?=$subSkill->sub_skills?></th>
                                    <td>
                                       <a href="#" class="btn btn-primary" data-toggle="modal" data-target="#subskill<?=$subSkill->id?>"><i class="fa fa-pencil" aria-hidden="true"></i></a>
                                       &nbsp;<a onClick="javascript: return confirm('Are you sure to delete');" href="manage.php?flg=delete2&id=<?=$subSkill->id?>" class="btn btn-primary"><i class="fa fa-trash-o"></a></td>
                                 </tr>
                                 <tr> 
                                 <!-- Modal -->
                                 <div class="modal fade" id="subskill<?=$subSkill->id?>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                   <div class="modal-dialog" role="document">
                                     <div class="modal-content">
                                       <div class="modal-header">
                                         <h5 class="modal-title" id="exampleModalLabel">Edit Sub Skills</h5>
                                         <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                           <span aria-hidden="true">&times;</span>
                                         </button>
                                       </div>
                                       <form action="manage.php" method="post"> 
                                          <div class="modal-body">
                                              <div class="form-group">
                                                <label for="email1">Sub Skills</label>
                                                <input type="test" class="form-control" id="skills" name="sub_skills"  value="<?=$subSkill->sub_skills?>" aria-describedby="emailHelp">
                                              </div>
                                          </div>
                                          <div class="modal-footer">
                                             <input type="hidden" value="<?=$subSkill->id?>" name="id">
                                             <input type="hidden" value="sub_skill" name="flg">
                                            <button type="submit" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                            <button type="submit" class="btn btn-primary">Upadte</button>
                                          </div>
                                       </form>
                                     </div>
                                   </div>
                                 </div>
                                 </tr>
                                 <?php $i++; } ?>
                              </tbody>
                           </table>
                        </div>
                     <?php } ?>

               </div>                
            </div>
         </div>
      </div>
   </div>
</div>
<style type="text/css">
   #region-main, .card, .list-group ul li a, #course-category-listings.columns-3 {
    height: auto !important;
}
</style>
<?php
echo $OUTPUT->footer();
