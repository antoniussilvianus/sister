<script src="controllers/c_pembayaran.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="../js/base64.js"></script>

<!-- combo grid -->
<script src="../js/combogrid/jquery-ui-1.10.1.custom.min.js"></script>
<script src="../js/combogrid/jquery.ui.combogrid-1.6.3.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery-ui-1.10.1.custom.css"/>
<link rel="stylesheet" type="text/css" media="screen" href="../css/combogrid/jquery.ui.combogrid.css"/>
<!--end of combo grid -->

<h4 style="color:white;">Pembayaran </h4>
<div id="loadarea"></div>
<input type="hidden" id="id_loginS" value="<?php echo $_SESSION['id_loginS'];?>">

<!-- tab -->
    <!-- keterangan :
        - pendaftaranTAB : formulir n joining fee
        - dppTAB : uang gedung
        - sppTAB : spp semesteran 
    -->
    <div  data-effect="fade" class="tab-control" data-role="tab-control">
        <ul class="tabs">
            <li onclick="switchPN('pendaftaran');" class="active"><a href="#pendaftaranTAB">Pendaftaran </a></li>
            <li onclick="switchPN('dpp');"><a href="#dppTAB">DPP</a></li>
            <li onclick="switchPN('spp');"><a href="#sppTAB">SPP</a></li>
            <li class="place-right">
                <div class="input-control select">
                    <select data-hint="Departemen" class="cari" name="departemenS" id="departemenS"></select>
                </div>
            </li>
        </ul>
        <div class="frames">

            <!-- pendaftaran  -->
            <div class="frame" id="pendaftaranTAB">
                <button id="pendaftaran_cariBC" data-hint="Pencarian" data-hint-position="top">
                    <i class="icon-search" ></i>
                </button>
                <button id="pendaftaran_cetakBC" data-hint="Cetak" data-hint-position="top">
                    <i class="icon-printer" ></i>
                </button>
                <div class="input-control select span3">
                    <select data-hint="Periode Pendaftaran" name="prosesS" id="prosesS"></select>
                </div>
                <div class="input-control select span3">
                    <select data-hint="Kelompok Pendaftaran" class="pendaftaran_cari" name="kelompokS" id="kelompokS"></select>
                </div>

                <table class="table hovered bordered striped">
                    <thead>
                        <tr style="color:white;"class="info">
                            <th class="text-center">No. Pendaftaran</th>
                            <th class="text-center">Nama</th>
                            <th class="text-center">Formulir</th>
                            <th class="text-center">Joining Fee</th>
                            <th class="text-center">Tanggal</th>
                            <th class="text-center">Status</th>
                        </tr>
                        <tr style="display:none;" id="pendaftaranTR" class="info">
                            <th class="text-left"><input placeholder="nomor pendaftaran" id="nopendaftaranS" class="pendaftaran_cari"></th>
                            <th class="text-left"><input placeholder="nama siswa" id="namaS" class="pendaftaran_cari"></th>
                            <th class="text-leftx"><input placeholder="formulir" id="daftarS" class="pendaftaran_cari"></th>
                            <th class="text-leftx"><input placeholder="joining fee " id="joiningfS" class="pendaftaran_cari"></th>
                            <th class="text-leftx"></th>
                            <th class="text-left"></th>
                        </tr>
                    </thead>

                    <tbody id="pendaftaran_tbody">
                    </tbody>
                    <tfoot>
                    </tfoot>
                </table>
            </div>
            <!-- end of 1st content -->

            <!-- uang gedung -->
            <div class="frame" id="dppTAB">
                <div class="input-control select span3">
                    <select data-hint="Angkatan" class="dpp_cari" name="angkatanS" id="angkatanS"></select>
                </div>
                <table class="table hovered bordered striped">
                    <thead>
                        <tr style="color:white;"class="info">
                            <th class="text-center">NIS </th>
                            <th class="text-center">Nama</th>
                            <th class="text-center">Uraian</th>
                            <th style="display:visible;"class="text-center  uraianCOL">Detil Jurnal</th>
                            <th class="text-center">Aksi</th>
                        </tr>
                        <tr style="display:none;" id="juTR" class="info">
                            <th class="text-left"></th>
                            <th class="text-left"><input onkeyup="inputuang(this);" placeholder="nomor jurnal" id="ju_noS" class="ju_cari"></th>
                            <th class="text-left"><input placeholder="uraian" id="ju_uraianS" class="ju_cari"></th>
                            <th style="display:visible;"class="text-left uraianCOL"></th>
                            <th class="text-left"></th>
                        </tr>
                    </thead>

                    <tbody id="dpp_tbody">
                    </tbody>
                    <tfoot>
                    </tfoot>
                </table>
            </div>

            <div class="frame" id="sppTAB">
                <div class="input-control select span3">
                    <select data-hint="Tahun Ajaran" class="spp_cari" name="tahunajaranS" id="tahunajaranS"></select>
                </div>
                <div class="input-control select span3">
                    <select data-hint="Tingkat" class="spp_cari" name="tingkatS" id="tingkatS"></select>
                </div>
                <div class="input-control select span3">
                    <select data-hint="Sub Tingkat" class="spp_cari" name="subtingkatS" id="subtingkatS"></select>
                </div>
                <div class="input-control select span3">
                    <select data-hint="Kelas" class="spp_cari" name="kelasS" id="kelasS"></select>
                </div>

                <table class="table hovered bordered striped">
                    <thead>
                        <tr style="color:white;"class="info">
                            <th class="text-center">nis </th>
                            <th class="text-center">nama</th>
                            <th class="text-center">tunggakan</th>
                            <th class="text-center">Aksi</th>
                        </tr>
                        <tr style="display:none;" id="sppTR" class="info">
                            <th class="text-left"><input placeholder="nis" id="spp_nisS" class="spp_cari"></th>
                            <th class="text-left"><input placeholder="nama" id="spp_namaS" class="spp_cari"></th>
                            <th class="text-left"><input placeholder="tunggakan" id="spp_tunggakanS" class="spp_cari"></th>
                            <th class="text-left"></th>
                        </tr>
                    </thead>

                    <tbody id="spp_tbody">
                    </tbody>
                    <tfoot>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
<!-- end of tab -->

<!-- end of panel 3 -->
<!-- 
    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
 -->
