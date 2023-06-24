<?php

$claveU = 'MARQUITOS';

$claveMD5 = md5($claveU);
$claveSHA = sha1($claveU);
$claveHash = password_hash($claveU,PASSWORD_BCRYPT);

$claveA = "MARQUITOS";

var_dump($claveHash);