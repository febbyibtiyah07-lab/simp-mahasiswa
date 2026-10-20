<?php
session_start();
if (empty($_SESSION['id_pengguna'])) { header('Location: login.php'); exit; }
require_once __DIR__ . '/koneksi.php';
function e($s) { return htmlspecialchars((string)$s, ENT_QUOTES, 'UTF-8'); }
function tableColumns(mysqli $db, string $table): array {
    try { $r=mysqli_query($db, 'SHOW COLUMNS FROM `'.$table.'`'); $cols=[]; while($row=mysqli_fetch_assoc($r)) $cols[strtolower($row['Field'])]=$row['Field']; return $cols; }
    catch (mysqli_sql_exception $ex) { error_log($ex->getMessage()); return []; }
}
function countRows(mysqli $db,string $table): int { try {$r=mysqli_query($db,'SELECT COUNT(*) AS total FROM `'.$table.'`');return (int)mysqli_fetch_assoc($r)['total'];}catch(mysqli_sql_exception $ex){return 0;} }
$totalMahasiswa=countRows($koneksi,'mahasiswa');
$totalProdi=countRows($koneksi,'program_studi');
$totalFakultas=countRows($koneksi,'fakultas');
$prodi=[]; $cols=tableColumns($koneksi,'program_studi');
$nameCol=$cols['nama_prodi']??null; $idCol=$cols['id_prodi']??null; $codeCol=$cols['kode_prodi']??null; $levelCol=$cols['jenjang']??null;
if ($nameCol) {
    $select=['`'.$nameCol.'` AS nama'];
    if($idCol) $select[]='`'.$idCol.'` AS id';
    if($codeCol) $select[]='`'.$codeCol.'` AS kode';
    if($levelCol) $select[]='`'.$levelCol.'` AS jenjang';
    try {$r=mysqli_query($koneksi,'SELECT '.implode(', ',$select).' FROM `program_studi` ORDER BY `'.$nameCol.'`');while($row=mysqli_fetch_assoc($r)) $prodi[]=$row;} catch(mysqli_sql_exception $ex){error_log($ex->getMessage());}
}
$preferred=['Teknik Informatika','Arsitektur','Sistem Informasi'];
$chosen=[]; foreach($preferred as $wanted){foreach($prodi as $p){if(strcasecmp(trim($p['nama']),$wanted)===0){$chosen[]=$p;break;}}}
// Tampilkan data aktual bila nama program studi dalam database berbeda.
if (!$chosen && $prodi) $chosen=array_slice($prodi,0,3);
$displayProdi=$chosen;
$initial=strtoupper(substr(trim($_SESSION['nama_lengkap']??'U'),0,1));
?>
<!DOCTYPE html><html lang="id"><head><meta charset="utf-8"><meta name="viewport" content="width=device-width,initial-scale=1"><title>Dashboard | SIM Mahasiswa</title><link rel="stylesheet" href="login-dashboard.css?v=1"></head><body class="dashboard-body">
<div class="app-layout"><aside class="sidebar"><a class="brand light" href="dashboard.php"><span class="brand-mark">🎓</span><span><strong>SIM Mahasiswa</strong><small>Universitas Digital</small></span></a><div class="sidebar-label">MENU UTAMA</div><nav class="side-nav" aria-label="Menu dashboard"><a class="selected" href="dashboard.php">▦ <span>Dashboard</span></a><a href="dashboard.php#program-studi">▤ <span>Program Studi</span></a><a href="dashboard.php#ringkasan">◫ <span>Ringkasan Data</span></a><a href="index.php">⌂ <span>Beranda Website</span></a></nav><div class="sidebar-bottom"><div class="sidebar-note">✦<br><strong>Portal Akademik</strong><p>Data kampus dalam satu tempat.</p></div><a class="logout-side" href="logout.php">↪ Keluar Akun</a></div></aside>
<div class="main-area"><header class="topbar"><button class="menu-toggle" id="menuToggle" type="button" aria-label="Buka menu">☰</button><div class="breadcrumbs">SIM Mahasiswa <span>/</span> <strong>Dashboard</strong></div><div class="top-profile"><span class="role-tag"><?=e($_SESSION['nama_role']??'Pengguna')?></span><div class="avatar"><?=e($initial)?></div><span class="profile-name"><?=e($_SESSION['nama_lengkap']??'Pengguna')?></span></div></header>
<main class="dashboard-content"><section class="welcome-banner"><div><span class="overline">OVERVIEW AKADEMIK</span><h1>Halo, <?=e($_SESSION['nama_lengkap']??'Pengguna')?>! 👋</h1><p>Selamat datang di dashboard SIM Mahasiswa. Pantau informasi akademik dengan lebih mudah.</p></div><div class="banner-decoration">🎓</div></section>
<section id="ringkasan"><div class="section-heading"><div><span class="overline">INFORMASI TERKINI</span><h2>Ringkasan Data</h2></div><span class="date-chip"><?=e(date('d/m/Y'))?></span></div><div class="stats-grid"><article class="stat-card main-stat"><div class="stat-symbol">♙</div><span>Total Mahasiswa</span><strong><?=number_format($totalMahasiswa,0,',','.')?></strong><small>Data mahasiswa terdaftar</small></article><article class="stat-card"><div class="stat-symbol">▤</div><span>Program Studi</span><strong><?=number_format($totalProdi,0,',','.')?></strong><small>Program studi dalam sistem</small></article><article class="stat-card"><div class="stat-symbol">▥</div><span>Fakultas</span><strong><?=number_format($totalFakultas,0,',','.')?></strong><small>Fakultas terdaftar</small></article></div></section>
<section id="program-studi" class="prodi-section"><div class="section-heading"><div><span class="overline">AKADEMIK</span><h2>Program Studi Unggulan</h2></div></div><div class="prodi-grid"><?php if($displayProdi): foreach($displayProdi as $i=>$p): ?><article class="prodi-card"><div class="prodi-icon"><?=['⌘','▥','◈'][$i%3]?></div><div><h3><?=e($p['nama'])?></h3><p><?=e($p['jenjang']??'Program studi')?><?=!empty($p['kode'])?' · '.e($p['kode']):''?></p></div><span class="prodi-arrow">↗</span></article><?php endforeach; else: ?><div class="empty-state">Belum ada data program studi yang bisa ditampilkan. Periksa tabel <code>program_studi</code> di phpMyAdmin.</div><?php endif; ?></div></section>
<div class="info-strip">ℹ️ Dashboard ini menampilkan data langsung dari database. Menu pengelolaan data dapat ditambahkan setelah struktur tabel dan hak akses pengguna dipastikan.</div></main><footer class="dashboard-footer">© <?=date('Y')?> SIM Mahasiswa · Sistem Informasi Manajemen Mahasiswa</footer></div></div>
<script>document.getElementById('menuToggle').addEventListener('click',()=>document.querySelector('.sidebar').classList.toggle('open'));document.querySelectorAll('.side-nav a').forEach(a=>a.addEventListener('click',()=>document.querySelector('.sidebar').classList.remove('open')));</script></body></html>
