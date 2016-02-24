<?php isMenu($modul,'ceksiswa'); ?>
<script src="controllers/c_ceksiswa.js"></script>
<script src="js/metro/metro-hint.js"></script>
<script src="js/metro/metro-calendar.js"></script>
<script src="js/metro/metro-datepicker.js"></script>

<h2>Cek Siswa</h2>
<button <?php echo isAksi('ceksiswa','c')?'onclick="viewFR(\'\')"':'disabled'; ?> class="place-left" data-hint="Tambah Data" id="tambahBC"><span class="icon-plus-2"></span> </button> 
<table class="table hovered bordered striped">
    <thead>
        <tr style="color:white;"class="info">
            <th class="text-center">No. Pendaftaran</th>
            <th class="text-center">Nama</th>
            <th class="text-center">Dept</th>
            <th class="text-center">Th. Ajaran</th>
            <th class="text-center">Gelombang</th>
            <th class="text-center">Tingkat</th>
            <th class="text-center">Subtingkat</th>
            <th class="text-center">Kelas</th>
            <th class="text-center">Aksi</th>
        </tr>
        <tr xstyle="display:none;" id="cariTR" class="selected">
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari ..." id="namasiswaS" name="namasiswaS"></div></th>
            <th class="text-center"><div class="input-control text"><input class="cari" placeholder="cari ..." id="keteranganS" name="keteranganS"></div></th>
            <th></th>
        </tr>
    </thead>
    <tbody id="tbody"></tbody>
</table>