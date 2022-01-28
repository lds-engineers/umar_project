<?php require_once("../../config.php");
global $PAGE,$CFG;
//$PAGE->requires->jquery();
echo $OUTPUT->header();

?>
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<style type="text/css">
   /* Toggle hide/show - no Js
        --------------------------------*/
        .toggle-box-region {background-color:#fff; border:1px solid #d9d9d9; padding:16px 18px;}
        .toggle-box {display:none;}
        .toggle-box + label {
            color:#555;
            cursor:pointer;
            display:block;
            font-weight:bold;
            line-height:23px;
            padding:.3em 0 .3em 26px;
            position:relative;
        }

        .toggle-box + label + div {display:none; margin:0 0 14px;}
        .toggle-box:checked + label:nth-child(n) + div {display:block;}

        .toggle-box + label:before {
            position:absolute;
            content:"\f0fe";
            font-family:FontAwesome;
            top:.3em;
            left:0px;
            color:#0085a6;
        }
        .toggle-box:checked + label {color:#0085a6;}
        .toggle-box:checked + label:before {content:"\f146";}
        .toggle-box-content {border-bottom:1px double #bfbfbf; color:#000; padding:2px 1em .6em 28px;}

        /* General */
        *, *:before, *:after {
            -webkit-box-sizing: border-box;
               -moz-box-sizing: border-box;
                    box-sizing: border-box;
        }

        .box-test {
          padding:3em;
        }
        .dlt_btn{
         margin-left: 376px;
        }
      .Skills{
      position: relative;
      }
      .tresh{
         position: absolute;
         right: 20;
         z-index: 9;
         margin-left: 304px;
      }
      .delete{
         position: absolute;
         right: 0;
         z-index: 9;
      }
</style>
<div class="container-flow">
   <div class="box">
      <h3 class="card-header" id="category-listing-title"> Skills Weightage</h3>
      <div class="card-body">
        <form class="form-horizontal" id="form-weigt" method="post" action="manage.php">
         <div class="row">
            <div class="col-sm-6">
          <!--      <form class="form-horizontal" id="form-weigt"> -->
                  <div class="row">
                    <div class="col-sm-12">
                        <div class="form-group">
                           <label class="control-label" for="skill">Skill: </label>
                           <div class="skill_data">
                              <select class="form-control" id="skill" name="skill">
                                 <option> Select one </option>
                                 <?php 
                                    $skills = $DB->get_records_sql("SELECT * FROM {skill}");
                                    foreach($skills as $skill){
                                 ?>
                                 <option value="<?=$skill->id?>"><?=$skill->skill?></option>
                              <?php } ?>
                              </select>
                           </div>
                        </div>
                        <div class="form-group">
                           <label class="control-label" for="pwd"> Sub Skill: </label>
                           <div class="toggle-box-region sub_skill" >
                            
                           </div>
                        </div>
                        <div class="form-group">
                           <!-- <label class="control-label" for="pwd">Course: </label> -->
                           <div class="row assigned_default_course" ></div>
                        </div>
                     </div>
                     <div class="col-sm-offset-2 col-sm-12">
                        <div class="form-group">
                           <input type="hidden" name="flg" value="add_skill_weightage">
                           <input type="submit" name="add" class="btn btn-primary add-btn" value="Skill Weighatage">
                           <!-- <button type="submit" class="btn btn-primary" name="add">Skill Weighatage</button> -->
                        </div>
                     </div>
                  </div>
               <!-- </form> -->
            </div>
            <div class="col-sm-6">
               <!-- <form class="form-horizontal" action="manage.php" method="post"> -->
                  <div class="form-group">
                     <label class="control-label" for="pwd"> Sub Skill List: </label>
                     <div class="toggle-box-region sub_skill_list">
                        
                     </div>
                  </div>  
                  <div class="form-group">
                     <div class="col-sm-offset-2 col-sm-10">
                        <input type="hidden" name="flg" value="update_skill_weightage">
                     <input type="submit" name="update" class="btn btn-primary update-btn" id="update-btn" value="Update Skill Weighatage">
                       <!--  <button type="submit" class="btn btn-primary update-btn" name="update">Update Skill Weighatage</button> -->
                     </div>
                  </div>
               <!-- </form> -->
            </div>
         </div>
        </form>
      </div>
   </div>
</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>  
<script type="text/javascript">
   $(document).ready(function() {

      $('.add-btn').click(function(e){
         e.preventDefault();
         //console.log($('#form-weigt').serialize());
         $.ajax({
            type:"POST",
            url:"<?php echo $CFG->wwwroot.'/local/skills/manage.php?flg=add_skill_weightage'?>",
            data:$('#form-weigt').serialize(),
            beforeSend:function(){
               $('.add-btn').prop('disabled',true);
               $('.add-btn').val('Please wait...');
            },
            success:function(response){
               var data=JSON.parse(response);
              if(data.status==true){
                  alert(data.msg);
                  window.location.reload();
              }else{
               alert(msg);
              }
            },
            complete:function(){
                $('.add-btn').prop('disabled',false);
               $('.add-btn').val('Skill Weighatage');
            }
         });
        
      });

        $('.update-btn').click(function(e){
         e.preventDefault();
       //  console.log($('#form-weigt').serialize());
         $.ajax({
            type:"POST",
            url:"<?php echo $CFG->wwwroot.'/local/skills/manage.php?flg=update_skill_weightage'?>",
            data:$('#form-weigt').serialize(),
            beforeSend:function(){
               $('.update-btn').prop('disabled',true);
               $('.update-btn').val('Please wait...');
            },
            success:function(response){
              var data=JSON.parse(response);
              if(data.status==true){
                  alert(data.msg);
                  window.location.reload();
              }else{
               alert(msg);
              }
            },
            complete:function(){
               $('.update-btn').prop('disabled',false);
               $('.update-btn').val('Update Skill Weighatage');
            }
         });
        
      });
      //$('#form-weigt').on('submit',)
       /* $('#update-btn').submit(function(e){
         e.preventDefault();
         $.ajax({
            type:"POST",
            url:"<?php echo $CFG->wwwroot.'/local/skills/manage.php?flg=update_skill_weightage'?>",
            data:$('#form-weigt').serialize(),
            success:function(response){
               alert(response);
            }
         });
      });*/
      $("#skill").select2();
      $("#skill").change(function(){
         var id = $(this).val();
         // alert(id);
            $.ajax({
               type: "GET",
                url: "http://175.111.182.35/SDVK/local/skills/manage.php?id="+id+"&flg=skill_weightage",
                //data: {'id': id,'audio': 'audio'},
                contentType: "application/html",
                dataType: "html",
               success: function (result) {
                 // alert(result);
                  $('.sub_skill').html(result);
               },
               error: function (xhr, textStatus, errorThrown) { alert(textStatus + ':' + errorThrown); }
           });

            $.ajax({
               type: "GET",
                url: "http://175.111.182.35/SDVK/local/skills/manage.php?id="+id+"&flg=skill_weightage_list",
                //data: {'id': id,'audio': 'audio'},
                contentType: "application/html",
                dataType: "html",
               success: function (result) {
                 // alert(result);
                  $('.sub_skill_list').html(result);
               },
               error: function (xhr, textStatus, errorThrown) { alert(textStatus + ':' + errorThrown); }
           });

            $.ajax({
               type: "GET",
               url: "http://175.111.182.35/SDVK/local/skills/manage.php?id="+id+"&flg=assigned_default_course",
                //data: {'id': id,'audio': 'audio'},
               contentType: "application/html",
               dataType: "html",
               success: function (result) {
                 // alert(result);
                  $('.assigned_default_course').html(result);
               },
               error: function (xhr, textStatus, errorThrown) { alert(textStatus + ':' + errorThrown); }
           });
      });
   });
</script>

<?php
   echo $OUTPUT->footer();