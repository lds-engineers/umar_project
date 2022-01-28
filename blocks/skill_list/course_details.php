
<?php 
      require_once("locallib.php");
      global $USER;
   
        $id=required_param('id',PARAM_INT);
        $PAGE->requires->jquery();
        $PAGE->set_url('/blocks/skill_list/course_details.php', array('id' => $id));
        $PAGE->set_title('Course Detail');
        $PAGE->set_heading('Course Detail');
        $blocksApi=new blocksApi();
        //check_course
        if(!$blocksApi->check_course($id)){
            redirect($CFG->wwwroot,"You enter wrong course id in url. ",null, \core\output\notification::NOTIFY_ERROR);
        }
        $blocksApi->enroll($id,$USER->id,5);
        $course_data=$blocksApi->course_summary($id);
        $course_image=$blocksApi->getcourse_image($id);
        $course_content=$blocksApi->course_content($id);
        /*echo "<pre>";
        print_r($course_content);
        echo "</pre>";*/
       echo $OUTPUT->header();
     global $CFG, $DB, $USER, $PAGE;
     
     //$id = optional_param('id', $USER->id, PARAM_INT);
     require_once('style_css.php'); 
 ?>
 <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">

<div class="container">
   <div class="card-body">
      <div class="row">
         <div class="col-sm-12">
            <div class="img_div" >
               <img src="<?php echo $course_image; ?>"  width="100%" height="100%">
            </div>
            <div class="summary-text">
               <h3 class="text-white f_text"><?php echo $course_data->fullname; ?></h3>
               <p class="text-white" ><?php echo $course_data->summary; ?></p>

            </div>
            <div>
               <p class="text-white">
                  <span class="text-white">3.5</span>
                  <span class="fa fa-star checked"></span>
                  <span class="fa fa-star checked"></span>
                  <span class="fa fa-star checked"></span>
                  <span class="fa fa-star"></span>
                  <span class="fa fa-star"></span>
               </p>
               <p class="text-white">(4,565 ratings)</p>
            </div>
         </div>
         <div class="col-sm-12">
            <div>
               <p class="text-white">By abc</p>
               <p class="text-white"><i class="fa fa-globe"></i> &nbsp;&nbsp; &nbsp;&nbsp;English</p>
               <p class="text-white"><i class="fa fa-cc" aria-hidden="true"></i> &nbsp;&nbsp; &nbsp;&nbsp;English</p>
            </div>
         </div>
         <div class="col-sm-12">
            <h3 class="text-white mb-20">Curriculum</h3>
            <div class="flex flex-column faq-section">  
               <div id="accordion">

                <?php
                $i=1;
                $j=1;
                    foreach($course_content as $content_list){
                       /* echo "<pre>";
                        print_r($content_list);
                        echo "</pre>";*/
                        if($j==1){
                            $j++;
                            continue;
                        }


                ?>

                  <div class="text-white">
                     <div class="card-header" id="<?php echo $content_list['id']; ?>">
                      <h5 class="mb-0">
                        <a class="collapsed text-white" role="button" data-toggle="collapse" href="#collapse-<?php echo $i; ?>" aria-expanded="false" aria-controls="collapse-<?php echo $i; ?>"> <?php echo $content_list['name']; ?> </a>
                      </h5>
                     </div>
                     <div id="collapse-<?php echo $i; ?>" class="collapse <?php if($i==1) echo 'show'; ?>" aria-expanded="false" data-parent="#accordion"  aria-labelledby="<?php echo $content_list['id']; ?>">
                        <div class="card-body text-white">
                            <p >
                           <?php echo $content_list['summary']; ?>
                       </p>
                       <?php if(!empty($content_list['modules'])){ ?>
                       <h5>Activity List</h5>
                       <ol class="activity-list">
                        <?php
                            foreach($content_list['modules'] as $activity_list){

                        ?>
                           <li><?php echo $activity_list['name']; ?></li>
                       <?php } ?>
                       </ul>
                   <?php } ?>
                        </div>
                     </div>
                  </div>
              <?php $i++; } ?>

                <!--   <div class="text-white">
                    <div class="card-header" id="heading-2">
                      <h5 class="mb-0">
                        <a class="collapsed text-white" role="button" data-toggle="collapse" href="#collapse-2" aria-expanded="false" aria-controls="collapse-2">
                         Section2 - Creating your team version</a>
                      </h5>
                    </div>
                    <div id="collapse-2" class="collapse" data-parent="#accordion" aria-labelledby="heading-2">
                      <div class="card-body text-white">
                        After subscription you will get our special trade copier. If you want to use this copier for business purpose or other commercial pupose then directly contact with www.fxcopier.co.uk.
                      </div>
                    </div>
                  </div> -->
                 <!--  <div class="text-white">
                    <div class="card-header" id="heading-3">
                      <h5 class="mb-0">
                        <a class="collapsed text-white" role="button" data-toggle="collapse" href="#collapse-3" aria-expanded="false" aria-controls="collapse-3">
                         Section3 - Definig your team goals</a>
                      </h5>
                    </div>
                    <div id="collapse-3" class="collapse" data-parent="#accordion" aria-labelledby="heading-3">
                      <div class="card-body text-white">
                        After subscription you will get our special trade copier. If you want to use this copier for business purpose or other commercial pupose then directly contact with www.fxcopier.co.uk.
                      </div>
                    </div>
                  </div> -->
                  <!-- <div class="text-white">
                    <div class="card-header" id="heading-4">
                      <h5 class="mb-0">
                        <a class="collapsed text-white" role="button" data-toggle="collapse" href="#collapse-4" aria-expanded="false" aria-controls="collapse-4">
                         Section4 - Bonus Points </a>
                      </h5>
                    </div>
                    <div id="collapse-4" class="collapse" data-parent="#accordion" aria-labelledby="heading-4">
                      <div class="card-body text-white">
                        After subscription you will get our special trade copier. If you want to use this copier for business purpose or other commercial pupose then directly contact with www.fxcopier.co.uk.
                      </div>
                    </div>
                  </div> -->
               </div>
            </div>
         </div>
         <div class="col-sm-12">
            <h3 class="text-white mt-3">This course includes</h3>
           <div>
               <p class="text-white"><i class="fa fa-clock-o"></i> &nbsp;&nbsp; &nbsp;&nbsp;Full Life time assess</p>
               <p class="text-white"><i class="fa fa-cc" aria-hidden="true"></i> &nbsp;&nbsp; &nbsp;&nbsp;Access on Mobile and Desktop</p>
            </div>
         </div>
         <div class="col-sm-12 text-right">
            <a href="<?php echo $CFG->wwwroot.'/course/view.php?id='.$id; ?>" class="btn btn-primary ">Start Learning</a>
         </div>
      </div>
   </div>
</div>
<style type="text/css">
    .img_div{
        height: 500px;
        margin-bottom: 30px;
    }

    .img_div img{
        width: 100%;
        height: 100%;
        object-fit: cover;
    }
    .breadcrumb-item{
        color: #000;
    }

    .f_text{
       font-size: 35px;
       font-weight: 400;
       text-align: left;
    }
    #accordion div{
       background-color: #363641;
       margin-top: 5px;
    }

    #accordion a:focus{
       box-shadow: none;
    }
    .summary-text{
          text-align: justify;
       }

       .mb-20{
         margin-bottom: 15px;
       }
    
    @media (max-width: 768px) {
       .summary-text{
          text-align: justify;
       }
       .img_div{
         height: auto;
       }
    }
</style>
<?php echo $OUTPUT->footer();?>