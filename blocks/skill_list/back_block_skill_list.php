<?php

class block_skill_list extends block_base {
   public function init() {
      $this->title = get_string('skill_list', 'block_skill_list');
   }
   // The PHP tag and the curly bracket for the class definition 
   // will only be closed after there is another function added in the next section.


   public function get_content() {
   global $CFG, $DB, $USER, $PAGE;
      if ($this->content !== null) {
          return $this->content;
      }

      $this->content->footer = '';
     
        return $this->content;
    }
}
