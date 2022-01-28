
<?php 
    require_once('../../config.php');
     echo $OUTPUT->header();
     global $CFG, $DB, $USER, $PAGE;
     $id = optional_param('id', $USER->id, PARAM_INT); 
 ?>

<style type="text/css">
    @import url('https://fonts.googleapis.com/css?family=Poppins&display=swap');
body {
  font-family: 'Poppins', sans-serif;
  margin :15% 0 0 0;  
  padding:50px;
  font-size:16pt;
}
.noselect {
  -webkit-touch-callout: none; /* iOS Safari */
    -webkit-user-select: none; /* Safari */
     -khtml-user-select: none; /* Konqueror HTML */
       -moz-user-select: none; /* Old versions of Firefox */
        -ms-user-select: none; /* Internet Explorer/Edge */
            user-select: none; /* Non-prefixed version, currently
                                  supported by Chrome, Opera and Firefox */
}
.time-picker {
  display:flex;
  align-items:center;
  margin:0 auto;
  width:150px;
  justify-content:space-evenly;
  border:1px solid #ccc;
  border-radius:10px;
  padding:25px;
}
.tp-col {
  display:flex;
  flex-direction:column;
  align-items: inherit;
}
.tp-hr>span,.tp-min>span {
  border:1px solid #ccc;
  padding:4px 4px ;
  border-radius:4px;
  width:25px;
  text-align:center;
  font-size:15pt;
}
.tp-up-arrow,.tp-down-arrow {
  cursor:pointer;
  width:15px;
  height:15px;
}
.tp-am-pm {
  cursor:pointer;
  display:block;
  padding:1px 3px;
  border-radius:5px;
}
.tp-am-pm:hover {
  background:#eaeaea;
}
.tp-hr,.tp-min {
  
}
</style>
<div class="container">
   <div class="card-body">
      <div class="row">
         <div class="col-sm-12">
             <h2> Set your weekly goals </h2>
             <h3>Numbrer of course</h3>
         </div>
         <div class="col-sm-12">
             <div class="row">
                 <div class="set_time">
                     <div class=""><i class="fa fa-minus" aria-hidden="true"></i></div>
                     <div class="">2  Course in a week</div>
                     <div class=""><i class="fa fa-plus" aria-hidden="true"></i></div>
                 </div>
             </div>
         </div>
         <div class="col-sm-12">
            <h3>numbers of hovers</h3>

            <div class="time-picker">
                <div class="tp-col tp-hr">  
                  <img src="https://image.flaticon.com/icons/svg/2089/2089643.svg"  class="tp-up-arrow"/>
                  <span class="noselect" tabindex="0*">00</span>
                  <img src="https://image.flaticon.com/icons/svg/2089/2089636.svg" class="tp-down-arrow"/>
                </div>
                <div class="tp-col">
                  <span>:</span>
                </div>
                <div class="tp-col tp-min">
                  <img src="https://image.flaticon.com/icons/svg/2089/2089643.svg"  class="tp-up-arrow"/>
                 <span tabindex="0">00</span>
                  <img src="https://image.flaticon.com/icons/svg/2089/2089636.svg" class="tp-down-arrow"/>
                </div>
                <div class="tp-col">
                  <span class="tp-am-pm">AM</span>
                </div>
            </div>
        </div>
      </div>
   </div>
</div>
<script type="text/javascript">
    $(document).ready(function(){
  var c_time=ct(new Date());
  var hr=parseInt(c_time.split(':')[0]);
  var min=parseInt(c_time.split(':')[1]);
  var meridiem=c_time.split(':')[2];
  $('.tp-min>span').html(min<10?'0'+min:min);
  $('.tp-hr>span').html(hr);
  $('.tp-am-pm').html(meridiem);
  $('.tp-hr>.tp-up-arrow').click(function(){
    hr=parseInt($('.tp-hr>span').html());
    hr=(hr==1?12:hr-=1);
    $('.tp-hr>span').html(hr);
  });
  $('.tp-min>.tp-up-arrow').click(function(){
    min=parseInt($('.tp-min>span').html());
    min=(min==00?59:min-=1);
    $('.tp-min>span').html(min<10?'0'+min:min);
  });
  $('.tp-hr>.tp-down-arrow').click(function(){
    hr=parseInt($('.tp-hr>span').html());
    hr=(hr==12?1:hr+=1);
    $('.tp-hr>span').html(hr);
  });
  $('.tp-min>.tp-down-arrow').click(function(){
    min=parseInt($('.tp-min>span').html());
    min=(min==59?00:min+=1);
    $('.tp-min>span').html(min<10?'0'+min:min);
  });
  $('.tp-am-pm').click(function(){
    meridiem=meridiem=='AM'?'PM':'AM';
    $('.tp-am-pm').html(meridiem);
  });
  $('.tp-hr').on('wheel', function(event){
    var oEvent = event.originalEvent,
        delta  = oEvent.deltaY || oEvent.wheelDelta;
    if (delta > 0) {
      hr=(hr==12?1:hr+=1);
    } else {
      hr=(hr==1?12:hr-=1);
    }
    $('.tp-hr>span').html(hr);
  });
  $('.tp-min').on('wheel', function(event){
    var oEvent = event.originalEvent,
        delta  = oEvent.deltaY || oEvent.wheelDelta;
    if (delta > 0) {
      min=(min==59?00:min+=1);
    } else {
      min=(min==00?59:min-=1);
    }
    $('.tp-min>span').html(min<10?'0'+min:min);
  });
  $(".tp-hr>span").click(function() {
    this.focus();
    $('.tp-hr>span').html('&nbsp;');
    $(this).keyup(function(e) {
      console.log(e.keyCode);
      $('.tp-hr>span').html();
      if(/[0-9]/.test(e.key)) {
        var cVal=$('.tp-hr>span').html();
        if(cVal=='&nbsp;') {
          $('.tp-hr>span').html(e.key);
        } else {
          if(cVal==0) {
            $('.tp-hr>span').append(e.key);
            exitHr(this,$(this));
          } else if(cVal==1) {
            if(/[0-2/]/.test(e.key)) {
              $('.tp-hr>span').append(e.key); 
              exitHr(this,$(this));
            } else {
              $('.tp-hr>span').html(e.key);
            }
          } else {
            $('.tp-hr>span').html(e.key);
          }
        }
      } else if((/13|9/.test(e.keyCode))||(/:/.test(e.key))) {
        exitHr(this,$(this));
      }   
    });
  });

  $(".tp-min>span").click(function() {
    this.focus();
    $('.tp-min>span').html('&nbsp;');
    $(this).keyup(function(e) {
      $('.tp-min>span').html();
      if(/[0-9]/.test(e.key)) {
        var cVal=$('.tp-min>span').html();
        if((cVal=='&nbsp;')&&(/[0-5]/.test(e.key))) {
          $('.tp-min>span').html(e.key);
        } else {
          $('.tp-min>span').append(e.key);
          exitMin(this,$(this));
        }
      } else if((/13|9/.test(e.keyCode))||(/:/.test(e.key))) {
        exitMin(this,$(this));
      }     
    });
  });
  $('.tp-hr>span').blur(function(){
    var a=$('.tp-hr>span').html();
    if((a=='')||(a=='&nbsp;')) {
      var hr=parseInt(ct(new Date()).split(':')[0]);
      $('.tp-hr>span').html(hr);
    }
  });
  $('.tp-min>span').blur(function(){
    var a=$('.tp-min>span').html();
    if((a=='')||(a=='&nbsp;')) {
      var min=parseInt(ct(new Date()).split(':')[1]);
      $('.tp-min>span').html(min);
    }
  });
});
function exitHr(a,b) {
  a.blur();
  b.off('keyup');
  $(".tp-min>span").trigger( "click" );
}
function exitMin(a,b) {
  a.blur();
  b.off('keyup');
}
function ct(date) {
  var hrs = date.getHours();
  var mns = date.getMinutes();
  var mer = hrs >= 12 ? 'PM' : 'AM';
  hrs = hrs % 12;
  hrs = hrs ? hrs : 12;
  mns = mns < 10 ? '0'+mns : mns;
  return (hrs + ':' + mns + ':' + mer);
}
</script>

  <?php echo $OUTPUT->footer();?>

