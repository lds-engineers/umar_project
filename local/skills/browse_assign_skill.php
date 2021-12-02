<?php require_once("../../config.php");
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
</style>
<div class="container-flow">
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
                              <select class="form-control" id="user" name="user">
                                  <option value="">select one</option>
                                 <?php 
                                   $users = $DB->get_records_sql("SELECT DISTINCT {assign_skill}.user_id,{user}.id,{user}.firstname,{user}.lastname FROM {user} INNER JOIN {assign_skill} ON {user}.id = {assign_skill}.user_id");


                                    foreach($users as $user){
                                 ?>
                                 <option value="<?=$user->id?>"><?=$user->firstname?> <?=$user->lastname?></option>
                              <?php } ?>
                              </select> 
                           </div>
                        </div>
                       
                     </div>
                     <div class="col-sm-6">
                        <div class="form-group">
                         <label class="control-label" for="pwd">Skill: </label>
                         <div class="col-sm-12">
                           <div class="toggle-box-region browse_sub_skill" >
                            
                           </div> 

                         </div>
                       </div> 
                     </div>
                  </div>
                  
                 
                 <div class="form-group">
                   <div class="col-sm-offset-2 col-sm-10">
                     <input type="hidden" name="flg" value="update_assign_Skill">
                     <button type="submit" class="btn btn-primary">Update Asign skill to user</button>
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

      $("#user").select2();

      // 

      // $("#user").change(function(){
      //    alert("skill");
      // var user_id = $(this).val();
      //    $.ajax({
      //       type: "GET",
      //        url: "http://175.111.182.35/SDVK/local/skills/manage.php?id="+user_id+"&flg=exit_skill",
      //        //data: {'id': id,'audio': 'audio'},
      //        contentType: "application/html",
      //        dataType: "html",
      //       success: function (result) {
      //         // alert(result);
      //          $('.skill_data').html(result);
      //       },
      //       error: function (xhr, textStatus, errorThrown) { alert(textStatus + ':' + errorThrown); }
      //   });
      // });


      $("#user").change(function(){
         // alert("user")
      var user_id = $(this).val();
         $.ajax({
            type: "GET",
             url: "http://175.111.182.35/SDVK/local/skills/manage.php?id="+user_id+"&flg=assign_sub_skill_exit",
             //data: {'id': id,'audio': 'audio'},
             contentType: "application/html",
             dataType: "html",
            success: function (result) {
              // alert(result);
               $('.browse_sub_skill').html(result);
            },
            error: function (xhr, textStatus, errorThrown) { alert(textStatus + ':' + errorThrown); }
        });
      });

   });

</script>

<?php
   echo $OUTPUT->footer();