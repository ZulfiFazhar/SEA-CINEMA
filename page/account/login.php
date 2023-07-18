<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Login</title>
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
      crossorigin="anonymous"
    />
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
                        <a class="nav-link active" aria-current="page" href="../../index.php">Home</a>
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

    <div class="container">
      <h1>Form Login</h1>
      <form method="POST" action="process_login.php">
        <div class="form-group">
          <label for="username">Username</label>
          <input
            type="text"
            class="form-control"
            id="username"
            name="username"
            required
          />
        </div>
        <div class="form-group">
          <label for="password">Password</label>
          <input
            type="password"
            class="form-control"
            id="password"
            name="password"
            required
          />
        </div>
        <?php if (isset($_GET['error'])) : ?>
        <div class="alert alert-danger mt-2" role="alert">
          Username atau password salah!
        </div>
        <?php endif; ?>
        <p>Belum punya akun? 
          <a href="registrasi.php">Buat Akun</a>
        </p>
<?php
// Membuat koneksi ke database PHPMyAdmin
$conn = mysqli_connect("localhost", "root", "", "sea_cinema");

// Memeriksa koneksi
if (!$conn) {
    die("Koneksi gagal: " . mysqli_connect_error());
}

// Menampilkan tombol "Klik Disini"
echo '<p>Lupa Username atau Password? 
          <a class="btn" onclick="showTable()">Klik Disini</a>
        </p>';

// SQL query untuk mengambil data dari tabel users
$query = "SELECT * FROM users";
$result = mysqli_query($conn, $query);

// Memeriksa apakah query berhasil dieksekusi
if (mysqli_num_rows($result) > 0) {
    // Memulai tabel HTML (sembunyikan awalnya dengan CSS)
    echo '<table id="userTable" style="display: none;">';
    echo '<tr>';
    echo '<th>Username</th><th>Nama</th><th>Password</th><th>Age</th><th>Balance</th></tr>';
    echo '</tr>';

    // Menampilkan data users
    while ($row = mysqli_fetch_assoc($result)) {
        echo '<tr>';
        echo "<td>" . $row['username'] . "</td>";
        echo "<td>" . $row['name'] . "</td>";
        echo "<td>" . $row['password'] . "</td>";
        echo "<td>" . $row['age'] . "</td>";
        echo "<td>" . $row['balance'] . "</td>";
        echo '</tr>';
    }

    // Mengakhiri tabel HTML
    echo '</table>';
} else {
    echo 'Tidak ada data users.';
}

// Menutup koneksi
mysqli_close($conn);
?>
        <button type="submit" class="btn btn-primary">Login</button>
      </form>

    <!-- JS Bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz" crossorigin="anonymous"></script>
    <script>
function showTable() {
    var table = document.getElementById('userTable');
    table.style.display = 'block';
}
</script>
</body>
</html>
