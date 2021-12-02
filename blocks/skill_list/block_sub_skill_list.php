
<?php 
    require_once('../../config.php');
     global $CFG, $DB, $USER, $PAGE;
     $id = optional_param('id', $USER->id, PARAM_INT); 
 ?>


<script src="https://use.fontawesome.com/47886b77a3.js"></script>

<style type="text/css">
  
  .container .content {
    display: none;
    padding : 5px;
   }
   .text{
    float: left;
   }
   .text_button{
    float: right;
   }
   
   .my_skill_body{
      background: #343a40;
   }

   .btn_sty{
      background: none;
      border-radius: 30px;
      padding: 8px;
      border-color: purple;
      border: 2px solid #c87ec8;
      color: white;
      width: 442px;
      padding: 10px 30px;
   }
   .btn_sty:hover{
      color: white;
      text-decoration: none;
   }
   .skill_box{
      border: 1px solid gray;
      padding: 30px;
   }

   .my_skill{
      padding-left: 24px;
   }
   .progressbar{
      float: left;
      color: white;

   }
   .progressbar_text{
      float: left;
      color: white;
      padding-left: 10px;
   }
   .graph{
      float: left;
      color: white;

   }
   .graph_text{
      float: left;
      color: white;
      padding-left: 10px;
   }
   .progress{
      height: 23px;

   }
.skilltext{
   color: white;
}

.improve_btn{
padding: 35px 0px;
}
</style>


<?php
      $siklls = $DB->get_records_sql("SELECT DISTINCT {assign_skill}.skill_id,{assign_skill}.skill_proficiency_label,{skill}.id,{skill}.skill  FROM {skill} INNER JOIN {assign_skill} ON {skill}.id = {assign_skill}.skill_id WHERE {assign_skill}.user_id ='".$id."'");
      ?>
   
      <div class="container">
         <div class="card-body my_skill_body">
            <div class="row">
               <div class="col-sm-6">
                  <div class="progressbar">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRthuL703AV9RF1QEy3Q4zySyQBrinKSOk6Ow&usqp=CAU" width="150px">
                  </div>
                  <div class="progressbar_text">
                     <p><b>151hrs</b></p>
                     <p>Spent for learning</p>
                  </div>
               </div>
               <div class="col-sm-6">
                  <div class="graph">
                     <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRcZk2saoiqfBJfwq7AsiwgJocHyVL03Nur1dEKdPfUV1a3XCDtHMYVlaWi41JQr7mAyQc&usqp=CAU" width="150px">
                  </div>
                  <div class="graph_text">
                     <p><b>45hrs</b></p>
                     <p>This week</p>
                  </div>
               </div>
            </div> 
         </div>
          <div class="card-body my_skill_body">
            <div class="row">
           
               <div class="col-sm-6">
                  <h3 class="my_skill text-white">My Skills</h3>
               </div>
               
            </div>
         </div>

         <div class="card-body my_skill_body">
            <?php
            foreach ($siklls as $value) {
               
               // $cours_id = $DB->get_record_sql("SELECT DISTINCT {skill_weightage}.default_course FROM {skill_weightage} where {skill_weightage}.skill_id = $value->id");

               ?>    
               <div class="skill_box">
                  <div class="row header">
                     <div class="col-sm-12 skilltext" ><h5><?=$value->skill?> </h5>
                     </div>
                  </div>
                   
                  <div class="content">  
                     <div class="progress" style="height:23px;">
                        <div class="progress-bar" role="progressbar" id="a" data-id="'.$value->skill_proficiency_label.'" style="width:25%;background:#0f6fc5;">
                         Awareness <label id="a"> </label>
                        </div>

                       <div class="progress-bar" role="progressbar" data-id="'.$value->skill_proficiency_label.'" style="width:25%;background:#379cf7;">
                         Knowledge <label id="k"> </label>
                        </div>

                        <div class="progress-bar" role="progressbar" data-id="'.$value->skill_proficiency_label.'" style="width:25%;background:#57b0ff">
                         Skilled <label id="s"> </label>
                        </div>

                        <div class="progress-bar" role="progressbar" data-id="'.$value->skill_proficiency_label.'" style="width:25%;background:#5caaf0">
                         Mastery <label id="m"> </label>
                        </div>
                     </div>

                     <div class="improve_btn">
                        <div class="text_button"><a class="btn_sty improve" href="block_sub_skill_list">Continue Learning</a>
                        </div>
                     </div>

                  </div>
               </div>
               <br>
              
            <?php } ?>
         </div>
      </div> 
       

