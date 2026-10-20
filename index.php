<?php
// Landing page publik. Tidak memerlukan koneksi database.
?>
<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="SIM Mahasiswa - Sistem Informasi Manajemen Mahasiswa">
  <title>SIM Mahasiswa | Universitas Digital</title>
  <link rel="stylesheet" href="style.css?v=1">
</head>
<body>
  <header class="site-header">
    <div class="container nav-wrap">
      <a class="brand" href="#beranda" aria-label="SIM Mahasiswa - Beranda">
        <span class="brand-icon" aria-hidden="true">🎓</span>
        <span><strong>SIM Mahasiswa</strong><small>Universitas Digital</small></span>
      </a>
      <nav class="main-nav" aria-label="Navigasi utama">
        <a class="active" href="#beranda">Beranda</a>
        <a href="#tentang">Tentang</a>
        <a href="#prodi">Program Studi</a>
        <a href="#fitur">Fitur</a>
        <a href="#kontak">Kontak</a>
      </nav>
      <a class="btn btn-primary nav-login" href="login.php">↪ &nbsp; Login</a>
    </div>
  </header>

  <main>
    <section class="hero" id="beranda">
      <div class="container hero-grid">
        <div class="hero-copy">
          <span class="eyebrow"><span class="dot"></span> Sistem Informasi Manajemen Mahasiswa</span>
          <h1>Kelola Data Akademik <span>Lebih Mudah &amp; Efisien</span></h1>
          <p>SIM Mahasiswa hadir untuk memudahkan proses administrasi akademik, mulai dari pengisian KRS, melihat nilai, hingga informasi terkini kampus dalam satu platform.</p>
          <div class="hero-actions">
            <a class="btn btn-primary btn-large" href="login.php">↪ &nbsp; Login Sekarang</a>
            <a class="btn btn-outline btn-large" href="#tentang">▶ &nbsp; Pelajari Lebih Lanjut</a>
          </div>
        </div>
        <div class="hero-art" role="img" aria-label="Ilustrasi mahasiswa wisuda dengan pratinjau dashboard SIM Mahasiswa">
          <img src="assets/hero-wisuda.png" alt="Mahasiswa mengenakan toga dan contoh tampilan dashboard akademik">
        </div>
      </div>
    </section>

    <section class="about container" id="tentang">
      <span class="section-kicker">TENTANG PLATFORM</span>
      <h2>Solusi Akademik dalam Satu Platform</h2>
      <p>Website SIM Mahasiswa membantu mengelola informasi akademik secara lebih terstruktur, praktis, dan mudah diakses.</p>
    </section>

    <section class="programs container" id="prodi">
      <span class="section-kicker">PROGRAM STUDI</span>
      <h2>Pilih Program Studi Unggulan Kami</h2>
      <p class="section-desc">Tiga program studi yang siap mencetak lulusan berkualitas, inovatif, dan berdaya saing di era digital.</p>
      <div class="program-grid">
        <article class="program-card"><span class="program-icon" aria-hidden="true">⌨</span><div><h3>Teknik Informatika</h3><p>Menguasai teknologi, membangun masa depan digital.</p></div><span class="arrow" aria-hidden="true">→</span></article>
        <article class="program-card"><span class="program-icon" aria-hidden="true">▥</span><div><h3>Arsitektur</h3><p>Merancang ruang, membangun kehidupan yang lebih baik.</p></div><span class="arrow" aria-hidden="true">→</span></article>
        <article class="program-card"><span class="program-icon" aria-hidden="true">▤</span><div><h3>Sistem Informasi</h3><p>Mengelola informasi, menciptakan solusi.</p></div><span class="arrow" aria-hidden="true">→</span></article>
      </div>
    </section>

    <section class="features" id="fitur">
      <div class="container features-grid">
        <div class="feature"><span class="feature-icon">♢</span><div><h3>Akses Aman</h3><p>Data Anda terlindungi dengan sistem keamanan.</p></div></div>
        <div class="feature"><span class="feature-icon">ϟ</span><div><h3>Mudah Digunakan</h3><p>Tampilan sederhana dan mudah dipahami.</p></div></div>
        <div class="feature"><span class="feature-icon">▯</span><div><h3>Bisa di Mana Saja</h3><p>Akses melalui berbagai perangkat.</p></div></div>
        <div class="feature"><span class="feature-icon">♧</span><div><h3>Dukungan Responsif</h3><p>Informasi dan bantuan dalam satu platform.</p></div></div>
      </div>
    </section>
  </main>
  <footer id="kontak"><div class="container footer-inner"><span>© <?php echo date('Y'); ?> SIM Mahasiswa</span><span>Sistem Informasi Manajemen Mahasiswa</span></div></footer>
</body>
</html>
