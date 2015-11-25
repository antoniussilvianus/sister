<link rel="stylesheet" media="screen" href="includes/media/css/jquery.dataTables.css" />
<script language="javascript" type="text/javascript" src="includes/media/js/jquery.js"></script>
<script language="javascript" type="text/javascript" src="includes/media/js/jquery.dataTables.js"></script>
<script language="JavaScript" type="text/javascript">
$(document).ready(function() {
    $('#example').dataTable( {
    "iDisplayLength":50
});
} );
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
$alamat = strtoupper($cell->val( $i,3 ));
$telepon = strtoupper($cell->val( $i,4 ));
$fax = strtoupper($cell->val( $i,5 ));
$cp = strtoupper($cell->val( $i,6 ));
$carabayar = strtoupper($cell->val( $i,7 ));
$termin = strtoupper($cell->val( $i,8 ));
$sql  =  "INSERT INTO `pos_supplier`VALUES ('','$kode','$nama','$alamat','$telepon','$fax','$cp','$carabayar','$termin')";
$hasil = mysql_query( $sql );
if($hasil){
$sukses++;
}else{
$gagal++;
}

   $i++;
}
 //tampilkan report hasil import
 $admin .= "<h3> Proses Import Supplier </b> Selesai</h3>";
 $admin .= "<p>Jumlah data sukses diimport : ".$sukses."<br>";
 $admin .= "Jumlah data gagal diimport : ".$gagal."<p>";


}
$admin .='<div class="panel-heading"><b>Import Supplier</b></div>';
$admin .='
 <form method="post" enctype="multipart/form-data" action="">
 <table class="table table-striped table-hover">
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