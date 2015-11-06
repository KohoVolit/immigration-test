<?php

session_start();

error_reporting(E_ALL ^ E_DEPRECATED);
//error_reporting(0);

$path2root = "";
require($path2root . "common.php");

//$smarty->assign('page','front_page');

$smarty->display('page.tpl');


?>
