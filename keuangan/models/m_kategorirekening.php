<?php
	session_start();
	require_once '../../lib/dbcon.php';
	require_once '../../lib/func.php';
	require_once '../../lib/pagination_class.php';
	require_once '../../lib/tglindo.php';
	$mnu = 'kategorirekening';
	$tb  = 'keu_'.$mnu;

	if(!isset($_POST['aksi'])){
		$out=json_encode(array('status'=>'invalid_no_post'));		
	}else{
		switch ($_POST['aksi']) {
			case 'tampil':
				$kode           = trim($_POST['kodeS'])?filter($_POST['kodeS']):'';
				$subrekening    = trim($_POST['subrekeningS'])?filter($_POST['subrekeningS']):'';
				$statusrekening = trim($_POST['statusrekeningS'])?filter($_POST['statusrekeningS']):'';
				$nama           = trim($_POST['namaS'])?filter($_POST['namaS']):'';
				$keterangan     = trim($_POST['keteranganS'])?filter($_POST['keteranganS']):'';
				$sql = 'SELECT *
						FROM '.$tb.'
						WHERE 
							keterangan like "%'.$keterangan.'%" and
							nama like "%'.$nama.'%" and
							statusrekening like "%'.$statusrekening.'%" and
							subrekening like "%'.$subrekening.'%" and
							kode like "%'.$kode.'%" 
						ORDER 
							BY kode asc';
				// print_r($sql);exit();
				if(isset($_POST['starting'])){ //nilai awal halaman
					$starting=$_POST['starting'];
				}else{
					$starting=0;
				}
				$recpage = 4;//jumlah data per halaman
				$aksi    ='tampil';
				$subaksi ='';
				$obj     = new pagination_class($sql,$starting,$recpage,$aksi, $subaksi);
				$result =$obj->result;

				$jum = mysql_num_rows($result);
				$out ='';
				if($jum!=0){	
					$nox 	= $starting+1;
					while($res = mysql_fetch_assoc($result)){	
						$btn ='<td>
									<button data-hint="ubah"  onclick="viewFR('.$res['replid'].');">
										<i class="icon-pencil on-left"></i>
									</button>
									<button data-hint="hapus" onclick="del('.$res['replid'].');">
										<i class="icon-remove on-left"></i>
									</button>
								 </td>';
						$out.= '<tr>
									<td>'.$res['kode'].'</td>
									<td>'.$res['nama'].'</td>
									<td>'.$res['keterangan'].'</td>
									'.$btn.'
								</tr>';
						$nox++;
					}
				}else{ #kosong
					$out.= '<tr align="center">
							<td  colspan=9 ><span style="color:red;text-align:center;">
							... data tidak ditemukan...</span></td></tr>';
				}
				#link paging
				$out.= '<tr class="info"><td colspan=9>'.$obj->anchors.'</td></tr>';
				$out.='<tr class="info"><td colspan=9>'.$obj->total.'</td></tr>';
			break; 
			// view -----------------------------------------------------------------

			// add / edit -----------------------------------------------------------------
			case 'simpan':
				$s 	= $tb.' set kode       	= "'.filter($_POST['kodeTB']).'",
								subrekening = "'.filter($_POST['subrekeningTB']).'",
								nama        = "'.filter($_POST['namaTB']).'",
								keterangan  = "'.filter($_POST['keteranganTB']).'"';
				// var_dump($s);exit();
				$s2   = isset($_POST['replid'])?'UPDATE '.$s.' WHERE replid='.$_POST['replid']:'INSERT INTO '.$s;
				$e    = mysql_query($s2);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat));
			break;
			// add / edit -----------------------------------------------------------------
			

			// delete -----------------------------------------------------------------
			case 'hapus':
				$d    = mysql_fetch_assoc(mysql_query('SELECT * from '.$tb.' where replid='.$_POST['replid']));
				$s    = 'DELETE from '.$tb.' WHERE replid='.$_POST['replid'];
				$e    = mysql_query($s);
				$stat = ($e)?'sukses':'gagal';
				$out  = json_encode(array('status'=>$stat,'terhapus'=>$d['nama']));
			break;
			// delete -----------------------------------------------------------------

			// ambiledit -----------------------------------------------------------------
			case 'ambiledit':
				$s 		= ' SELECT *
							from '.$tb.'
							WHERE replid='.$_POST['replid'];
				// var_dump($s);exit();
				$e 		= mysql_query($s) or die(mysql_error());
				$r 		= mysql_fetch_assoc($e);
				$stat 	= ($e)?'sukses':'gagal';
				$out 	= json_encode(array(
							'status'         =>$stat,
							'subrekening'    =>$r['subrekening'],
							'statusrekening' =>$r['statusrekening'],
							'kode'           =>$r['kode'],
							'nama'           =>$r['nama'],
							'keterangan'     =>$r['keterangan']
						));
			break;
			// ambiledit -----------------------------------------------------------------

			// aktifkan -----------------------------------------------------------------
			case 'aktifkan':
				$e1   = mysql_query('UPDATE  '.$tb.' set aktif="0"');
				if(!$e1){
					$stat='gagal menonaktifkan';
				}else{
					$s2 = 'UPDATE  '.$tb.' set aktif="1" where replid = '.$_POST['replid'];
					$e2 = mysql_query($s2);
					if(!$e2){
						$stat='gagal mengaktifkan';
					}else{
						$stat='sukses';
					}
				}$out  = json_encode(array('status'=>$stat));
			break;
			// aktifkan -----------------------------------------------------------------

			// cmbtahunbuku -----------------------------------------------------------------
			case 'cmb'.$mnu:
				$w='';
				if(isset($_POST['replid'])){
					$w.='where replid ='.$_POST['replid'];
				}else{
					if(isset($_POST[$mnu])){
						$w.='where '.$mnu.'='.$_POST[$mnu];
					}elseif(isset($_POST['departemen'])){
						$w.='where departemen ='.$_POST['departemen'];
					}
				}
				
				$s	= ' SELECT *
						from '.$tb.'
						'.$w.'		
						ORDER  BY nama desc';
				// var_dump($s);exit();
				$e 	= mysql_query($s);
				$n 	= mysql_num_rows($e);
				$ar=$dt=array();

				if(!$e){ //error
					$ar = array('status'=>'error');
				}else{
					if($n=0){ // kosong 
						$ar = array('status'=>'kosong');
					}else{ // ada data
						if(!isset($_POST['replid'])){
							while ($r=mysql_fetch_assoc($e)) {
								$dt[]=$r;
							}
						}else{
							$dt[]=mysql_fetch_assoc($e);
						}$ar = array('status'=>'sukses',$mnu=>$dt);
					}
				}$out=json_encode($ar);
			break;
			// cmbtahunajaran -----------------------------------------------------------------

		}
	}echo $out;

?>