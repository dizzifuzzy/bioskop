<?php 
require_once "../config.php";
session_start();
if (isset($_SESSION['username'])) {
  $username   = $_SESSION['username'];
  $id_admin = $_SESSION['admin'];
}
if (!isset($_SESSION['admin'])) {
        echo '
            <script>
                window.alert("Anda Tidak Berhak Mengakses Halaman Ini Karena Anda Belum Login Sebagai Admin");
                window.location = "login.php";
            </script>
        ';
    }
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="<?=deskripsi;?>">
  <meta name="author" content="<?=admin;?>">
  <title><?=nama;?></title>
  <!-- Bootstrap core CSS-->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!-- Custom fonts for this template-->
  <link href="vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">
</head>

<body class="fixed-nav sticky-footer bg-dark" id="page-top">
<?php include 'header.phtml'; ?>
  <div class="content-wrapper">
    <div class="container-fluid">
      <!-- Breadcrumbs-->
      <ol class="breadcrumb">
        <li class="breadcrumb-item">
          <a href="index.php"><?=nama;?></a>
        </li>
        <li class="breadcrumb-item active">Menu Saldo</li>
      </ol>
      <!-- Icon Cards-->
       <div class="row">
        <div class="col-lg-12">
          <!-- Example Bar Chart Card-->
          <div class="card mb-3">
            <div class="card-header">
              <i class="fa fa-bar-chart"></i> Menu Saldo</div>
        <div class="card-body">
          <div class="table-responsive">
            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
              <thead>
                <tr>
                  <th>Tanggal</th>
                  <th>Nama Customer</th>
                  <th>Nominal Saldo</th>
                  <th>Kode Top Up</th>
                  <th>Status</th>
                </tr>
              </thead>
              <tfoot>
                <tr>
                  <th>Tanggal</th>
                  <th>Nama Customer</th>
                  <th>Nominal Saldo</th>
                  <th>Kode Top Up</th>
                  <th>Status</th>
                </tr>
              </tfoot>
              <tbody>
              <?php $qyu = $conn->query("SELECT * FROM topup INNER JOIN customer WHERE topup.id_customer = customer.id_customer");
                while($datanya = $qyu->fetch_array()){ ?>
                <tr>
                  <td><?php echo $datanya['tanggal']; ?></td>
                  <td><?php echo $datanya['fname_customer']." ".$datanya['lname_customer']; ?></td>
                  <td><?php echo $datanya['uang']; ?></td>
                  <td><?php echo $datanya['kode_topup']; ?></td>
                  <td><?php echo $datanya['status']; ?></td>
                </tr>
              <?php } ?>
              </tbody>
            </table>
          </div>
        </div>
        <div class="card-footer small text-muted"><?=nama;?> 2018</div>
        </div>
         <div class="card mb-3">
            <div class="card-header">
              <i class="fa fa-bar-chart"></i> Verifikasi Top Up</div>
        <div class="card-body">
          <form action="" method="post">
            <?php if($_POST['kode']){
              $kode = $_POST['kode'];
                $tops = $conn->query("SELECT * FROM topup WHERE kode_topup = '$kode'");
                $m = $tops->fetch_assoc();
                if($m['status']=="Waiting"){
                  $idc = $m['id_customer'];
                  $uang = $m['uang'];
                  $updatesaldo = $conn->query("UPDATE customer SET saldo_customer=saldo_customer+$uang WHERE id_customer='$idc'");
                  $updatestatus = $conn->query("UPDATE topup SET status='Approved' WHERE kode_topup='$kode'");
                  echo '<div class="alert alert-success">Status Telah di Ubah Menjadi Approved!</div>';                  
                }else{
                  echo '<div class="alert alert-danger">Kode Telah di gunakan/tidak ada dalam database!</div>';
                }
            }
            ?>
          <div class="form-group">
            <label for="nama" class="col-sm-12 control-label">Kode Top Up :</label>
            <div class="col-sm-12">
              <input class="form-control" type="text" name="kode" required>
            </div>
          </div>
          <button type="submit" class="btn btn-success col-sm-12">Submit</button>
        </form>
          Fitur ini berfungsi untuk menyetujui transaksi top up yang di lakukan oleh customer.
        </div>
        <div class="card-footer small text-muted"><?=nama;?> 2018</div>
        </div>
        </div>
      </div>
    <!-- Logout Modal-->
    <!-- /.content-wrapper-->
    <footer class="sticky-footer">
      <div class="container">
        <div class="text-center">
          <small>Copyright © <?=nama;?> 2018</small>
        </div>
      </div>
    </footer>
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
      <i class="fa fa-angle-up"></i>
    </a>
    <!-- Logout Modal-->
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
    <!-- Page level plugin JavaScript-->
    <script src="vendor/chart.js/Chart.min.js"></script>
    <script src="vendor/datatables/jquery.dataTables.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin.min.js"></script>
    <!-- Custom scripts for this page-->
    <script src="js/sb-admin-datatables.min.js"></script>
    <script src="js/sb-admin-charts.min.js"></script>
  </div>
</body>

</html>
