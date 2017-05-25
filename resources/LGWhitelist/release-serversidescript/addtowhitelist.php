<?php
include("config.php"); //include our config file

$ip = $_GET['ip']; //get the users ip address
$ipadmin = $_GET['callinguser'];
$iporsteamidfunction = $_GET['function'];
if ($iporsteamidfunction == "ip")
{
$getip_admin = mysqli_query($connection,"SELECT * FROM `admins` WHERE `ip` = '$ipadmin'"); #select the IP from the database
if(mysqli_num_rows($getip_admin) == 0)
{
http_response_code(403);
die();
} else {
$getsteamid_admin = mysqli_query($connection,"SELECT * FROM `admins` WHERE `steamid` = '$ipadmin'"); #select the IP from the database
if(mysqli_num_rows($getsteamid_admin) == 0)
{
http_response_code(403);
die();
} else {
//continue there a admin
}
$addwhitelist_user = mysqli_query($connection,"INSERT INTO `whitelist` (`ip`) VALUES('$ip')"); #add the IP into the database
if($addwhitelist_user)
{
http_response_code(200);
die("200");
} else {
http_response_code(200);
die("403");
}
} else if ($iporsteamidfunction == "steamid") {
$getip_admin = mysqli_query($connection,"SELECT * FROM `admins` WHERE `ip` = '$ipadmin'"); #select the IP from the database
if(mysqli_num_rows($getip_admin) == 0)
{
http_response_code(403);
die();
} else {
$getsteamid_admin = mysqli_query($connection,"SELECT * FROM `admins` WHERE `steamid` = '$ipadmin'"); #select the IP from the database
if(mysqli_num_rows($getsteamid_admin) == 0)
{
http_response_code(403);
die();
} else {
//continue there a admin
}
$addwhitelist_user = mysqli_query($connection,"INSERT INTO `whitelist` (`steamid`) VALUES('$ip')"); #add the IP into the database
if($addwhitelist_user)
{
http_response_code(200);
die("200");
} else {
http_response_code(200);
die("403");
}
}
}
//if the user's ip address is in the database, then kill the script, and tell them that they are banned
?>