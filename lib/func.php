<?php	
// session_start();
/* common*/
	function filter($str){
		$str = mysql_real_escape_string(htmlentities($str));
		return $str;
	}function getuang($str){
		$old = array('Rp. ',',','.');
		$new = array('','','');
		$x   = str_replace($old,$new, $str);
		return $x;
	}function getFileName(){
		$x=pathinfo(__FILE__, PATHINFO_FILENAME);
		return $x;
	}
	function topMenu($modul){
        $out='';
        // looping grup menu
        foreach ($_SESSION['grupmodulS']as $i => $v) {
            foreach ($v['modul'] as $i2 => $v2) {
                if($v2['modul']==$modul and $v2['statmod']==1) {
                    foreach ($v2['grupmenu'] as $i3 => $v3) {
                        $out.='<div class="element">                
                                <a class="dropdown-toggle" href="#">'.$v3['grupmenu'].'</a>
                                <ul class="dropdown-menu" data-role="dropdown">';
                        foreach ($v3['menu'] as $i4 => $v4) {
                            $out.='<li '.($v4['statmenu']==0?'class="disabled"':'').'> 
                                        <a href="'.($v4['statmenu']!=0?$v4['link']:'#').'">'.$v4['menu'].'</a>
                                    </li>';
                        }// end of menu looping
                        $out.='</ul>
                            </div>';
                    } // end of grupmenu looping
                } // end of modul checking
            } // end of  modul looping
        } // grup grupmodul looping 
        echo $out;
	}
	function isAksi($mn,$ak){
	    $aksi=false;
	    foreach ($_SESSION['grupmodulS']as $i => $v) {
	        foreach ($v['modul'] as $i2 => $v2) {
	            foreach ($v2['grupmenu'] as $i3 => $v3) {
	                foreach ($v3['menu'] as $i4 => $v4) {
	                    if($v4['menu']==$mn and $v4['statmenu']==1){
	                        foreach ($v4['aksi'] as $i5 => $v5) {
	                            if($v5['aksi']==$ak) $aksi=true;
	                        }// end of aksi looping
	                    } // end of checking menu
	                }// end of menu looping
	            } // end of grupmenu looping
	        } // end of  modul looping
	    } // grup grupmodul looping 
	    // return 'asem';
	    return $aksi;
	}function isDisabled($mn,$ak){
		return (isAksi($mn,$ak)==false?'disabled':'');
	}function isModul($mod){
	    // $w = array_pop(explode("/", $x));;
	    // $x = __FILE__;
		// $x=preg_replace('/\.php$/', '', __FILE__);
		// $x=pathinfo(__FILE__, PATHINFO_FILENAME);
        // $x = pathinfo(__FILE__, PATHINFO_FILENAME);
		// session_start();
	    $out=0; 
	    foreach ($_SESSION['grupmodulS'] as $i => $v) {
	        foreach ($v['modul'] as $i2 => $v2) {
	            if($v2['modul']==$mod and $v2['statmod']==1) {
	                $out+=1;
	            }
	        }
	    }
	    if($out==0 OR $_SESSION['loginS']==''){
	        header('location:../');
	    }
	}

/*psb*/
	function getAngkatan($typ,$id){
		$s = 'SELECT '.$typ.'
			  FROM aka_angkatan
			  WHERE replid ='.$id;
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r[$typ];
	}function getProses($typ,$id){
		$s = 'SELECT '.$typ.'
			  FROM psb_proses
			  WHERE replid ='.$id;
			  // print_r($s);exit();
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r[$typ];
	}function getKelompok($typ,$id){
		$s = 'SELECT '.$typ.'
			  FROM psb_kelompok
			  WHERE replid ='.$id;
			  // print_r($s);exit();
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r[$typ];
	}function getSiswaBy($f,$w){
		$s='SELECT '.$f.' FROM psb_calonsiswa WHERE replid ='.$w;
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		// var_dump($s);exit();
		return $r[$f];
	}
	
/*akademik*/
	function getDepartemen($id){
		$s='SELECT * FROM departemen WHERE replid='.$id;
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r['nama'];
	}
	// function getAngkatan($f,$id){
	// 	$s='SELECT * FROM aka_angkatan WHERE replid='.$id;
	// 	$e=mysql_query($s);
	// 	$r=mysql_fetch_assoc($e);
	// 	return $r[$f];
	// }
/*keuangan*/
	// transact
	/*pembayaran*/
	function getPembayaran($siswa,$modul){
		$s ='SELECT max(replid) modul
			FROM keu_pembayaran
			WHERE
				siswa = '.$siswa.' AND 
				modul = '.$modul;
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		// return $
	}
	function getTglTrans($f){
		$s='SELECT tanggal
			FROM keu_transaksi
			WHERE pembayaran ='.$
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		// return $r[];	
	}
	function getAngsur($id){
		$s='SELECT * FROM psb_angsuran WHERE replid='.$id;
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		// return $r[];	
	}
	function getBiayaNet($typ,$siswa){
		$biaya = $biayaKotor - $diskonTotal; 		
	}
	function getStatusBayar($typ,$siswa){
		$biaya = getBiaya($typ,$siswa);
		if($typ=='dpp'){
			$diskonTotal= getDiscTotal($typ,$siswa);
			$biaya =- $diskonTotal; 		// 14.100.000
		}
		$terbayar = getTerbayar($typ,$siswa);			//  4.700.000
		// var_dump($terbayar);exit();
		// if($biaya==$terbayar){
		if($terbayar<=0){
			$status = 'belum';
		}else{
			if($terbayar==$biaya){
				$status = 'lunas';
			}else{ 
				$status = 'kurang';
			}
		}

		return $status;
	}
	function getAngsurNom($typ,$siswa){
		$biayaKotor = getBiaya($typ,$siswa);			
		$diskonTotal= getDiscTotal($typ,$siswa);
		$biaya      = $biayaKotor - $diskonTotal; 		
		$angsurkali = getSiswaBy('jmlangsur',$siswa);
		$ret = $biaya/$angsurkali;
		return $ret;
	}function akanBayarOpt($typ,$siswa){
		$biayaKotor = getBiaya($typ,$siswa);			// 15.000.000
		$diskonTotal= getDiscTotal($typ,$siswa); 		// 	  900.000
														// __________ -
		$biaya      = $biayaKotor - $diskonTotal; 		// 14.100.000
		$angsurkali = getSiswaBy('jmlangsur',$siswa);	// 3 x  		use
		$terbayar   = getTerbayar($typ,$siswa);			//  4.700.000
		$angsurnom 	= $biaya/$angsurkali;				// @4.700.000	use
		$sisabayar 	= $biaya-$terbayar;					//  9.400.000
		// var_dump($diskonTotal);exit();
		$ret     = array();
		$nominal = 0;
		$count = $sisabayar/$angsurnom; 				// 1 x  
		for ($i=1; $i<=$count; $i++) {
			$nominal+=$angsurnom;
			$ret[] = array(
				'idAngsur'  => $i,
				'nomAngsur' =>'Rp. '.number_format($nominal)
			);
		}
		return $ret;
	}
	function getTerbayar($typ,$siswa){ // to get : nominal yg telah terbayar
		$s ='SELECT
				SUM(p.cicilan) terbayar
			FROM
				keu_pembayaran p 
				LEFT JOIN keu_modulpembayaran m on m.replid = p.modul
				LEFT JOIN keu_katmodulpembayaran k on k.replid = m.katmodulpembayaran
			WHERE
				k.nama = "'.$typ.'"
				AND p.siswa = '.$siswa.'
			GROUP BY
				p.siswa';
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		$rr = $r['terbayar']!=null?$r['terbayar']:0;
		return $rr;
	}function getBiaya($typ,$siswa){ // to get : nominal yg harus dibayar
		// var_dump($typ.'-'.$siswa);exit();
		if($typ=='pendaftaran'){ // formulir + joining fee
			$f = '(b.daftar + b.joiningf)';
		}elseif($typ=='daftar'){ // formulir
			$f = 'b.daftar';
		}elseif($typ=='joiningf'){ // dpp
			$f = 'b.joiningf';
		}elseif($typ=='dpp'){ // dpp
			$f = 'b.nilai';
		}else{ // spp
			$f = 'b.spp';
		}
			
		$s = 'SELECT '.$f.' as '.$typ.'
			  FROM psb_setbiaya b
			  LEFT JOIN psb_calonsiswa c on c.setbiaya = b.replid
			  WHERE c.replid ='.$siswa;
			  // var_dump($s);exit();
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		return $r[$typ];
	}function getDiscTunai($typ,$siswa){
		$s     = 'SELECT nilai FROM psb_disctunai WHERE replid ='.getSiswaBy('disctunai',$siswa);
		// var_dump($s);exit();
		$e     = mysql_query($s);
		$r     = mysql_fetch_assoc($e);
		$biaya = getBiaya($typ,$siswa);
		$ret   = $r['nilai'] * $biaya / 100;
		return $ret;
	}function getDiscTotal($typ,$siswa){
		// var_dump(getSiswaBy('discsaudara',$siswa));exit(); 	150.000
		// var_dump(getSiswaBy('disctb',$siswa));exit(); 		0
		// var_dump(getDiscTunai($typ,$siswa));exit();			750.000
		$ret = getDiscTunai($typ,$siswa)+getSiswaBy('disctb',$siswa)+getSiswaBy('discsaudara',$siswa);
		// var_dump($ret);exit();
		return $ret;
	}function getOperator($id){
		$s = '	SELECT k.jenis 
				FROM keu_detilrekening d
					LEFT JOIN keu_kategorirekening k on k.replid = d.kategorirekening  
				WHERE d.replid ='.$id;
		// var_dump($s);exit();		
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		$operator = ($r['jenis']=='debit' OR $r['jenis']=='debit_kredit')?'+':'-';
		return $operator; 
	}function getTahunBuku($x){
		$s = 'SELECT '.$x.' FROM keu_tahunbuku WHERE aktif =1';
		$e = mysql_query($s);
		$r = mysql_fetch_assoc($e);
		// var_dump($s);exit();
		return $r[$x];
	}function getJenisTrans($id){
		$s='SELECT * FROM keu_jenistrans WHERE replid='.$id;
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r['nama'];
	}function getBuktiTrans2($id){
		$s='SELECT * FROM keu_detjenistrans WHERE kode="'.$id.'"';
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r['bukti'];
	}function getBuktiTrans($id){
		$s='SELECT * FROM keu_detjenistrans WHERE replid="'.$id.'"';
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r['bukti'];
	}function getDetJenisTrans($id){
		$s='SELECT * FROM keu_detjenistrans WHERE replid='.$id;
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r['nama'];
	}function getKatModulPemb($nama){
		$s='SELECT * FROM keu_katmodulpembayaran WHERE nama="'.$nama.'"';
		// var_dump($s);exit();
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		return $r['detjenistrans'];
	}function getNoTrans2($typ){
		$s = 'SELECT LPAD(max(replid),4,0)replid from keu_transaksi';
		$e = mysql_query($s);
		$stat =!$e?'gagal_'.mysql_error():'sukses';
		if(mysql_num_rows($e)>0){
			$r  =mysql_fetch_assoc($e);
			$in =$r['replid']+1;
		}else{
			$in=1;
		}
		$kode=getBuktiTrans2($typ).'-'.sprintf("%04d",$in).'/'.date("m").'/'.date("Y");
		return $kode;
	}function getNoTrans($typ){
		$s = 'SELECT LPAD(max(replid),4,0)replid from keu_transaksi';
		$e = mysql_query($s);
		$stat =!$e?'gagal_'.mysql_error():'sukses';
		if(mysql_num_rows($e)>0){
			$r  =mysql_fetch_assoc($e);
			$in =$r['replid']+1;
		}else{
			$in=1;
		}$kode=getBuktiTrans(getKatModulPemb($typ)).'-'.sprintf("%04d",$in).'/'.date("m").'/'.date("Y");
		return $kode;
	}function getRekening($id){
		$s='SELECT concat(kode," - ",nama)rekening FROM keu_detilrekening WHERE replid='.$id;
		$e=mysql_query($s);
		$r=mysql_fetch_assoc($e);
		// var_dump($r);exit();
		return $r['rekening'];
	}

	/*transaksi*/
	function transKode($jt=0){
		$kode=array(0=>'MMJ',3=>'BKM',4=>'BKK');
		return $kode[$jt];
	}function jtrans($i1,$i2,$i3){
		$jArr=array(
				array(
					'kode'  =>'',
					'nama'  =>'jurnal umum',
					'warna' =>'fg-blue',
					'sub'   =>array(
						array('kode'=>1,'nama'=>''),
						array('kode'=>2,'nama'=>'')
					)
				),array(
					'kode'  =>'in',
					'nama'  =>'pemasukkan',
					'warna' =>'fg-lightGreen',
					'sub'   =>array(
						array('kode'=>3,'nama'=>'BKM'),
						array('kode'=>5,'nama'=>'BBM')
					)
				),array(
					'kode'  =>'out',
					'nama'  =>'pengeluaran',
					'warna' =>'fg-lightRed',
					'sub'   =>array(
						array('kode'=>4,'nama'=>'BKK'),
						array('kode'=>6,'nama'=>'BBK')
					)
				),
			);
		// if()
		// $ret=$jArr[$i1];
		// // print_r($ok);
		// return f
	}

	function jenisbukti($a){
		if($a==3) return 'BKM'; //masuk
		else if($a==5) return 'BBM'; //masuk	
		else if($a==4) return 'BKK'; //keluar
		else if($a==6) return 'BBK'; //keluar
		else return ''; //lainnya
	}function ju_nomor($no,$jenis,$bukti){
		#jurnal umum 
		if($jenis==0) $cl='fg-blue'; #umum / JT_UMUM
		#pemasukkan
		else if($jenis==1) $cl='fg-lightGreen'; #siswa /JT_SISWA
		else if($jenis==2) $cl='fg-lightGreen'; #calon siswa /JT_CALONSISWA
		else if($jenis==3) $cl='fg-lightGreen'; #income /JT_INCOME
		else if($jenis==5) $cl='fg-lightGreen'; #inbank /JT_INBANK
		#pengeluaran
		else if($jenis==4) $cl='fg-lightRed'; #outcome /JT_OUTCOME
		else if($jenis==6) $cl='fg-lightRed'; #outbank /JT_OUTBANK
		else if($jenis==7) $cl='fg-lightRed'; #Winbrg /JT_INBRG
		#lainnya
		else $cl=''; # /OTHERS

		$ret='<span style="font-weight:bold;" class="'.$cl.'">'.$no.'</span><br>
			'.jenisbukti($jenis).'<br>
			'.($bukti!=''?$bukti:'');
		return $ret;
	}
?>