<?php
include("config.php"); //include our config file

$ip = $_POST['ip']; //get the users ip address
//die(print_r($ip,true));
$getip_banid = mysqli_query($connection,"SELECT * FROM `banned` WHERE `ip` = '$ip'"); #select the IP from the database
if(mysqli_num_rows($getip_banid) > 0)
{
$getsteamid_banid = mysqli_query($connection,"SELECT * FROM `banned` WHERE `steamid` = '$ip'"); #select the IP from the database
if(mysqli_num_rows($getsteamid_banid) > 0)
{
http_response_code(403);
die();
}
} else {
//allowed to continue not banned!
}

$getip_whitelist = mysqli_query($connection,"SELECT * FROM `whitelist` WHERE `ip` = '$ip'"); #select the IP from the database
if(mysqli_num_rows($getip_whitelist) > 0)
{
http_response_code(200);
die();
} else {
$getsteamid_whitelist = mysqli_query($connection,"SELECT * FROM `whitelist` WHERE `steamid` = '$ip'"); #select the IP from the database
if(mysqli_num_rows($getsteamid_whitelist) > 0)
{
http_response_code(200);
die();
} else {
http_response_code(403);
die();
}
}
//if the user's ip address is in the database, then kill the script, and tell them that they are banned
?>