<?php require_once("../../config.php");
echo $OUTPUT->header();

?>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.2/css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.11.3/css/dataTables.bootstrap4.min.css">

<div class="container-flow">
   <div class="row">
      <div class="col-sm-12">
         <div class="box">
            <h3 class="card-header" id="category-listing-title">Learning Path</h3>
            <div class="card-body">
               <form class="form-horizontal" action="manage.php" method="post">
                  <div class="form-group">
                     <div class="row">
                        <label class="control-label col-sm-12" for="learning">Learning Path:</label>
                        <div class="col-sm-12">
                           <input type="text" class="form-control" name="learning_path" id="learning" placeholder="Learning  Path">
                        </div>
                     </div>
                  </div>
                  <div class="form-group">
                     <div class="row">
                        <label class="control-label col-sm-12" for="title">Title:</label>
                        <div class="col-sm-12">
                           <input type="text" class="form-control" name="title" id="title" placeholder="Title">
                        </div>
                     </div>
                  </div>
                  <div class="form-group">
                     <div class="row">
                        <label class="control-label col-sm-12" for="description">Description:</label>
                        <div class="col-sm-12">
                           <textarea cols="10" class="form-control" name="description" id="description"></textarea>
                        </div>
                     </div>
                  </div>
                  <div class="form-group">
                     <div class="row">
                        <label class="control-label col-sm-12" for="pwd">Passing Criterion:</label>
                        <div class="col-sm-12">
                           <select class="form-control" name="passing_criterion">
                              <option value="1">Dependant on the a single course</option>
                              <option value="2">Dependant on over all course average >70</option>
                           </select>
                        </div>
                     </div>
                  </div>
                  <div class="form-group">
                     <div class="row">
                        <div class="col-sm-offset-2 col-sm-12">
                           <input type="hidden" name="flg" value="learning_path_submit">
                           <button type="submit" class="btn btn-primary">Submit</button>
                        </div>
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
            <h3 class="card-header" id="category-listing-title">Learning Path</h3>
            <div class="card-body">
               <table id="example" class="table table-striped table-bordered" style="width:100%">
                  <thead>
                     <tr>
                         <th>Sr N</th>
                         <th>Title</th>
                         <th>Learning Path</th>
                         <th>Description</th>
                         <th>passing Criterion</th>
                         <th>Action</th>
                     </tr>
                  </thead>
                  <tbody>
                     <?php $learning_datas= $DB->get_records_sql("SELECT * FROM {learning_path} where deleted = 1"); 
                        foreach($learning_datas as $learning_data){
                           $i = 1;

                     ?>
                     <tr>
                         <td><?=$i; ?></td>
                         <td><?=$learning_data->title;?></td>
                         <td><?=$learning_data->learning_path;?></td>
                         <td><?=$learning_data->description;?></td>
                         <?php if($learning_data->passing_criterion==1){?>
                          <td> Dependant on the a single course</td>
                        <?php } else {?>
                         <td> Dependant on over all course average >70 </td>
                        <?php } ?>
                         <td><a href="edit_learning_path.php?id=<?=$learning_data->id?>" id="edit_learning_path" class="btn btn-primary" style="padding: 6px;" >
                           <i class="fa fa-pencil"></i></a>
                           <a onClick="javascript: return confirm('Are you sure to delete');" href="manage.php?id=<?=$learning_data->id?>" class="btn btn-primary" style="padding: 6px;"><i class="fa fa-trash-o"></i></a></td>
                     </tr>
                  <?php $i++;} ?>
                  </tbody>
               </table>

                  </tbody> 
               </table> 
            </div>
         </div>
      </div>
   </div>
</div>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.11.3/js/dataTables.bootstrap4.min.js"></script>
<script type="text/javascript">
   $(document).ready(function() {
    $('#example').DataTable();


});
</script>

<?php
   echo $OUTPUT->footer();