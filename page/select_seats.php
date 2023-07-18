<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>SEA CINEMA</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous" />
</head>
<body>
    <?php
    // Koneksi ke database
    $conn = mysqli_connect("localhost", "root", "", "sea_cinema");

    // Memeriksa koneksi
    if (!$conn) {
        die("Koneksi gagal: " . mysqli_connect_error());
    }

    // Mendapatkan ID film dari parameter URL
    $movieId = $_GET['id'];
    $showtimeTime = $_POST['btnradio'];

    // Query untuk mendapatkan data showtimes berdasarkan movie_id
    $queryShowtimes = "SELECT showtimes.*, movies.title AS showtime_title, showtimes.time as showtime FROM showtimes
                    INNER JOIN movies ON showtimes.movie_id = movies.id
                    WHERE showtimes.movie_id = '$movieId' AND showtimes.time = '$showtimeTime'";
    $resultShowtimes = mysqli_query($conn, $queryShowtimes);
    $showtime = mysqli_fetch_assoc($resultShowtimes);

    // Menampilkan judul film dan waktu tayang
    if ($showtime) {
        echo '<center>';
        echo '<h2>Movie Title: ' . $showtime["showtime_title"] . '</h2>';
        echo '<h3>Showtime: ' . $showtime["showtime"] . '</h3>';

        // Mendapatkan data kursi dari kolom seats
        $seats = json_decode($showtime['seats'], true);

        // Menampilkan pemilihan kursi bioskop
        echo '<form method="post" action="booking_process.php?id=' . $movieId . '&time=' . $showtimeTime . '">';
        echo '<div class="seat-row">';

        $seatCount = 0; // Variabel untuk menghitung jumlah kursi yang telah ditampilkan

        foreach ($seats as $seat => $status) {
            $seatClass = $status ? 'seat disabled' : 'seat';
            echo '<input type="checkbox" class="btn-check" id="'.$seat.'" autocomplete="off" name="seats[]" value="' . $seat . '" ' . ($status ? 'disabled' : '') . '>';
            echo '<label class="'.$seatClass.' btn btn-outline-primary me-2 mb-2" for="'.$seat.'" style="width: 50px;">'.$seat.'</label>';

            $seatCount++;

            if ($seatCount % 4 === 0) {
                echo '<span class="ms-2 me-2">';
            }
            // Membuat barisan baru setiap 8 seats
            if ($seatCount % 8 === 0) {
                echo '<br>';
            }
        }
        echo '<br>';
        
        // Tombol submit
        echo '</div>';
        echo '<input type="submit" class="btn btn-primary" value="Book Now">';
        echo '</form>';
        echo '</center>';


    } else {
        echo 'Showtime not found.';
    }
    // Menutup koneksi
    mysqli_close($conn);
    ?>
    <!-- JS Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>