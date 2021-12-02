<?php  // Moodle configuration file

unset($CFG);
global $CFG;
$CFG = new stdClass();

$CFG->dbtype    = 'mysqli';
$CFG->dblibrary = 'native';
$CFG->dbhost    = 'localhost';
$CFG->dbname    = 'SDVK';
$CFG->dbuser    = 'phpmyadmin';
$CFG->dbpass    = 'P!ssw0rd';
$CFG->prefix    = 'mdl_';
$CFG->dboptions = array (
  'dbpersist' => 0,
  'dbport' => '',
  'dbsocket' => '',
  'dbcollation' => 'utf8mb4_0900_ai_ci',
);

$CFG->wwwroot   = 'http://175.111.182.35/SDVK';
$CFG->dataroot  = '/var/www/SDVK_moodle';
$CFG->admin     = 'admin';

// Divert all outgoing emails to this address to test and debug emailing features 
// $CFG->divertallemailsto = 'vbnmkaur98@rediffmail.com'; // NOT FOR PRODUCTION SERVERS!

// Force developer level debug and add debug info to the output of cron
$CFG->showcrondebugging = true; //And then use SSH (or putty.exe, on windows) to run: you@moodle-server(/var/www/html/moodle)# php admin/cli/cron.php

$CFG->directorypermissions = 0777;

require_once(__DIR__ . '/lib/setup.php');

// There is no php closing tag in this file,
// it is intentional because it prevents trailing whitespace problems!
