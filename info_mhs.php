<?php
	include_once("dosen.php");
	session_start();
	$obj = new dosen;
	
	if(!$obj->isLogIn())
	{
		header("location:index.php");
	}
	$id_mhs = $_GET['id'];
?>
<!DOCTYPE html>
<html>
<head>
    <title>Info Mahasiswa</title>   
	<link href="assets/css/bootstrap.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet">
    <link href="assets/css/style-responsive.css" rel="stylesheet">

    <script type="text/javascript" src="assets/js/jquery-1.11.1.js"></script>
    <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
    </head>
<body>
	<div class="container-fluid">
		<header>
			<div class="navbar navbar-default navbar-fixed-top" role="navigation">
				<div class="navbar-header">
					<div class="container">
						<a class="navbar-brand" href="home_dsn.php">Bimbingan Skripsi Online <em>DINUS</em></a>
						<div class="nav notify-row" id="top_menu">
			                <ul class="nav top-menu">
			                    <li id="header_inbox_bar" class="dropdown">
			                        <a data-toggle="dropdown" class="dropdown-toggle" href="home_dsn.php#">
			                            <i class="fa fa-cogs"></i>
			                        </a>
			                        <ul class="dropdown-menu extended tasks-bar">
			                            <div class="notify-arrow notify-arrow-green"></div>
			                            <li>
			                            	<p class="green">Akun User</p>
			                            </li>
			                            <li>
			                                <div class="task-info">
			                                	<a href="profil_dsn.php">
			                                		<span>Profil</span>
			                                	</a>
			                                </div>
			                            </li>
			                            <li>
			                                <div class="task-info"><a href="#">Pengaturan</a></div>
			                            </li>
			                        </ul>
			                    </li>
			                </ul>
			            </div>
			           	<div class="top-menu">
            				<ul class="nav pull-right top-menu">
                    		<li><a class="logout" href="logout.php">Keluar</a></li>
            				</ul>
            			</div>
					</div>
				</div>	
			</div>
		</header>
		<div class="container-fluid" style="padding-top : 50px">
			<div class="row">
				<div class="col-lg-2">
					<ul class="nav nav-tabs nav-stacked" data-spy="affix">
						<li><a href="home_dsn.php">Laman Bimbingan</a></li>
						<li><a href="daftar_mhs.php">Daftar Mahasiswa</a></li>
						<li><a href="berkas_dsn.php">Berkas</a></li>
						<li><a href="#">Progress Mahasiswa</a></li>
					</ul>
				</div>
				<div class="col-lg-8">
	           		<div class="container-fluid">
	           			<div class="panel panel-info">
	           				<div class="panel-heading">
	           				Informasi Mahasiswa
	           				</div>
	           				<div class="panel-body">
	           				<?php
	           					if($obj->infoMhs($id_mhs))
	           					{
	           						extract($obj->infoMhs($id_mhs));
	           						echo '<table class="table table-condensed" border="0">
									<tbody>
										<tr>
											<td><strong>Nama</strong></td>
											<td width="8">:</td>
											<td>'.$nama.'</td>
											<td rowspan="4"><div class="pull right"><img src="'.$dir_foto.'" width="100" height="130"></div></td>
										</tr>
										<tr>
											<td><strong>NIM</strong></td>
											<td width="8">:</td>
											<td>'.$nim.'</td>
										</tr>
										<tr>
											<td><strong>Program Studi</strong></td>
											<td width="8">:</td>
											<td>'.$prodi.'</td>
										</tr>
										<tr>
											<td><strong>Jenis Kelamin</strong></td>
											<td width="8">:</td>
											<td>'.$jen_kel.'</td>
										</tr>
										<tr>
											<td><strong>Tempat Lahir</strong></td>
											<td width="8">:</td>
											<td>'.$tempat_lahir.'</td>
										</tr>
										<tr>
											<td><strong>Tanggal Lahir</strong></td>
											<td width="8">:</td>
											<td>'.$tgl_lahir.'</td>
										</tr>
										<tr>
											<td><strong>Alamat</strong></td>
											<td width="8">:</td>
											<td>'.$alamat.'</td>
										</tr>
										<tr>
											<td><strong>Telepon</strong></td>
											<td width="8">:</td>
											<td>'.$telp.'</td>
										</tr>																				
										<tr>
											<td><strong>Email</strong></td>
											<td width="8">:</td>
											<td>'.$email.'</td>
										</tr>
										<tr>
											<td><strong>Judul Skripsi</strong></td>
											<td width="8">:</td>
											<td>'.$jdl_skripsi.'</td>
										</tr>
									</tbody>	
						</table>';
	           					}
	           				?>
	           				</div>
	           			</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
</body>
</html>