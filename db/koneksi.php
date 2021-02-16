<?php

// Koneksi
$host = "localhost";
$user = "root";
$pass = "";
$dbnm = "logistik";
// $host = "localhost";
// $user = "k5382565_Davis";
// $pass = "Diana500009";
// $dbnm = "k5382565_logistik";

$mysqli = new mysqli($host, $user, $pass, $dbnm);
if ($mysqli->connect_errno) {

  echo "Gagal Konek !". $mysqli->connect_errno;

} else {

  // echo "Berhasil Konek !";

}

 ?>
