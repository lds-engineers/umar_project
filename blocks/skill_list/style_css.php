<script src="https://use.fontawesome.com/47886b77a3.js"></script>

<style type="text/css">
  
  .container .content {
    display: none;
    padding : 5px;
    background: #4f4e4e;
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
      border: 2px solid #a63db5;;
      color: white;
    
      padding: 10px 45px;
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
float: left;
}
.improve{
   background: #0f6fc5;
   border: #0f6fc5;
}
.header a{
  text-decoration: none;
  color: #fff;
}
.header a: hover{
  text-decoration: none;
  color: #fff;
}

.progress {
    position: absolute;   
    height: 160px;
    width: 160px;
    cursor: pointer;
    top: 50%;
    left: 24%;
    margin: -80px 0 0 -80px;
    background: none;
}

.progress-circle {
  transform: rotate(-90deg);
   /*margin-top: -40px;*/
}

.progress-circle-back {
   fill: none; 
   stroke: #D2D2D2;
   stroke-width:10px;
}

.progress-circle-prog {
   fill: none; 
   stroke: #7E3451;
   stroke-width: 10px;  
   stroke-dasharray: 0 999;    
   stroke-dashoffset: 0px;
   transition: stroke-dasharray 0.7s linear 0s;
}

.progress-text {
   width: 100%;
   position: absolute;
   top: 60px;
   text-align: center;
   font-size: 2em;
   color: #fff;
}
 

/*.btn {
  background-color: #55b776;
  margin: 5px;
  width: 75px;
  color: white;
}*/
.btn:hover {
  color: white;
}
.btn:focus {
  color: white;
}
.btn-container {
  display: flex;
  justify-content: center;
  width: 100%;
  padding-top: 30px;
}

.t_position{
   position: absolute;
text-align: center;
top: 190px;
left: 50px;
}

.p_top{
   padding-top: 50px;
}

/*.dash_board{
border-top: 1px dashed white;
position: absolute;
top: 156px;
position: relative;
top: 25px;
width: 731px;
left: 154px;
}*/

.space-between{
   display: flex;
   justify-content: space-between;
   flex-wrap: wrap;
   align-items: center;
}
.main_block .header{
   padding: 20px;
}
.box{
   background: #5b5959;
}

}

/*second progress*/


@charset "UTF-8";
/ Mixins /
/ Color Variables /
/ Theme Variables /
/ Animations /
@-webkit-keyframes bounce {
  0% {
    transform: scale(1);
  }
  33% {
    transform: scale(0.9);
  }
  66% {
    transform: scale(1.1);
  }
  100% {
    transform: scale(1);
  }
}
@keyframes bounce {
  0% {
    transform: scale(1);
  }
  33% {
    transform: scale(0.9);
  }
  66% {
    transform: scale(1.1);
  }
  100% {
    transform: scale(1);
  }
}


/*/ Base Styles /*/


body {
 
  color: #fff;
 
}



/*/ Component Styles - Steps /*/


.steps {
  display: flex;
  width: 100%;
  margin: 0;
  padding: 0 0 2rem 0;
  list-style: none;
}

.step {
  display: flex;
  align-items: center;
  justify-content: center;
  flex-direction: column;
  flex: 1;
  position: relative;
  pointer-events: none;
  z-index: 100;
}
.step--active, .step--complete {
  cursor: pointer;
  pointer-events: all;
}
.step:not(:last-child):before, .step:not(:last-child):after {
  display: block;
  position: absolute;
  top: 50%;
  left: 50%;
  height: 0.25rem;
  content: "";
  transform: translateY(-50%);
  will-change: width;
  z-index: -1;
}
.step:before {
  width: 100%;
  background-color: #e6e7e8;
}
.step:after {
  width: 0;
  background-color: #ff2267;
}
.step--complete:after {
  width: 100% !important;
  opacity: 1;
  transition: width 0.6s ease-in-out, opacity 0.6s ease-in-out;
}

.step__icon {
  display: flex;
  align-items: center;
  justify-content: center;
  position: relative;
  width: 3rem;
  height: 3rem;
  background-color: #292627;
  border: 0.25rem solid #e6e7e8;
  border-radius: 50%;
  color: transparent;
  font-size: 2rem;
}
.step__icon:before {
  display: block;
  color: #fff;
  content: "✓";
}
.step--complete.step--active .step__icon {
  color: #fff;
  transition: background-color 0.3s ease-in-out, border-color 0.3s ease-in-out, color 0.3s ease-in-out;
}
.step--incomplete.step--active .step__icon {
  border-color: #ff2267;
  transition-delay: 0.5s;
}
.step--complete .step__icon {
  -webkit-animation: bounce 0.5s ease-in-out;
          animation: bounce 0.5s ease-in-out;
  background-color: #ff2267;
  border-color: #ff2267;
  color: #fff;
}

.step__label {
  position: absolute;
  bottom: -2rem;
  left: 50%;
  margin-top: 1rem;
  font-size: 0.8rem;
  text-transform: uppercase;
  transform: translateX(-50%);
}
.step--incomplete.step--inactive .step__label {
  color: #e6e7e8;
}
.step--incomplete.step--active .step__label {
  color: #fff;
}
.step--active .step__label {
  transition: color 0.3s ease-in-out;
  transition-delay: 0.5s;
  color: #fff;
}


/*Skilling path*/

#region-main{
      background: #343a40;
   }
.checked {
  color: orange;
}
.outer{
   background: #585859;;
   padding: 30px;
   margin-bottom: 68px;
   border-radius: 20px;
}

.course_img img{
   height: 80%;
   width: 100%;
}


 #region-main{
      background: #343a40;
   }
.checked {
  color: orange;
}

.faq-section .mb-0 > a {
  display: block;
  position: relative;
}

.faq-section .mb-0 > a:after {
  content: "\f067";
  font-family: "Font Awesome 5 Free";
  position: absolute;
  right: 0;
  font-weight: 600;
}

.faq-section .mb-0 > a[aria-expanded="true"]:after {
  content: "\f068";
  font-family: "Font Awesome 5 Free";
  font-weight: 600;
}
.img_div img{
  border-radius: 20px;
}


</style>

