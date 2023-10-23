<?php

$claveU = 'Lucas2003';

$claveMD5 = md5($claveU);
$claveSHA = sha1($claveU);
$claveHash = password_hash($claveU,PASSWORD_BCRYPT);

//$claveA = "lucas";

var_dump($claveHash);

// ASEGURATE DE SIEMPRE PASARA POR ESTE FILTRO LAS CLAVES PARA PODER  HACER LOGIN