<?php
require_once('../config.php');
global $PAGE,$DB,$OUTPUT;
//$P/*AGE->set_url(new moodle_url('/login/forgot-password.php'));*/
//$PAGE->set_pagelayout('login');
$PAGE->set_title('Forgot Password');
$PAGE->requires->jquery();
 //echo $OUTPUT->header();



 require_once($CFG->libdir.'/authlib.php');
require_once(__DIR__ . '/lib.php');
require_once('forgot_password_form2.php');
require_once('set_password_form.php');

$token = optional_param('token', false, PARAM_ALPHANUM);

$PAGE->set_url('/login/forgot-password.php');
$systemcontext = context_system::instance();
$PAGE->set_context($systemcontext);

// setup text strings
$strforgotten = get_string('passwordforgotten');
$strlogin     = get_string('login');

/*$PAGE->navbar->add($strlogin, get_login_url());
$PAGE->navbar->add($strforgotten);
$PAGE->set_title($strforgotten);
$PAGE->set_heading($COURSE->fullname);*/
$PAGE->set_pagelayout('login');

// if alternatepasswordurl is defined, then we'll just head there
/*if (!empty($CFG->forgottenpasswordurl)) {
    redirect($CFG->forgottenpasswordurl);
}*/

// if you are logged in then you shouldn't be here!
if (isloggedin() and !isguestuser()) {
    redirect($CFG->wwwroot.'/index.php', get_string('loginalready'), 5);
}

// Fetch the token from the session, if present, and unset the session var immediately.
$tokeninsession = false;
if (!empty($SESSION->password_reset_token)) {
    $token = $SESSION->password_reset_token;
    unset($SESSION->password_reset_token);
    $tokeninsession = true;
}

if (empty($token)) {
    // This is a new password reset request.
    // Process the request; identify the user & send confirmation email.
    core_login_process_password_reset_request();
} else {
    // A token has been found, but not in the session, and not from a form post.
    // This must be the user following the original rest link, so store the reset token in the session and redirect to self.
    // The session var is intentionally used only during the lifespan of one request (the redirect) and is unset above.
    if (!$tokeninsession && $_SERVER['REQUEST_METHOD'] === 'GET') {
        $SESSION->password_reset_token = $token;
        redirect($CFG->wwwroot . '/login/forgot_password.php');
    } else {
        // Continue with the password reset process.
        core_login_process_password_set($token);
    }
}

 ?>
<style type="text/css">

	#region-main{
		height: 100%;
		display: flex;
justify-content: center;
align-items: center;
	}
	.col-form-label{
		display: none;
	}

	.flex-colmun{
		display: flex;
		flex-direction: column;
	}

	#region-main [role="main"]{
		display: flex;
		justify-content: center;
		align-items: center;

	}

	#id_email.is-invalid{
		margin-bottom: 0px;
		margin-top: 15px; 
	}

	#id_email.is-invalid:focus{
		box-shadow: none;
	}
	.sss{
		display: flex;
		align-items: center;
		background: #363641;
		border-radius: 4px;
		padding: 0px 7px;
		width: 100%;
		height: 40px;
	}

	.sss i{
		margin-right: 5px;
		color: #777780;
	}

	.sss input{
		border: none;
		outline: none;
		background: transparent;
		max-width: 250px !important;
		margin-bottom: 10px;
	}

	.sss input:focus{
		box-shadow: none;
		background: transparent;
	}

	.form-group{
		margin: 0px;
	}

	.skills-forgot-password{
		text-align: center;
	}

	#id_submitbuttonemail{
		width: 100%;
		margin-top: 15px;
		border-radius: 4px;
	}

	.login_link{
		margin: 10px 20px;
		/*font-size: 20px;*/
	}

	.login_link a{
		color: #4abef7;
		cursor: pointer;
		text-decoration: none;
		outline: none;
	}
	#fitem_id_email .felement{
		max-width: 250px;
	}

</style>
 <script type="text/javascript">
 	$(function(){
 		$('.form-inline').removeClass('col-md-9');
 		$('.form-inline').addClass('col-md-12');
 	});
 </script>
 <!-- <div class="container">

 	<div class="row">
 		<div class="col-12">
 			<div>
 				<h1>Forgot Your Password?</h1>
 			</div>
 			<form class="form-horizontal">
 				<div class="form-row">
 					<div class="col-12">
 						<input type="email" name="email" placeholder="Enter Email" class="form-control">
 					</div>
 				</div>
 			</form>
 		</div>
 	</div>
 </div> -->



