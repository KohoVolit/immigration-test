<?php

$str = date("Y-m-d H:i:s") . "\t" . json_encode($_POST) .  "\t" . $_SERVER['REMOTE_ADDR'] . "\n";
$file = fopen('../result.txt','a');
fwrite($file,$str);
fclose($file);
?>
