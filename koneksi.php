<?php

$host = "lsql305.infinityfree.com";
$username = "if0_43224865";
$password = "45bodcu8C0Qk2R";
$database = "if0_43224865_XXX";

$koneksi = mysqli_connect(
    $host,
    $username,
    $password,
    $database
);

if (!$koneksi) {
    die("Koneksi database gagal: " . mysqli_connect_error());
}

mysqli_set_charset($koneksi, "utf8mb4");
?>
