<?php
// Koneksi ke database
$conn = mysqli_connect("localhost", "root", "", "sea_cinema");

// Memeriksa koneksi
if (!$conn) {
    die("Koneksi gagal: " . mysqli_connect_error());
}

// Mendapatkan data dari form
$username = $_POST['username'];
$name = $_POST['name'];
$password = $_POST['password'];
$age = $_POST['age'];

// Query untuk menyimpan data ke tabel user
$query = "INSERT INTO users (username, name, password, age, balance) VALUES ('$username', '$name', '$password', $age, 500000)";
$result = mysqli_query($conn, $query);

if ($result) {
    header("Location: ../../index.php");
    exit();
} else {
    echo "Registrasi gagal!";
}

mysqli_close($conn);
?>
