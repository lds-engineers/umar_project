<?php
// This file is part of Moodle - http://moodle.org/
//
// Moodle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Moodle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Moodle.  If not, see <http://www.gnu.org/licenses/>.

/**
 * Extend navigation to add new options.
 *
 * @package    local_navigation
 * @author     Carlos Escobedo <http://www.twitter.com/carlosagile>
 * @license    http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 * @copyright  2017 Carlos Escobedo <http://www.twitter.com/carlosagile>)
 */

defined('MOODLE_INTERNAL') || die();

/**
 * Extend Navigation block and add options
 *
 * @param global_navigation $navigation {@link global_navigation}
 * @return void
 */
function local_skills_extend_navigation(global_navigation $navigation) {
    global $DB, $USER, $CFG;
    if(is_siteadmin()){
        // $sidemenu="Add Skills  | ". $CFG->wwwroot."/local/skills/index.php  
        // Assign Skills  | ". $CFG->wwwroot."/local/skills/assignskill.php
        // Browse Assign Skills| ". $CFG->wwwroot."/local/skills/browse_assign_skill.php
        // Course Skills | ". $CFG->wwwroot."/local/skills/courseskill.php
        // Browse Course Skills | ". $CFG->wwwroot."/local/skills/browse_course_skill.php
        // Skills Quiz Mapping | ". $CFG->wwwroot."/local/skills/skill_quiz_mapping.php
        // Browse Skills Quiz Mapping | ". $CFG->wwwroot."/local/skills/browse_skill_quiz_mapping.php
        
        
        // "
         $sidemenu="Add Skills  | ". $CFG->wwwroot."/local/skills/index.php  
        Assign Skills  | ". $CFG->wwwroot."/local/skills/assignskill.php
        Course Skills | ". $CFG->wwwroot."/local/skills/courseskill.php
        Skill Weightage | ". $CFG->wwwroot."/local/skills/skill_weightage.php
        Skills Quiz Mapping | ". $CFG->wwwroot."/local/skills/skill_quiz_mapping.php
        Assign course to sub skill | ". $CFG->wwwroot."/local/skills/assign_course_sub_skill.php
        Proficiency Level Setting | ".$CFG->wwwroot."/local/skills/proficiency_level_setting.php
        Course Rating | ".$CFG->wwwroot."/local/skills/course-rating.php
         Category Setting | ".$CFG->wwwroot."/local/skills/category_settings.php
        "
        ;
        $menu = new custom_menu($sidemenu, current_language());
        if ($menu->has_children()) {
            foreach ($menu->get_children() as $item) {
                local_skills_custom_menu_item($item, 0, null, true);
            }
        }
    }
}

/**
 * ADD custom menu in navigation recursive childs node
 * Is like render custom menu items
 *
 * @param custom_menu_item $menunode {@link custom_menu_item}
 * @param int $parent is have a parent and it's parent itself
 * @param object $pmasternode parent node
 * @param int $flatenabled show master node in boost navigation
 * @return void
 */
function local_skills_custom_menu_item(custom_menu_item $menunode, $parent, $pmasternode, $flatenabled) {
    global $PAGE, $CFG;
    static $submenucount = 0;
    if ($menunode->has_children()) {
        // echo $menunode->has_children();
        // die;
        $submenucount++;
        $url = $CFG->wwwroot;
        if ($menunode->get_url() !== null) {
            $url = new moodle_url($menunode->get_url());
        } else {
            $url = null;
        }
        if ($parent > 0) {
            $masternode = $pmasternode->add(local_skills_get_string($menunode->get_text()),
                                            $url, navigation_node::TYPE_CONTAINER);
            $masternode->title($menunode->get_title());
        } else {
            $masternode = $PAGE->navigation->add(local_skills_get_string($menunode->get_text()),
                                            $url, navigation_node::TYPE_CONTAINER);
            $masternode->title($menunode->get_title());
            if ($flatenabled) {
                $masternode->isexpandable = true;
                $masternode->showinflatnavigation = true;
            }
        }
        // echo "<pre>";
        // print_r($menunode->get_children());
        foreach ($menunode->get_children() as $menunode) {
            local_skills_custom_menu_item($menunode, $submenucount, $masternode, $flatenabled);
        }
        // print_r($menunode);
        // echo "</pre>";
        // die;
    } else {
        $url = $CFG->wwwroot;
        if ($menunode->get_url() !== null) {
            $url = new moodle_url($menunode->get_url());
        } else {
            $url = null;
        }
    //     echo "URL:- ".$url;
    // print_r($parent);
        if ($parent) {
            $childnode = $pmasternode->add(local_skills_get_string($menunode->get_text()),
                                        $url, navigation_node::TYPE_CUSTOM);
            $childnode->title($menunode->get_title());
        } else {
            $masternode = $PAGE->navigation->add(local_skills_get_string($menunode->get_text()),
                                        $url, navigation_node::TYPE_CONTAINER);
            $masternode->title($menunode->get_title());
            // print_r($menunode->get_title());
            if ($flatenabled) {
                $masternode->isexpandable = true;
                $masternode->showinflatnavigation = true;
            }
        }
    // die;
    }

    return true;
}

/**
 * Translate Custom Navigation Nodes
 *
 * This function is based in a short peace of Moodle code
 * in  Name processing on user_convert_text_to_menu_items.
 *
 * @param string $string text to translate.
 * @return string
 */
function local_skills_get_string($string) {
    $title = $string;
    $text = explode(',', $string, 2);
    if (count($text) == 2) {
        // Check the validity of the identifier part of the string.
        if (clean_param($text[0], PARAM_STRINGID) !== '') {
            // Treat this as atext language string.
            $title = get_string($text[0], $text[1]);
        }
    }
    return $title;
}
function proficiency_data(){
    global $DB,$USER;
     $dbman = $DB->get_manager();
     if($dbman->table_exists('proficiency_level')){
        $sql="SELECT * FROM {proficiency_level}";

    $data=$DB->get_records_sql($sql,array());
    if(empty($data)){
        $arr=array(
            array('id'=>1,'proficiency_level'=>'Awareness','minimum_range'=>0,'maximum_range'=>40,'createdby'=>2,'modifiedby'=>2,'createddate'=>1640071513,'modifieddate'=>1640071513,'modify'=>'2021-11-26 15:59:11','deleted'=>0),
            array('id'=>2,'proficiency_level'=>'Awareness','minimum_range'=>0,'maximum_range'=>40,'createdby'=>2,'modifiedby'=>2,'createddate'=>1640071513,'modifieddate'=>1640071513,'modify'=>'2021-11-26 15:59:11','deleted'=>0),
            array('id'=>3,'proficiency_level'=>'Knowledge','minimum_range'=>41,'maximum_range'=>60,'createdby'=>2,'modifiedby'=>2,'createddate'=>1640071513,'modifieddate'=>1640071513,'modify'=>'2021-11-26 15:59:11','deleted'=>0),
            array('id'=>4,'proficiency_level'=>'Skilled','minimum_range'=>61,'maximum_range'=>80,'createdby'=>2,'modifiedby'=>2,'createddate'=>1640071513,'modifieddate'=>1640071513,'modify'=>'2021-11-26 15:59:11','deleted'=>0),
            array('id'=>5,'proficiency_level'=>'Mastery','minimum_range'=>81,'maximum_range'=>100,'createdby'=>2,'modifiedby'=>2,'createddate'=>1640071513,'modifieddate'=>1640071513,'modify'=>'2021-11-26 15:59:11','deleted'=>0));
        foreach($arr as $list){
            $std=new stdClass();
            $std->proficiency_level=$list['proficiency_level'];
            $std->minimum_range=$list['minimum_range'];
            $std->maximum_range=$list['maximum_range'];
            $std->createdby=$list['createdby'];
            $std->modifiedby=$list['modifiedby'];
            $std->createddate=$list['createddate'];
            $std->modifieddate=$list['modifieddate'];
            $std->modify=$list['modify'];
            $std->deleted=$list['deleted'];

            $DB->insert_record_raw("proficiency_level",$std);
        }

    }
    $sql2="SELECT * FROM {proficiency_level} WHERE id=?";

    $data2=$DB->get_record_sql($sql2,array(1));
        if(!empty($data2)){
            $DB->delete_records('proficiency_level',array('id'=>$data2->id));
        }
     }
    
}
proficiency_data();