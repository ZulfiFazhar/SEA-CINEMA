<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>SEA CINEMA</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous" />
</head>
<body>
    <nav class="navbar navbar-expand-lg bg-body-tertiary">
        <div class="container-fluid">
            <a class="navbar-brand mx-5" href="#">SEA🌊CINEMA</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="../index.php">Home</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                            Category
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="#">Action</a></li>
                            <li><a class="dropdown-item" href="#">Another action</a></li>
                            <li><hr class="dropdown-divider" /></li>
                            <li>
                                <a class="dropdown-item" href="#">Something else here</a>
                            </li>
                        </ul>
                    </li>
                </ul>
                <!-- mengganti login ke profile -->
                <?php
                session_start();

                // Memeriksa status login pengguna
                if (isset($_SESSION['username'])) {
                    // Koneksi ke database
                    $conn = mysqli_connect("localhost", "root", "", "sea_cinema");

                    // Memeriksa koneksi
                    if (!$conn) {
                        die("Koneksi gagal: " . mysqli_connect_error());
                    }

                    // Mendapatkan data pengguna dari database
                    $username = $_SESSION['username'];
                    $query = "SELECT * FROM users WHERE username = '$username'";
                    $result = mysqli_query($conn, $query);

                    if (mysqli_num_rows($result) > 0) {
                        $row = mysqli_fetch_assoc($result);
                        $name = $row['name'];

                        // Mendapatkan data saldo dari tabel akun
                        $query_saldo = "SELECT balance FROM users WHERE username = '$username'";
                        $result_saldo = mysqli_query($conn, $query_saldo);

                        if (mysqli_num_rows($result_saldo) > 0) {
                            $row_saldo = mysqli_fetch_assoc($result_saldo);
                            $balance = $row_saldo['balance'];
                        }

                        echo '<div class="dropdown me-5">
                                <a class="btn btn-primary dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                    ' . $name .'
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="profileDropdown">
                                    <li><a class="dropdown-item" href="#">Username: ' . $username . '</a></li>
                                    <li><a class="dropdown-item" href="#">Name: ' . $name . '</a></li>
                                    <li><a class="dropdown-item" href="#">Saldo: ' . $balance . '</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="page/account/logout.php">Log Out</a></li>
                                </ul>
                            </div>';
                    }

                    // Menutup koneksi
                    mysqli_close($conn);
                } else {
                    // Jika belum login, tampilkan tautan "Login"
                    echo '<a class="btn btn-primary me-5" href="page/account/login.php">Login</a>';
                }
                ?>
                <!-- end -->
                <!-- <a class="btn d-flex btn-primary" href="page/account/login.php">Login</a> -->
                <!-- <form class="d-flex" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" />
                    <button class="btn btn-outline-success" type="submit">
                        Search
                    </button>
                </form> -->
            </div>
        </div>
    </nav>

<?php
// Koneksi ke database
$conn = mysqli_connect("localhost", "root", "", "sea_cinema");

// Memeriksa koneksi
if (!$conn) {
    die("Koneksi gagal: " . mysqli_connect_error());
}

// Mendapatkan ID film dari parameter URL
$movieId = $_GET['id'];

// Query untuk mendapatkan data film berdasarkan ID
$queryMovie = "SELECT * FROM movies WHERE id = '$movieId'";
$resultMovie = mysqli_query($conn, $queryMovie);
$movie = mysqli_fetch_assoc($resultMovie);

// Menampilkan detail film
if ($movie) {
    echo '<div class="container">';
    echo '<h2>' . $movie["title"] . '</h2>';
    echo '<img src="' . $movie["poster_url"] . '" alt="poster image" width="200">';
    echo '<p>' . $movie["description"] . '</p>';
    echo '<p>Ticket Price: ' . $movie["ticket_price"] . '</p>';

    // Query untuk mendapatkan data showtimes berdasarkan movie_id
    $queryShowtimes = "SELECT showtimes.*, movies.title AS showtime_title, showtimes.time as showtime FROM showtimes
                    INNER JOIN movies ON showtimes.movie_id = movies.id
                    WHERE showtimes.movie_id = '$movieId'";
    $resultShowtimes = mysqli_query($conn, $queryShowtimes);

    // Menampilkan judul film dan waktu tayang
    if (mysqli_num_rows($resultShowtimes) > 0) {
        echo '<h2>Showtimes:</h2>';
        
        // $showtime = mysqli_fetch_assoc($resultShowtimes);
        
        echo '<form method="post" action="select_seats.php?id=' . $movieId . '">';
        while ($showtime = mysqli_fetch_assoc($resultShowtimes)) {
            $showtimeId = $showtime['id'];
            $showtimeTime = $showtime['time'];

            echo '<div class="btn-group" role="group" aria-label="Basic radio toggle button group">';
            echo '<input class="btn-check" type="radio" name="btnradio" id="showtime_' . $showtimeId . '" value="' . $showtimeTime . '">';
            echo '<label class="btn btn-outline-primary me-2 mb-2" for="showtime_' . $showtimeId . '">' . $showtimeTime . '</label>';
            echo '</div>';
        }

        // Tombol "Beli Tiket"
        echo '<br><input type="submit" class="btn btn-primary" value="Beli Tiket">';
        echo '</form>';


    } else {
        echo 'No showtimes available for this movie.';
    }
} else {
    echo 'Movie not found.';
}

// Menutup koneksi
mysqli_close($conn);
?>




    <!-- JS Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
</body>
</html>
