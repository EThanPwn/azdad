<?php
include("config.php"); //include our config file

$ip = $_GET['ip']; //get the users ip address

$getip = mysqli_query($connection,"SELECT * FROM `admins` WHERE `ip` = '$ip'"); #select the IP from the database
if(mysqli_num_rows($getip) == 0)
{
$getsteamid = mysqli_query($connection,"SELECT * FROM `admins` WHERE `steamid` = '$ip'"); #select the IP from the database
if(mysqli_num_rows($getsteamid) == 0)
{
http_response_code(403);
die();	
} else {
http_response_code(200);
die();
}
} else {
http_response_code(200);
die();
}
//if the user's ip address is in the database, then kill the script, and tell them that they are banned
?>