

<?php 
defined('MOODLE_INTERNAL') || die();
require_once("../../config.php");
require_once ("$CFG->libdir/formslib.php");
class Sub_skill_form extends moodleform {
    public function definition() {
        global $DB, $USER, $CFG;
        $mform = $this->_form; 

        $skills = $DB->get_records_sql("SELECT * FROM {skill}");
        $skill_list = array();
        $skill_list[0]='';
        if (count($skills)>0) {
            foreach($skills as $skill){
               $skill_list[$skill->id]=$skill->skill;
            }
            $courseoptions = array(                                                    
                'noselectionstring' => get_string('nosubskillselected', 'local_skills')
            );
            $mform->addElement('autocomplete', 'skill_id', get_string('selectsubskills', 'local_skills'), $skill_list);
            $mform->addRule('skill_id', get_string('nosubskillselected', 'local_skills'), 'required', 'client');

            $mform->addElement('text', 'sub_skills', 'Sub Skills','Required');

	        $buttonarray = array();
	        $buttonarray[] = &$mform->createElement('submit', 'save', 'Add Sub Skills' );
	        $buttonarray[] = &$mform->createElement('cancel');
	        $mform->addGroup($buttonarray, 'buttonar', '', array(' '), false);
	        $mform->closeHeaderBefore('buttonar');
    	}	 	
   }
   		public function validation($data) {
	        $error = array();
	        if($data['skill_id'] == 0){
	            $error['skill_id']=get_string('nosubskillselected', 'local_skills');
	        }
	        return $error;
	   	} 
   		public function addsubskills($dataform) {   //For insert sub skill data in database
		    global $DB, $CFG;
		    $DB->insert_record('sub_skill', $dataform);  
    	}
	
}