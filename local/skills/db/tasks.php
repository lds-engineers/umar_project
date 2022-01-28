<?php
/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
global $CFG;
$tasks = array(
    array(
        'classname' => 'local_skills\task\progressgoalnotifiation',
        'blocking' => 0,
        'minute' => '*',
        'hour' => '1',
        'day' => '*',
        'month' => '*',
        'dayofweek' => '*',
    ),
    array(
        'classname' => 'local_skills\task\goal_encouraging_notification',
        'blocking' => 0,
        'minute' => '*',
        'hour' => '1',
        'day' => '*',
        'month' => '*',
        'dayofweek' => '*',
    ),
     array(
        'classname' => 'local_skills\task\goal_not_set_notification',
        'blocking' => 0,
        'minute' => '*',
        'hour' => '1',
        'day' => '*',
        'month' => '*',
        'dayofweek' => '*'
    ),
    array(
        'classname' => 'local_skills\task\goal_summary_notification',
        'blocking' => 0,
        'minute' => '*',
        'hour' => '1',
        'day' => '*',
        'month' => '*',
        'dayofweek' => '*'
    ),
    array(
        'classname' => 'local_skills\task\goal_achieved_notification',
        'blocking' => 0,
        'minute' => '*',
        'hour' => '1',
        'day' => '*',
        'month' => '*',
        'dayofweek' => '*'
    )
);
//goal_encouraging_notification//goal_not_set_notification//goal_summary_notification//goal_achieved_notification