<?php
// Koneksi ke database
$conn = mysqli_connect("localhost", "root", "", "sea_cinema");

// Memeriksa koneksi
if (!$conn) {
    die("Koneksi gagal: " . mysqli_connect_error());
}

// Memeriksa apakah pengguna sudah login
session_start(); // Pastikan session_start() sudah dipanggil sebelumnya
if (!isset($_SESSION['username'])) {
    echo '<script>alert("Anda harus login terlebih dahulu untuk melakukan pemesanan tiket.");</script>';
    exit; // Menghentikan eksekusi script lebih lanjut jika pengguna belum login
}

// Memeriksa apakah ada kursi yang dipilih
if (isset($_POST['seats'])) {
    // Mendapatkan ID film dari parameter URL
    $movieId = $_GET['id'];
    $showtimeTime = $_GET['time'];

    // Mendapatkan kursi yang dipilih
    $selectedSeats = $_POST['seats'];

    // Query untuk mendapatkan data film berdasarkan ID
    $queryMovie = "SELECT * FROM showtimes WHERE movie_id = '$movieId' and time = '$showtimeTime'";
    $resultMovie = mysqli_query($conn, $queryMovie);
    $movie = mysqli_fetch_assoc($resultMovie);

    // Proses pemesanan kursi
    if ($movie) {
        // Mendapatkan username pengguna yang sedang login
        $username = $_SESSION['username'];

        // Query untuk mendapatkan data pengguna berdasarkan username
        $queryUser = "SELECT * FROM users WHERE username = '$username'";
        $resultUser = mysqli_query($conn, $queryUser);
        $user = mysqli_fetch_assoc($resultUser);

        // Memeriksa apakah pengguna ditemukan
        if ($user) {
            // Menyimpan data pemesanan ke tabel 'bookings' dengan tambahan kolom 'username'
            $bookingData = array(
                'movie_id' => $movieId,
                'seats' => implode(',', $selectedSeats),
                'username' => $user['username']
            );

            // Query untuk menyimpan data pemesanan ke tabel 'bookings'
            $queryInsertBooking = "INSERT INTO bookings (movie_id, seats, username) VALUES ('$movieId', '".implode(',', $selectedSeats)."', '".$bookingData['username']."')";
            $resultInsertBooking = mysqli_query($conn, $queryInsertBooking);

            if ($resultInsertBooking) {
                // Mengupdate status kursi yang dipilih menjadi 'booked' di tabel showtimes
                $queryUpdateSeats = "UPDATE showtimes SET seats = JSON_SET(seats, ";
                foreach ($selectedSeats as $seat) {
                    $queryUpdateSeats .= "'$.{$seat}', true, ";
                }
                $queryUpdateSeats = rtrim($queryUpdateSeats, ", ");
                $queryUpdateSeats .= ") WHERE movie_id = '$movieId' AND time = '$showtimeTime'";

                $resultUpdateSeats = mysqli_query($conn, $queryUpdateSeats);

                if ($resultUpdateSeats) {
                    echo 'Booking successful. Your seats: ' . implode(', ', $selectedSeats);
                } else {
                    echo 'Failed to update seat status. Please try again.';
                }
            } else {
                echo 'Booking failed. Please try again.';
            }
        } else {
            echo 'User not found.';
        }
    } else {
        echo 'Movie not found.';
    }
} else {
    echo 'No seats selected.';
}

// Menutup koneksi
mysqli_close($conn);
?>
