<?php

include("../" . $path2root . "settings.php");

//set up Smarty
require(SMARTY_PATH);
$smarty = new Smarty();
$smarty->setTemplateDir(APP_PATH . 'smarty/templates');
$smarty->setCompileDir(APP_PATH . 'smarty/templates_c');

//get language
$lang = lang($path2root);
$smarty->assign('lang',$lang);

//include texts
$handle = fopen($path2root . 'texts_' . $lang . '.csv', "r");
$texts = csv2array($handle);
$smarty->assign('t',$texts);

//include questions
$handle = fopen($path2root . 'questions_' . $lang . '.csv', "r");
$questions = csv2array($handle,true);
foreach ($questions as $key=>$question) {
    $questions[$key]['sources_links_ar'] = str_getcsv($question['sources_links']);
    $questions[$key]['sources_names_ar'] = str_getcsv($question['sources_names']);
}
$smarty->assign('questions',$questions);
$smarty->assign('questions_json',json_encode($questions));
$smarty->assign('questions_count',count($questions));
#print_r($questions);die();

$smarty->assign('app_url',APP_URL);
$smarty->assign('cdn_url',CDN_URL);
$smarty->assign('session_id',session_id());

if (isset($_SERVER['HTTP_REFERER']))
    $smarty->assign('http_referer',$_SERVER['HTTP_REFERER']);
else
    $smarty->assign('http_referer',"");

if (isset($_SERVER['HTTP_USER_AGENT']))
    $smarty->assign('http_user_agent',$_SERVER['HTTP_USER_AGENT']);
else
    $smarty->assign('user_agent',"");

/**
* set language
*/
function lang($path2root) {
    if (isset($_GET['lang']) and (is_readable($path2root . 'texts_' . $_GET['lang'] . '.csv')))
        {
            $_SESSION["lang"] = $_GET['lang'];
            return $_GET['lang'];
        }
    else 
        {
        if (isset($_SESSION['lang']))
            return $_SESSION['lang'];
        else //default language
            return 'cs';
        }
}


/**
* reads csv file into associative array
* 
*/
function csv2array($handle, $full = false) {
    $array = $fields = [];
    if ($handle) {
        while (($row = fgetcsv($handle, 4096)) !== false) {
            if (empty($fields)) {
                $fields = $row;
                continue;
            }
            if ($full) {
                $i = 0;
                foreach ($row as $key=>$value) {
                    $array[$row[0]][$fields[$i]] = $value;
                    $i++;
                }
                
            }
            else
                $array[$row[0]] = (isset($row[1]) ? $row[1] : "");
        }
        if (!feof($handle)) {
            /*echo "Error: unexpected fgets() fail\n";*/
        }
    } 
    return $array;  
}
?>
