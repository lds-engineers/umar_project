
 
<style type="text/css">
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
html {
  font-size: 16px;
}

body {
  display: flex;
  align-items: center;
  justify-content: center;
  background-color: #292627;
  color: #e6e7e8;
  font-family: "Montserrat", sans-serif;
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
}
</style>


  <ul class="steps">
  <li class="step step--incomplete step--active">
    <span class="step__icon"></span>
    <span class="step__label">Step 1</span>
  </li>
  <li class="step step--incomplete step--inactive">
    <span class="step__icon"></span>
    <span class="step__label">Step 2</span>
  </li>
  <li class="step step--incomplete step--inactive">
    <span class="step__icon"></span>
    <span class="step__label">Step 3</span>
  </li>
  <li class="step step--incomplete step--inactive">
    <span class="step__icon"></span>
    <span class="step__label">Step 4</span>
  </li>
</ul>


<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>

<script type="text/javascript">
	$('.steps').on('click', '.step--active', function() {
	  $(this).removeClass('step--incomplete').addClass('step--complete');
	  $(this).removeClass('step--active').addClass('step--inactive');
	  $(this).next().removeClass('step--inactive').addClass('step--active');
	});

$('.steps').on('click', '.step--complete', function() {
  $(this).removeClass('step--complete').addClass('step--incomplete');
  $(this).removeClass('step--inactive').addClass('step--active');
  $(this).nextAll().removeClass('step--complete').addClass('step--incomplete');
  $(this).nextAll().removeClass('step--active').addClass('step--inactive');
});
</script>
