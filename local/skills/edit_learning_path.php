<?php require_once("../../config.php");
echo $OUTPUT->header();


$id = $_GET['id'];

$learning_data= $DB->get_record_sql("SELECT * FROM {learning_path} where deleted = 1 AND id = $id"); 


?>

<div class="container-flow">
   <div class="row">
      <div class="col-sm-12">
         <div class="box">
            <h3 class="card-header" id="category-listing-title">Edit Learning Path</h3>
            <div class="card-body">
               <form class="form-horizontal" action="manage.php" method="post">
                  <div class="form-group">
                     <div class="row">
                        <label class="control-label col-sm-12" for="learning">Learning Path:</label>
                        <div class="col-sm-12">
                           <input type="text" class="form-control" value="<?=$learning_data->learning_path?>" name="learning_path" id="learning" placeholder="Learning  Path">
                        </div>
                     </div>
                  </div>
                  <div class="form-group">
                     <div class="row">
                        <label class="control-label col-sm-12" for="title">Title:</label>
                        <div class="col-sm-12">
                           <input type="text" class="form-control" value="<?=$learning_data->title?>" name="title" id="title" placeholder="Title">
                        </div>
                     </div>
                  </div>
                  <div class="form-group">
                     <div class="row">
                        <label class="control-label col-sm-12" for="description">Description:</label>
                        <div class="col-sm-12">
                           <textarea  class="form-control"  name="description" id="description"><?=$learning_data->description?></textarea>
                        </div>
                     </div>
                  </div>
                  <div class="form-group">
                     <div class="row">
                        <label class="control-label col-sm-12" for="pwd">Passing Criterion:</label>
                        <div class="col-sm-12">
                           <select class="form-control" name="passing_criterion">
                              <option value="<?=$learning_data->passing_criterion?>" <?php if($learning_data->passing_criterion == 1) echo 'selected'?> > Dependant on the a single course</option>
                              <option value="<?=$learning_data->passing_criterion?>" <?php if($learning_data->passing_criterion == 2) echo 'selected'?> >Dependant on over all course average >70</option>
                           </select>
                        </div>
                     </div>
                  </div>
                  <div class="form-group">
                     <div class="row">
                        <div class="col-sm-offset-2 col-sm-12">
                           <input type="hidden" name="flg" value="learning_path_update">
                           <input type="hidden" name="id" value="<?=$learning_data->id?>">
                           <button type="submit" class="btn btn-primary">Update</button>
                        </div>
                     </div>
                  </div>
               </form> 
            </div>
         </div>
      </div>
   </div>
</div>

<?php
   echo $OUTPUT->footer();