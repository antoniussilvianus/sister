<?php

if (!defined('AURACMS_admin')) {
	Header("Location: ../../../index.php");
	exit;
}

if (!cek_login ()){
   $admin .='<p class="judul">Access Denied !!!!!!</p>';
   exit;
}


$admin  .='<legend>HUTANG / PIUTANG</legend>';

if($_GET['aksi']==""){
$admin .= '<div align="center">
<table width="50%" class="border3">
<table width="50%" class="border3">
<tr align="center">
<td></td>
<td></td>
<td>
<a href="admin.php?pilih=pembayaran&mod=yes">
<img src="images/bayar.jpg" width="150px"><br>
</a></td>
<td><img src="images/arrowright.png" width="150px"></td>
<td>
<a href="admin.php?pilih=pembayaran&mod=yes&aksi=cetak">
<img src="images/lapbayar.jpg" width="150px"><br>
</a></td>
</tr>
<tr align="center">
<td></td>
<td></td>
<td>
<a href="admin.php?pilih=pembayaran&mod=yes"><br>PEMBAYARAN
</a></td>
<td></td>
<td>
<a href="admin.php?pilih=pembayaran&mod=yes&aksi=cetak"><br>LAPORAN PEMBAYARAN
</a></td>
</tr>

</table>
</div><br><br>
';
}
echo $admin;

?>