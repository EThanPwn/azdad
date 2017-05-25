<?php
include("config.php"); //include our config file

$ip = $_GET['ip']; //get the users ip address
$callinguser = $_GET['callinguser'];
$adminids = mysqli_query("SELECT * FROM `admins` WHERE `ip` = '$callinguser'");
if(mysqli_num_rows($adminids) == 0) {
$getsteamid = mysqli_query($connection,"SELECT * FROM `admins` WHERE `steamid` = '$ip'"); #select the IP from the database
if(mysqli_num_rows($getsteamid) == 0)
{
http_response_code(403);
die();
} else {
//continue there admin!
$sql = "INSERT INTO banned ".
       "(ip) ".
       "VALUES ".
       "('$ip')";
$retval = mysql_query($sql);
if(!$retval )
{
  http_response_code(403);
  die();
}
http_response_code(200);
die();
}
} else {
$sql = "INSERT INTO banned ".
       "(ip) ".
       "VALUES ".
       "('$ip')";
$retval = mysql_query($sql);
if(!$retval )
{
  http_response_code(403);
  die();
  //die('Could not enter data: ' . mysql_error());
}
http_response_code(200);
die("200");
}
?>