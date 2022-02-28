<?php 
defined('MOODLE_INTERNAL') || die();
require_once("../../config.php");
require_once ("$CFG->libdir/formslib.php");
class Skill_form extends moodleform {
    public function definition() {
        global $DB, $USER, $CFG;
        $mform = $this->_form; 

        $mform->addElement('text', 'skill', 'Skills','Required');

        $buttonarray = array();
        $buttonarray[] = &$mform->createElement('submit', 'save', 'Add Skills' );
        $buttonarray[] = &$mform->createElement('cancel');
        $mform->addGroup($buttonarray, 'buttonar', '', array(' '), false);
        $mform->closeHeaderBefore('buttonar');
    }
   
    public function addskills($dataform) { 
      global $DB, $CFG;
      $DB->insert_record('skill', $dataform);
    }
}