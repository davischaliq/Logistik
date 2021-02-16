<!-- validasi akun -->
<?php
// untuk koneksi
session_start();
include_once ('../db/koneksi.php');

if (isset($_POST['masuk'])) {
  $namauser = $_POST['username'];
  $passuser = $_POST['pass'];
  // var_dump($namauser);
  // die;
  $sql   = "SELECT * FROM masuk WHERE username = '$namauser' AND password = '$passuser'";
  $query = mysqli_query($mysqli, $sql);
  $data = mysqli_fetch_assoc($query);
  // $data  = $query->fetch_array(MYSQLI_ASSOC);

  // $_SESSION['password'] = $passuser;

  if ($data['username'] == $namauser && $data['password'] == $passuser) {
    $_SESSION['inpuser']  = $namauser;
    if ($_SESSION['inpuser'] === "kepala") {
      // var_dump($_SESSION['inpuser']);
      // die;
    header("location: ../headoff/admin.php");
  }else {
    header("location: ../admin/admin.php");
  }

  } else {

    echo '
    <div class="alert alert-danger alert-dismissible fade show" role="alert">
      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
        <span aria-hidden="true">&times;</span>
      </button>
    Silahkan <strong>Periksa</strong> Username atau Password <br> Anda Kembali !
    </div>
    ';

  }

}

 ?>

<!DOCTYPE html>
<html lang="en">
  <head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Sistem Informasi Gudang PT.Dian Permata Omega</title>

    <!-- Bootstrap -->
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom fonts for this template -->
    <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

  </head>

  <body>

    <br>

    <!-- untuk login -->
    <div class="container-fluid">

      <div class="row">
        <div class="col-lg-4 offset-lg-4">
          <div class="card bg-light mb-3">
            <div class="card-header text-center">
              Silahkan Masuk
            </div>

            <div class="card-body">
              <form method="post">
                <div class="form-group">
                  <label>Username</label>
                  <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                    <div class="input-group-addon"><i class="fa fa-user"></i> </div>
                    <input class="form-control" type="text" name="username" placeholder="Username" required>
                  </div>
                </div>

                <div class="form-group">
                  <label>Password</label>
                  <div class="input-group mb-2 mr-sm-2 mb-sm-0">
                    <div class="input-group-addon"><i class="fa fa-key"></i> </div>
                    <input class="form-control" type="password" name="pass" placeholder="Password" required>
                  </div>
                </div>

                <div class="form-group">
                  <a class="btn btn-danger" href="index.php">Batal</a>
                  <input class="btn btn-success" type="submit" name="masuk" value="Masuk">
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>

    </div>

    <!-- Bootstrap core JavaScript -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  </body>
</html>
