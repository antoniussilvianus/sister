<?php
if (!defined('AURACMS_admin')) {
	Header("Location: ../index.php");
	exit;
}
include "includes/excel_reader2.php";
//$index_hal = 1;
if (!cek_login ()){   
	
$admin .='<p class="judul">Access Denied !!!!!!</p>';
}else{
$JS_SCRIPT.= <<<js
<script type="text/javascript">
  $(function() {
$( "#tgl" ).datepicker({ dateFormat: "yy-mm-dd" } );
  });
  </script>
js;
$JS_SCRIPT.= <<<js
<script language="JavaScript" type="text/javascript">
$(document).ready(function() {
    $('#example').dataTable();
} );

</script>
js;
$script_include[] = $JS_SCRIPT;
$admin  .='<legend>PRODUK</legend>';
$admin  .= '<div class="border2">
<table  ><tr align="center">
<td>
<a href="admin.php?pilih=produk&mod=yes">PRODUK</a>&nbsp;&nbsp;
</td>
<td>
<a href="admin.php?pilih=produk&mod=yes&aksi=stokopname">STOK OPNAME</a>&nbsp;&nbsp;
</td>
</tr></table>
</div>';

if($_GET['aksi']== 'del'){    
	global $koneksi_db;    
	$id     = int_filter($_GET['id']);    
	$hasil = $koneksi_db->sql_query("DELETE FROM `pos_produk` WHERE `id`='$id'");    
	if($hasil){    
		$admin.='<div class="sukses">Produk berhasil dihapus! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=produk&mod=yes" />';    
	}
}

if($_GET['aksi'] == 'edit'){
$id = int_filter ($_GET['id']);
if(isset($_POST['submit'])){
	$jenjang 		= $_POST['jenjang'];
	$kode 		= $_POST['kode'];
	$nama 		= $_POST['nama'];
	$jenis 		= $_POST['jenis'];
	$jumlah 		= int_filter($_POST['jumlah']);
		$jumlah2 		= int_filter($_POST['jumlah2']);
	$hargabeli 		= int_filter($_POST['hargabeli']);
	$hargajual 		= int_filter($_POST['hargajual']);
	
	$error 	= '';
	if($jumlah2<>$jumlah){
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT id FROM pos_alur_stok WHERE transaksi like 'Stok Awal' and kodebarang like'$kode'")) > 0) $error .= "Error: Produk sudah terdapat Stok Awal , silahkan ulangi.<br />";
	}
if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT jenjang FROM pos_produk WHERE jenjang='$jenjang' and jenis='$jenis' and kode='$kode'")) > 1) $error .= "Error: Produk sudah terdaftar , silahkan ulangi.<br />";
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
	
	setsaldoawal($kode);
		$hasil  = mysql_query( "UPDATE `pos_produk` SET `kode`='$kode',`jenjang`='$jenjang',`nama`='$nama',`jenis`='$jenis',`jumlah`='$jumlah2',`hargabeli`='$hargabeli',`hargajual`='$hargajual' WHERE `id`='$id'" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Update.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=produk&amp;mod=yes" />';	
		}else{
			$admin .= '<div class="error"><b>Gagal di Update.</b></div>';
		}
						unset($kode);
		unset($nama);
		unset($jumlah);
		unset($jumlah2);
		unset($hargabeli);
		unset($hargajual);
	}

}
$query 		= mysql_query ("SELECT * FROM `pos_produk` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$jenis  			= $data['jenis'];
$jenjang  			= $data['jenjang'];
$kode = $data['kode'];
$generatekode=generatekodeedit('KPR','kode','pos_produk',$id);
if(!$kode){$kode = $generatekode;}
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Edit Produk</h3></div>';
$admin .= '
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table INFO">
<tr>
	<td>Jenis</td>
		<td>:</td>
	<td><select name="jenis" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM pos_jenisproduk where jenis='BARANG' ORDER BY nama asc");
$admin .= '<option value="">== Jenis Produk==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$pilihan = ($datas['id']==$jenis)?"selected":'';
$admin .= '<option value="'.$datas['id'].'"'.$pilihan.'>'.$datas['nama'].'</option>';
}
$admin .='</select></td>
</tr>
<tr>
	<td>Jenjang</td>
		<td>:</td>
	<td><select name="jenjang" class="form-control" required>';
$hasilj = $koneksi_db->sql_query("SELECT * FROM pos_jenjang ORDER BY nama asc");
$admin .= '<option value="">== Jenjang==</option>';
while ($datasj =  $koneksi_db->sql_fetchrow ($hasilj)){
$pilihanj = ($datasj['id']==$jenjang)?"selected":'';
$admin .= '<option value="'.$datasj['id'].'"'.$pilihanj.'>'.$datasj['nama'].'</option>';
}
$admin .='</select></td>
</tr>
	<tr>
		<td>Kode Barang</td>
		<td>:</td>
		<td>'.$kode.'<input type="hidden" name="kode" size="25"class="form-control" value="'.$kode.'" required  maxlength="15"></td>
	</tr>
	<tr>
		<td>Nama Barang</td>
		<td>:</td>
		<td><input type="text" name="nama" size="25"class="form-control" value="'.$data['nama'].'" required></td>
	</tr>
	<tr>
		<td>Jumlah</td>
		<td>:</td>
		<td><input type="text" name="jumlah2" size="25"class="form-control"value="'.$data['jumlah'].'"></td>
	</tr>
		<tr>
		<td>Harga Beli</td>
		<td>:</td>
		<td><input type="text" name="hargabeli" size="25"class="form-control"value="'.$data['hargabeli'].'"></td>
	</tr>
		<tr>
		<td>Harga Jual</td>
		<td>:</td>
		<td><input type="text" name="hargajual" size="25"class="form-control"value="'.$data['hargajual'].'"></td>
	</tr>

	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="hidden" name="jumlah" size="25"class="form-control"value="'.$data['jumlah'].'">
		<input type="submit" value="Simpan" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form></div>';
}

if($_GET['aksi']==""){
if(isset($_POST['submit'])){
$jenjang 		= $_POST['jenjang'];
$kode 		= $_POST['kode'];
$nama 		= $_POST['nama'];
$jenis 		= $_POST['jenis'];
$jumlah 		= int_filter($_POST['jumlah']);
$hargabeli 		= int_filter($_POST['hargabeli']);
$hargajual 		= int_filter($_POST['hargajual']);
	$error 	= '';
	if ($koneksi_db->sql_numrows($koneksi_db->sql_query("SELECT jenjang FROM pos_produk WHERE jenjang='$jenjang' and jenis='$jenis' and kode='$kode'")) > 0) $error .= "Error: Produk sudah terdaftar , silahkan ulangi.<br />";
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{

		$hasil  = mysql_query( "INSERT INTO `pos_produk` VALUES ('','$jenis','$jenjang','$kode','$nama','$jumlah','$hargabeli','$hargajual')" );
		setsaldoawal($kode);
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Buat.</b></div>';
		}else{
			$admin .= '<div class="error"><b> Gagal di Buat.</b></div>';
		}
		unset($nama);
	}

}
$generatekode=generatekode('KPR','kode','pos_produk');
$kode     		= !isset($kode) ? $generatekode : $kode;
$jenjang     		= !isset($jenjang) ? '' : $jenjang;
$nama     		= !isset($nama) ? '' : $nama;
$jenis     		= !isset($jenis) ? '' : $jenis;
$jumlah     		= !isset($jumlah) ? '0' : $jumlah;
$hargabeli     		= !isset($hargabeli) ? '0' : $hargabeli;
$hargajual     		= !isset($hargajual) ? '0' : $hargajual;

$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Tambah Produk</h3></div>';

$admin .= '
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table table-condensed">
<tr>
	<td>Jenis</td>
		<td>:</td>
	<td><select name="jenis" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM pos_jenisproduk where jenis='BARANG' ORDER BY nama asc");
$admin .= '<option value="">== Jenis Produk==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$admin .= '<option value="'.$datas['id'].'">'.$datas['nama'].'</option>';
}
$admin .='</select></td>
</tr>
<tr>
	<td>Jenjang</td>
		<td>:</td>
	<td><select name="jenjang" class="form-control" required>';
$hasilj = $koneksi_db->sql_query("SELECT * FROM pos_jenjang ORDER BY nama asc");
$admin .= '<option value="">== Jenjang ==</option>';
while ($datasj =  $koneksi_db->sql_fetchrow ($hasilj)){
$admin .= '<option value="'.$datasj['id'].'">'.$datasj['nama'].'</option>';
}
$admin .='</select></td>
</tr>
	<tr>
		<td>Kode Barang</td>
		<td>:</td>
		<td><b>'.$kode.'</b><input type="hidden" name="kode"value="'.$kode.'" size="25" maxlength="15" class="form-control" required></td>
	</tr>
	<tr>
		<td>Nama Barang</td>
		<td>:</td>
		<td><input type="text" name="nama" size="25"class="form-control" required></td>
	</tr>
	<tr>
		<td>Jumlah</td>
		<td>:</td>
		<td><input type="text" name="jumlah" size="25"class="form-control"></td>
	</tr>
		<tr>
		<td>Harga Beli</td>
		<td>:</td>
		<td><input type="text" name="hargabeli" size="25"class="form-control"></td>
	</tr>
		<tr>
		<td>Harga Jual</td>
		<td>:</td>
		<td><input type="text" name="hargajual" size="25"class="form-control"></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Simpan" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form>';
$admin .= '</div>';

}

if($_GET['aksi']=="import"){
	if(isset($_POST['submit'])){
	$jenis 		= $_POST['jenis'];
	$jenjang 		= $_POST['jenjang'];
//nilai awal counter jumlah data yang sukses dan yang gagal diimport
 $sukses = 0;
 $gagal = 0;
$cell   = new Spreadsheet_Excel_Reader($_FILES['upfile']['tmp_name']);
$jum = $cell->rowcount($sheet_index=0);
 
$i = 2; // dimulai dari ke dua karena baris pertama berisi title
while( $i<=$jum ){
 
   //$cell->val( baris,kolom )
 
   $kode  = $cell->val( $i,1 );
   $nama = $cell->val( $i,2 );
   $jumlah = $cell->val( $i,3 );
    $hargabeli = $cell->val( $i,4 );
   $hargajual = $cell->val( $i,5 );

$sql ="INSERT INTO `pos_produk` (`jenis`,`jenjang`,`kode`,`nama`,`jumlah`,`hargabeli`,`hargajual`) VALUES ('$jenis','$jenjang','$kode','$nama','$jumlah','$hargabeli','$hargajual')";
$hasil = mysql_query( $sql );
setsaldoawal($kode);
if($hasil){
$sukses++;
}else{
$gagal++;
}
   $i++;
}
 //tampilkan report hasil import
 $admin .= "<h3> Proses Import Data Produk Selesai</h3>";
 $admin .= "<p>Jumlah data sukses diimport : ".$sukses."<br>";
 $admin .= "Jumlah data gagal diimport : ".$gagal."<p>";

}

$admin .= '<div class="panel panel-info">';
$admin .='<div class="panel-heading"><b>Import Produk</b></div>';
$admin .='
 <form method="post" enctype="multipart/form-data" action="">
 <table class="table table-striped table-hover">
 <tr>
		<td>Jenis</td>
		<td>:</td>
		<td>
<select name="jenis" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM pos_jenisproduk where jenis='BARANG' ORDER BY nama");
$admin .= '<option value="">== Pilih Jenis ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$admin .= '<option value="'.$datas['id'].'" '.$pilihan.'>'.$datas['nama'].'</option>';
}
$admin .='</select></td>
	</tr>
 <tr>
		<td>Jenjang</td>
		<td>:</td>
		<td>
<select name="jenjang" class="form-control" required>';
$hasil = $koneksi_db->sql_query("SELECT * FROM pos_jenjang ORDER BY nama");
$admin .= '<option value="">== Pilih Jenjang ==</option>';
while ($datas =  $koneksi_db->sql_fetchrow ($hasil)){
$admin .= '<option value="'.$datas['id'].'" '.$pilihan.'>'.$datas['nama'].'</option>';
}
$admin .='</select></td>
	</tr>
 <tr>
	<td>Silakan Pilih File Excel </td>
	<td>:</td>
	<td><input name="upfile" type="file"></td>
 </tr>
 <tr>
	<td>Contoh File Excel </td>
	<td>:</td>
	<td><a href="mod/produk/admin/importproduk.xls">importproduk.xls</a></td>
 </tr>
 <tr>
	<td></td>
	<td></td>
	<td><input name="submit" type="submit" value="import" class="btn btn-success"></td>
 </tr>
 </table>
 </form></div>';
}

if($_GET['aksi'] == 'stokopname'){
$id = int_filter ($_GET['id']);
if(isset($_POST['submit'])){
	$tgl 		= $_POST['tgl'];
	$kode 		= $_POST['kode'];
	$jumlah 		= $_POST['jumlah'];
	$selisih 		= $_POST['selisih'];
	$mutasi 		= $_POST['mutasi'];

	$error 	= '';
if (!$kode)  $error .= "Error: Barang belum dipilih , silahkan ulangi.<br />";
if (!$selisih and $mutasi=='stok awal' and $jumlah=='0')  $error .= "Error: selisih belum diisi , silahkan ulangi.<br />";
if (!$selisih and $mutasi!='stok awal')  $error .= "Error: selisih belum diisi , silahkan ulangi.<br />";
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
		if($mutasi=='mutasi masuk'){
	$jumlahbaru = $jumlah + $selisih;
		alurstok($tgl,$mutasi,'-',$kode,$selisih);
		$hasil  = mysql_query( "UPDATE `pos_produk` SET `jumlah`='$jumlahbaru' WHERE `id`='$id'" );
	}elseif ($mutasi=='mutasi keluar')
	{
	$jumlahbaru = $jumlah - $selisih;	
	alurstok($tgl,$mutasi,'-',$kode,$selisih);
	$hasil  = mysql_query( "UPDATE `pos_produk` SET `jumlah`='$jumlahbaru' WHERE `id`='$id'" );
	}else{
	$ceksaldoawal = ceksaldoawal($kode);
if($ceksaldoawal=='0' and $jumlah=='0'){
alurstok($tgl,$mutasi,'-',$kode,$selisih);
$hasil  = mysql_query( "UPDATE `pos_produk` SET `jumlah`='$selisih' WHERE `id`='$id'");
}elseif($ceksaldoawal=='0' and $jumlah){
alurstok($tgl,$mutasi,'-',$kode,$jumlah);
}

else{
$hasil  = mysql_query( "UPDATE `pos_alur_stok` SET `jumlah`='$jumlah' WHERE `id`='$id'" );
}
	}
	//	$hasil  = mysql_query( "UPDATE `pos_produk` SET `jumlah`='$jumlahbaru' WHERE `id`='$id'" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Update.</b></div>';
		//	$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=produk&amp;mod=yes&aksi=stokopname" />';	
		}else{
			$admin .= '<div class="error"><b>Gagal di Update.</b></div>';
		}
	}
}
$tglawal = date("Y-m-01");
$tglnow = date("Y-m-d");
$tgl 		= !isset($tgl) ? $tglnow : $tgl;
$query 		= mysql_query ("SELECT * FROM `pos_produk` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$jenis  			= $data['jenis'];
$jenjang  			= $data['jenjang'];
$sel2 = '<select name="mutasi" class="form-control">';
$arr2 = array ('stok awal','mutasi masuk','mutasi keluar');
foreach ($arr2 as $kk=>$vv){
	$sel2 .= '<option value="'.$vv.'">'.$vv.'</option>';	

}

$sel2 .= '</select>'; 
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Edit Produk</h3></div>';
$admin .= '
<form method="post" action="" id="posts"class="form-inline" >
<table class="table table-striped table-hover">
	<tr>
		<td>Tanggal Stok Opname/Stok Awal</td>
		<td>:</td>
		<td><input type="text" name="tgl" value="'.$tgl.'"class="form-control" id="tgl" ></td>
	</tr>
	<tr>
		<td>Kode Barang</td>
		<td>:</td>
		<td><input type="text" name="kode" size="25"class="form-control" value="'.$data['kode'].'" disabled></td>
	</tr>
	<tr>
		<td>Nama Barang</td>
		<td>:</td>
		<td><input type="text" name="nama" size="25"class="form-control" value="'.$data['nama'].'" disabled></td>
	</tr>
	<tr>
		<td>Jumlah Stok Sekarang</td>
		<td>:</td>
		<td><input type="text" name="jumlah2" size="25"class="form-control"value="'.$data['jumlah'].'" disabled></td>
	</tr>
	<tr>
		<td>Tipe Mutasi</td>
		<td>:</td>
		<td>'.$sel2.'</td>
	</tr>
		<tr>
		<td>Selisih Stok</td>
		<td>:</td>
		<td><input type="text" name="selisih" size="25"class="form-control"value="0"></td>
	</tr>

	<tr>
		<td></td>
		<td></td>
		<td>
<input type="hidden" name="jumlah" size="25"class="form-control"value="'.$data['jumlah'].'">
<input type="hidden" name="kode" size="25"class="form-control"value="'.$data['kode'].'">
		<input type="submit" value="Simpan" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form></div>';	
}

if (in_array($_GET['aksi'],array('edit','del','','import'))){

$admin.='
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Kategori</th>
            <th>Jenjang</th>
            <th>Kode</th>
			<th>Nama Barang</th>
           <th>Jumlah</th>
           <th>H.Beli</th>
           <th>H.Jual</th>
            <th width="30%">Aksi</th>
        </tr>
    </thead>';
	$admin.='<tbody>';
$hasil = $koneksi_db->sql_query( "SELECT * FROM pos_produk" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$jenjang=$data['jenjang'];
$kode=$data['kode'];
$nama=$data['nama'];
$jenis=$data['jenis'];
$jumlah=$data['jumlah'];
$hargabeli=$data['hargabeli'];
$hargajual=$data['hargajual'];
$admin.='<tr>
            <td>'.getjenis($jenis).'</td>
            <td>'.getjenjang($jenjang).'</td>
            <td>'.$kode.'</td>
            <td>'.$nama.'</td>
            <td>'.$jumlah.'</td>
            <td>'.$hargabeli.'</td>
            <td>'.$hargajual.'</td>
            <td><a href="?pilih=produk&amp;mod=yes&amp;aksi=del&amp;id='.$data['id'].'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini ?\')"><span class="btn btn-danger">Hapus</span></a> <a href="?pilih=produk&amp;mod=yes&amp;aksi=edit&amp;id='.$data['id'].'"><span class="btn btn-warning">Edit</span></a></td>
        </tr>';
}   
$admin.='</tbody>
</table>';
}

if (in_array($_GET['aksi'],array('stokopname'))){

$admin.='
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Kategori</th>
            <th>Jenjang</th>
            <th>Kode</th>
			<th>Nama Barang</th>
           <th>Stok Awal</th>			
           <th>Stok</th>
            <th width="30%">Aksi</th>
        </tr>
    </thead>';
	$admin.='<tbody>';
$hasil = $koneksi_db->sql_query( "SELECT * FROM pos_produk" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 
$jenjang=$data['jenjang'];
$kode=$data['kode'];
$nama=$data['nama'];
$jenis=$data['jenis'];
$jumlah=$data['jumlah'];
$admin.='<tr>
            <td>'.getjenis($jenis).'</td>
            <td>'.getjenjang($jenjang).'</td>
            <td>'.$kode.'</td>
            <td>'.$nama.'</td>
            <td>'.ceksaldoawal($kode).'</td>
            <td>'.$jumlah.'</td>
            <td><a href="?pilih=produk&amp;mod=yes&amp;aksi=stokopname&amp;id='.$data['id'].'"><span class="btn btn-warning">Stok Opname</span></a></td>
        </tr>';
}   
$admin.='</tbody>
</table>';
}

if($_GET['aksi']== 'deljenis'){    
	global $koneksi_db;    
	$id     = int_filter($_GET['id']);    
	$hasil = $koneksi_db->sql_query("DELETE FROM `pos_jenisproduk` WHERE `id`='$id'");    
	if($hasil){    
		$admin.='<div class="sukses">Jenis Produk berhasil dihapus! .</div>';    
		$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=produk&mod=yes&aksi=jenis" />';    
	}
}

if($_GET['aksi'] == 'editjenis'){
$id = int_filter ($_GET['id']);
if(isset($_POST['submit'])){
	$nama 		= $_POST['nama'];
	$error 	= '';
	if ($error){
		$tengah .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "UPDATE `pos_jenisproduk` SET `nama`='$nama' WHERE `id`='$id'" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Update.</b></div>';
			$style_include[] ='<meta http-equiv="refresh" content="1; url=admin.php?pilih=produk&amp;mod=yes&aksi=jenis" />';	
		}else{
			$admin .= '<div class="error"><b>Gagal di Update.</b></div>';
		}
	}

}
$query 		= mysql_query ("SELECT * FROM `pos_jenisproduk` WHERE `id`='$id'");
$data 		= mysql_fetch_array($query);
$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Edit Jenis</h3></div>';
$admin .= '
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table INFO">
	<tr>
		<td>Nama Jenis</td>
		<td>:</td>
		<td><input type="text" name="nama" value="'.$data['nama'].'" size="25"class="form-control" required></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Simpan" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form></div>';
}

if($_GET['aksi']=="jenis"){
if(isset($_POST['submit'])){
	$nama 		= $_POST['nama'];
	$error 	= '';
	if ($error){
		$admin .= '<div class="error">'.$error.'</div>';
	}else{
		$hasil  = mysql_query( "INSERT INTO `pos_jenisproduk` (`nama`) VALUES ('$nama')" );
		if($hasil){
			$admin .= '<div class="sukses"><b>Berhasil di Buat.</b></div>';
		}else{
			$admin .= '<div class="error"><b> Gagal di Buat.</b></div>';
		}
		unset($nama);
	}

}
$nama     		= !isset($nama) ? '' : $nama;


$admin .= '<div class="panel panel-info">
<div class="panel-heading"><h3 class="panel-title">Tambah Jenis</h3></div>';

$admin .= '
<form method="post" action="">
<table border="0" cellspacing="0" cellpadding="0"class="table table-condensed">
	<tr>
		<td>Nama Jenis</td>
		<td>:</td>
		<td><input type="text" name="nama" size="25"class="form-control" required></td>
	</tr>
	<tr>
		<td></td>
		<td></td>
		<td>
		<input type="submit" value="Simpan" name="submit"class="btn btn-success"></td>
	</tr>
</table>
</form>';
$admin .= '</div>';

}

if (in_array($_GET['aksi'],array('editjenis','deljenis','jenis'))){

$admin.='
<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Jenis / Kategori</th>
            <th width="30%">Aksi</th>
        </tr>
    </thead>';
	$admin.='<tbody>';
$hasil = $koneksi_db->sql_query( "SELECT * FROM pos_jenisproduk" );
while ($data = $koneksi_db->sql_fetchrow($hasil)) { 

$nama=$data['nama'];
$admin.='<tr>
            <td>'.$nama.'</td>
            <td><a href="?pilih=produk&amp;mod=yes&amp;aksi=deljenis&amp;id='.$data['id'].'" onclick="return confirm(\'Apakah Anda Yakin Ingin Menghapus Data Ini ?\')"><span class="btn btn-danger">Hapus</span></a> <a href="?pilih=produk&amp;mod=yes&amp;aksi=editjenis&amp;id='.$data['id'].'"><span class="btn btn-warning">Edit</span></a></td>
        </tr>';
}   
$admin.='</tbody>
</table>';
}

}
echo $admin;
?>