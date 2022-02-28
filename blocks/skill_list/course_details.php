
<?php 
      require_once("locallib.php");
      global $USER;
        $skill_id=required_param('skill_id',PARAM_INT);
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
        
       echo $OUTPUT->header();
     global $CFG, $DB, $USER, $PAGE;
     
     //$id = optional_param('id', $USER->id, PARAM_INT);
     require_once('style_css.php'); 
 ?>
 <link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/css/all.min.css">

<div class="container">
   <div class="card-body p-0">
      <div class="row">
         <div class="col-sm-12 p-0 ">
            <div class="img_div" >
               <img src="<?php echo $course_image; ?>"  width="100%" height="100%">
            </div>
            <div class="summary-text">
               <h3 class="text-white f_text"><?php echo $course_data->fullname; ?></h3>
               <p class="text-white" ><?php echo $course_data->summary; ?></p>

            </div>
            <div>
                <?php
                //rating code
                $ra_sql="SELECT * FROM {skill_course_rating} WHERE courseid=? AND status=? ";
                $ra_data=$DB->get_record_sql($ra_sql,array($id,1));
                if(!empty($ra_data)){
                    if($ra_data->stars==1){
                    echo ' <p class="text-white rating-stars">
                    <span class="text-white ">1</span>
                 <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating3.png"></span>
                <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating2.png"></span>
                <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating2.png"></span>
                 <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating2.png"></span>
                  <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating2.png"></span>
               </p>';
                    }elseif($ra_data->stars==1.5){
                         echo ' <p class="text-white rating-stars">
                         <span class="text-white ">1.5</span>
                  <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating3.png"></span>
                <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating1.png"></span>
                <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating2.png"></span>
                 <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating2.png"></span>
                  <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating2.png"></span>
               </p>';
                    }
                    elseif($ra_data->stars==2){
                         echo ' <p class="text-white rating-stars">

                <span class="text-white ">2</span>
                <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating3.png"></span>
                <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating3.png"></span>
                <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating2.png"></span>
                 <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating2.png"></span>
                  <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating2.png"></span>
                 
               </p>';
                    }
                    elseif($ra_data->stars==2.5){
                         echo ' <p class="text-white rating-stars">
                  <span class="text-white">2.5</span>
                  <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating3.png"></span>
                <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating3.png"></span>
                <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating1.png"></span>
                 <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating2.png"></span>
                  <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating2.png"></span>
               </p>';
                    }
                    elseif($ra_data->stars==3){
                         echo ' <p class="text-white rating-stars">
                  <span class="text-white">3</span>
                  <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating3.png"></span>
                <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating3.png"></span>
                <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating3.png"></span>
                 <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating2.png"></span>
                  <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating2.png"></span>
               </p>';
                    }
                    elseif($ra_data->stars==3.5){
                         echo ' <p class="text-white rating-stars">
                  <span class="text-white">3.5</span>
                 <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating3.png"></span>
                <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating3.png"></span>
                <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating3.png"></span>
                 <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating1.png"></span>
                  <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating2.png"></span>
               </p>';
                    }
                    elseif($ra_data->stars==4){
                         echo ' <p class="text-white rating-stars">
                  <span class="text-white">4</span>
                  <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating3.png"></span>
                <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating3.png"></span>
                <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating3.png"></span>
                 <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating3.png"></span>
                  <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating2.png"></span>
               </p>';
                    }
                      elseif($ra_data->stars==4.5){
                         echo ' <p class="text-white rating-stars">
                  <span class="text-white">4.5</span>
                 <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating3.png"></span>
                <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating3.png"></span>
                <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating3.png"></span>
                 <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating3.png"></span>
                  <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating1.png"></span>
               </p>';
                    }
                      elseif($ra_data->stars==5){
                         echo ' <p class="text-white rating-stars">
                  <span class="text-white">5</span>
                  <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating3.png"></span>
                <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating3.png"></span>
                <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating3.png"></span>
                 <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating3.png"></span>
                  <span><img src="'.$CFG->wwwroot.'/theme/skills/pix/rating3.png"></span>
               </p>';
                    }

                    echo '<p class="text-white">( '.number_format($ra_data->no_of_user).' ratings)</p>';

                }else{


                ?>
               <!-- <p class="text-white">
                  <span class="text-white">3.5</span>
                  <span><img src=""></span>
                  <span class="fa fa-star checked"></span>
                  <span class="fa fa-star checked"></span>
                  <span class="fa fa-star-half-alt checked"></span>
                  <span class="fa fa-star"></span>
               </p>
               <p class="text-white">(4,565 ratings)</p> -->
           <?php } ?>
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
         <div class="d-flex justify-content-between align-items-center w-100">
          <div class="text-left goToDash">
           <h5> <a href="<?php echo $CFG->wwwroot.'/blocks/skill_list/skilling_path.php?skill_id='.$skill_id; ?>" class="btn btn-primary">Skilling Path</a></h5>
         </div>
         <div class=" text-right start_learning">
            <a href="<?php echo $CFG->wwwroot.'/course/view.php?id='.$id; ?>" class="btn btn-primary ">Start Learning</a>
         </div>
             
         </div>
      </div>
   </div>
</div>
<style type="text/css">
    .img_div{
        margin-bottom: 30px;
        height: 500px;
    }
    .btn-skill{
        display: none;
    }

    .img_div img{
        width: 100%;
        height: 100%;
        object-fit: cover;
    }

    .rating-stars img{
        width: 30px;
        height: 30px;
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
    #course-header a{
      color:#fff;
    }
    .goToDash h5 a{
      color: #fff;
    }

    .goToDash h5{
        margin-bottom: 0px;
    }
    @media (max-width: 768px) {
       .summary-text{
          text-align: justify;
       }
       #course-header{
        display: flex;
        justify-content: center;
        width: 100%;
        padding-bottom: 10px;
       }

       .f_text{
        font-size: 20px;
       }

       .img_div{
        margin-bottom: 15px;
	height: fit-content;
       }
	
    	}

    @media(max-width:  568px){
       .text-left.goToDash a{
            font-size: 12px;
        }
        .start_learning a{
            font-size: 12px;
        }
	
	.img_div{
        margin-bottom: 15px;
	height: fit-content;
       }

	}
</style>
<script type="text/javascript">
   $("#course-header").html("<a href='<?php echo $CFG->wwwroot.'/blocks/skill_list/skilling_path.php?skill_id='.$skill_id?>'> Go to Skilling Path </a>");
    
</script>
<?php echo $OUTPUT->footer();?>