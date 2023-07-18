<?php
session_start();

// Koneksi ke database
$conn = mysqli_connect("localhost", "root", "", "sea_cinema");

// Memeriksa koneksi
if (!$conn) {
  die("Koneksi gagal: " . mysqli_connect_error());
}

// Mendapatkan data dari form
$username = $_POST['username'];
$password = $_POST['password'];

// Query untuk memeriksa username dan password di tabel user
$query = "SELECT * FROM users WHERE username = '$username' AND password = '$password'";
$result = mysqli_query($conn, $query);

if (mysqli_num_rows($result) > 0) {
  // Login berhasil, simpan informasi pengguna ke dalam sesi
  $_SESSION['username'] = $username;

  // Mendapatkan data saldo dari tabel akun
  $query_saldo = "SELECT balance FROM users WHERE username = '$username'";
  $result_saldo = mysqli_query($conn, $query_saldo);

  if (mysqli_num_rows($result_saldo) > 0) {
    $row_saldo = mysqli_fetch_assoc($result_saldo);
    $balance = $row_saldo['balance'];
  }

  // Redirect ke halaman selanjutnya
  header("Location: ../../index.php");
  exit();
} else {
  // Login gagal, redirect kembali ke halaman login dengan parameter error
  header("Location: login.php?error=1");
  exit();
}

// Menutup koneksi
mysqli_close($conn);
?>
