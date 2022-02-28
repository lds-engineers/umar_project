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
 * A two column layout for the boost theme.
 *
 * @package   theme_boost
 * @copyright 2016 Damyon Wiese
 * @license   http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */

defined('MOODLE_INTERNAL') || die();

user_preference_allow_ajax_update('drawer-open-nav', PARAM_ALPHA);
require_once($CFG->libdir . '/behat/lib.php');
global $DB,$USER,$CFG;

if (isloggedin()) {
    $navdraweropen = (get_user_preferences('drawer-open-nav', 'true') == 'true');
} else {
    $navdraweropen = false;
}
$extraclasses = [];
if ($navdraweropen) {
    $extraclasses[] = 'drawer-open-left';
}
$bodyattributes = $OUTPUT->body_attributes($extraclasses);
$blockshtml = $OUTPUT->blocks('side-pre');
$hasblocks = strpos($blockshtml, 'data-block=') !== false;
$buildregionmainsettings = !$PAGE->include_region_main_settings_in_header_actions();
// If the settings menu will be included in the header then don't add it here.
$has_skill=false;
$skill_id="";
$btn=$CFG->wwwroot;
if($GLOBALS["PAGE"]->context->contextlevel==CONTEXT_COURSE || $GLOBALS["PAGE"]->context->contextlevel==CONTEXT_MODULE){
    $has_skill=true;
    $sql="SELECT * FROM {assign_skill} WHERE user_id=?";
    $skill_data=$DB->get_records_sql($sql,array($USER->id));
    foreach($skill_data as $skill_list){
        $sql2="SELECT * FROM {sub_skill} WHERE skill_id=?";
        $sub_skill_data=$DB->get_records_sql($sql2,array($skill_list->skill_id));
        foreach($sub_skill_data as $sub_skill_list){
            $user_sub_skill_pro_sql="SELECT * FROM {user_proficiency_level} WHERE userid=? AND type=? AND skill_id=?";
            $user_sub_skill_pro_data=$DB->get_record_sql($user_sub_skill_pro_sql,array($USER->id,'subskill',$sub_skill_list->id));
            $sql3="SELECT * FROM {assign_course_sub_skill} WHERE course_id=? AND sub_skill_id=? AND proficiency_id>?";
            $data3=$DB->get_record_sql($sql3,array($GLOBALS["COURSE"]->id,$sub_skill_list->id,$user_sub_skill_pro_data->proficiency_id));
            if(!empty($data3)){
                $skill_id=$skill_list->skill_id;
                break 2;
            }
        }
       
    }
   
}
if(!empty($skill_id)){
    $btn=$CFG->wwwroot.'/blocks/skill_list/skilling_path.php?skill_id='.$skill_id;
}

$regionmainsettingsmenu = $buildregionmainsettings ? $OUTPUT->region_main_settings_menu() : false;
$templatecontext = [
    'sitename' => format_string($SITE->shortname, true, ['context' => context_course::instance(SITEID), "escape" => false]),
    'output' => $OUTPUT,
    'sidepreblocks' => $blockshtml,
    'hasblocks' => $hasblocks,
    'bodyattributes' => $bodyattributes,
    'navdraweropen' => $navdraweropen,
    'regionmainsettingsmenu' => $regionmainsettingsmenu,
    'hasregionmainsettingsmenu' => !empty($regionmainsettingsmenu),
    'has_skill'=>$has_skill,
    'skill_url'=>$btn,
     'copyright'=>copyright(),
    'logo_url'=>logo_url()
];

$nav = $PAGE->flatnav;
$templatecontext['flatnavigation'] = $nav;
$templatecontext['firstcollectionlabel'] = $nav->get_collectionlabel();
echo $OUTPUT->render_from_template('theme_skills/columns2', $templatecontext);

