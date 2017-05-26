<?php

define("DB_HOST", "localhost"); #db host
define("DB_USER", "yourusername"); #db username
define("DB_PASS", "yourpass"); #db password
define("DB_NAME", "yourdbname"); #database name

$connection = mysqli_connect(DB_HOST, DB_USER, DB_PASS);
mysqli_select_db($connection,DB_NAME); #our mysql connection

?>