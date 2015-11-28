<link rel="stylesheet" media="screen" href="includes/media/css/jquery.dataTables.css" />
<script language="javascript" type="text/javascript" src="includes/media/js/jquery.js"></script>
<script language="javascript" type="text/javascript" src="includes/media/js/jquery.dataTables.js"></script>
<link href="js/combobox/jquery-ui.css" rel="stylesheet">

<script src="js/combobox/jquery-ui.js"></script>
<script language="JavaScript" type="text/javascript">
$(document).ready(function() {
    $('#example').dataTable( {
    "iDisplayLength":50
});
} );
</script>
<script type="text/javascript">
  $(function() {
$( "#tglstok" ).datepicker({ dateFormat: "yy-mm-dd" } );
  });
  </script>
<?php
error_reporting(0);
include "includes/excel_reader2.php";
$admin='';
 if( mysql_connect("localhost","$mysql_user","$mysql_password") ){
   mysql_select_db( "$mysql_database" );
}else{
   $admin .= "database gagal";
}
if (!cek_login ()){   
	
$admin .='<p class="judul">Access Denied !!!!!!</p>';
}else{
	

if($_GET['aksi']==""){
if(isset($_POST['submit'])){
 	$jenjang 		= $_POST['jenjang'];
	$jenis 		= $_POST['jenis'];
	$tglstok 		= $_POST['tglstok'];
//nilai awal counter jumlah data yang sukses dan yang gagal diimport
 $sukses = 0;
 $gagal = 0;
 $cell   = new Spreadsheet_Excel_Reader($_FILES['upfile']['tmp_name']);
$jumlah = $cell->rowcount($sheet_index=0);
 
$i = 2; // dimulai dari ke dua karena baris pertama berisi title
while( $i<=$jumlah ){

   //$cell->val( baris,kolom )
$kode = strtoupper($cell->val( $i,1 ));
$nama  = strtoupper($cell->val( $i,2 ));
$stok = strtoupper($cell->val( $i,3 ));
$sql  =  "INSERT INTO `pos_produk`VALUES ('','$jenis','$jenjang','$kode','$nama','$stok','0','0')";
$hasil = mysql_query( $sql );
$sql  =  "INSERT INTO `pos_alur_stok`VALUES ('','$tglstok','Stok Awal','-','$kode','$stok')";
$hasil = mysql_query( $sql );
if($hasil){
$sukses++;
}else{
$gagal++;
}
   $i++;
}
 //tampilkan report hasil import
 $admin .= "<h3> Proses Import Produk </b> Selesai</h3>";
 $admin .= "<p>Jumlah data sukses diimport : ".$sukses."<br>";
 $admin .= "Jumlah data gagal diimport : ".$gagal."<p>";


}
$tglnow = date("Y-m-d");
$tglstok 		= !isset($tglstok) ? $tglnow : $tglstok;
$admin .='<div class="panel-heading"><b>Import Stok</b></div>';
$admin .='
 <form method="post" enctype="multipart/form-data" action="">
 <table class="table table-striped table-hover">
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
$hasilj = $koneksi_db->sql_query("SELECT * FROM pos_jenjang ORDER BY id asc");
$admin .= '<option value="">== Jenjang==</option>';
while ($datasj =  $koneksi_db->sql_fetchrow ($hasilj)){
$pilihanj = ($datasj['id']==$jenjang)?"selected":'';
$admin .= '<option value="'.$datasj['id'].'"'.$pilihanj.'>'.$datasj['nama'].'</option>';
}
$admin .='</select></td>
</tr>
	<tr>
		<td>Tanggal Stok Opname/Stok Awal</td>
		<td>:</td>
		<td><input type="text" name="tglstok" value="'.$tglstok.'"class="form-control" id="tglstok" ></td>
	</tr>
 <tr>
	<td>Silakan Pilih File Excel </td>
	<td>:</td>
	<td><input name="upfile" type="file"></td>
 </tr>
 <tr>
	<td></td>
	<td></td>
	<td><input name="submit" type="submit" value="import" class="btn btn-success"></td>
 </tr>
 </table>
 </form>';
}



}






echo $admin;

?>