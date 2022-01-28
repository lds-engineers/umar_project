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
 * Course list block settings
 *
 * @package    block_skill_list
 * @copyright  2007 Petr Skoda
 * @license    http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */

defined('MOODLE_INTERNAL') || die;

if($ADMIN->fulltree){
    $options=array(
        '0'=>'Sunday',
        '1'=>'Monday',
        '2'=>'Tuesday',
        '3'=>'Wednesday',
        '4'=>'Thursday',
        '5'=>'Friday',
        '6'=>'Saturday'
    );
   //$options = array('all'=>get_string('all', 'block_skill_list'),'1'=>get_string('sun','block_skill_list'));

    $settings->add(new admin_setting_configselect('block_skill_list_goal_not_set_notification', get_string('goal_not_set_notification', 'block_skill_list'),
                       get_string('configgoal_not_set_notification', 'block_skill_list'), '1', $options));

    $settings->add(new admin_setting_configcheckbox('block_skill_list_email_notification_for_goal_not_set', get_string('email_notification_for_goal_not_set', 'block_skill_list'),
                      get_string('configemail_notification_for_goal_not_set', 'block_skill_list'), 0));
    $settings->add(new admin_setting_configcheckbox('block_skill_list_app_notification_for_goal_not_set', get_string('app_notification_for_goal_not_set', 'block_skill_list'),
                      get_string('configapp_notification_for_goal_not_set', 'block_skill_list'), 0));

     /*$settings->add(new admin_setting_configselect('block_skill_list_goal_progress_notification', get_string('goal_progress_notification', 'block_skill_list'),
                       get_string('configgoal_progress_notification', 'block_skill_list'), '2', $options));*/

      $settings->add(new admin_setting_configcheckbox('block_skill_list_email_goal_progress_notification', get_string('email_goal_progress_notification', 'block_skill_list'),
                      get_string('configemail_goal_progress_notification', 'block_skill_list'), 0));
    $settings->add(new admin_setting_configcheckbox('block_skill_list_app_goal_progress_notification', get_string('app_goal_progress_notification', 'block_skill_list'),
                      get_string('configapp_goal_progress_notification', 'block_skill_list'), 0));


    $settings->add(new admin_setting_configselect('block_skill_list_goal_summary_notification', get_string('goal_summary_notification', 'block_skill_list'),
                       get_string('configgoal_not_set_notification', 'block_skill_list'), '7', $options));

    $settings->add(new admin_setting_configcheckbox('block_skill_list_email_goal_summary_notification', get_string('email_goal_summary_notification', 'block_skill_list'),
                      get_string('configemail_goal_summary_notification', 'block_skill_list'), 0));
    $settings->add(new admin_setting_configcheckbox('block_skill_list_app_goal_summary_notification', get_string('app_goal_summary_notification', 'block_skill_list'),
                      get_string('configapp_goal_summary_notification', 'block_skill_list'), 0));


    $settings->add(new admin_setting_configselect('block_skill_list_goal_encouraging_notification', get_string('goal_encouraging_notification', 'block_skill_list'),
                       get_string('configgoal_encouraging_notification', 'block_skill_list'), '2', $options));

    $settings->add(new admin_setting_configcheckbox('block_skill_list_email_goal_encouraging_notification', get_string('email_goal_encouraging_notification', 'block_skill_list'),
                      get_string('configemail_goal_encouraging_notification', 'block_skill_list'), 0));

    $settings->add(new admin_setting_configcheckbox('block_skill_list_app_goal_encouraging_notification', get_string('app_goal_encouraging_notification', 'block_skill_list'),
                      get_string('configapp_goal_encouraging_notification', 'block_skill_list'), 0));


}
