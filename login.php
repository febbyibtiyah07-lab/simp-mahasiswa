
<?php
session_start();
require_once __DIR__ . '/koneksi.php';

if (isset($_SESSION['id_pengguna'])) {
    header('Location: dashboard.php');
    exit;
}

$error = '';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $username = trim($_POST['username'] ?? '');
    $password = $_POST['password'] ?? '';

    if ($username === '' || $password === '') {
        $error = 'Username dan password wajib diisi.';
    } else {
        try {
            $sql = "SELECT
                        p.id_pengguna,
                        p.username,
                        p.password_hash,
                        p.nama_lengkap,
                        r.nama_role
                    FROM pengguna p
                    LEFT JOIN roles r
                        ON p.id_role = r.id_role
                    WHERE p.username = ?
                      AND p.aktif = 1
                    LIMIT 1";

            $stmt = mysqli_prepare($koneksi, $sql);
            mysqli_stmt_bind_param($stmt, 's', $username);
            mysqli_stmt_execute($stmt);

            $result = mysqli_stmt_get_result($stmt);
            $user = mysqli_fetch_assoc($result);

            mysqli_stmt_close($stmt);

            $passwordBenar = false;

            if ($user) {
                $passwordTersimpan = $user['password_hash'];

                // Verifikasi password yang sudah di-hash
                $passwordBenar = password_verify(
                    $password,
                    $passwordTersimpan
                );

                // Migrasi sementara password teks biasa
                if (
                    !$passwordBenar &&
                    password_get_info($passwordTersimpan)['algo'] === null
                ) {
                    $passwordBenar = hash_equals(
                        $passwordTersimpan,
                        $password
                    );

                    if ($passwordBenar) {
                        $hashBaru = password_hash(
                            $password,
                            PASSWORD_DEFAULT
                        );

                        $update = mysqli_prepare(
                            $koneksi,
                            "UPDATE pengguna
                             SET password_hash = ?
                             WHERE id_pengguna = ?"
                        );

                        mysqli_stmt_bind_param(
                            $update,
                            'si',
                            $hashBaru,
                            $user['id_pengguna']
                        );

                        mysqli_stmt_execute($update);
                        mysqli_stmt_close($update);
                    }
                }
            }

            if ($user && $passwordBenar) {
                session_regenerate_id(true);

                $_SESSION['id_pengguna'] = $user['id_pengguna'];
                $_SESSION['username'] = $user['username'];
                $_SESSION['nama_lengkap'] =
                    $user['nama_lengkap'] ?: $user['username'];
                $_SESSION['nama_role'] =
                    $user['nama_role'] ?: 'Pengguna';

                header('Location: dashboard.php');
                exit;
            }

            $error = 'Username atau password tidak sesuai.';

        } catch (mysqli_sql_exception $e) {
            error_log($e->getMessage());
            $error = 'Terjadi kesalahan saat proses login.';
        }
    }
}

function e($value) {
    return htmlspecialchars(
        (string)$value,
        ENT_QUOTES,
        'UTF-8'
    );
}
?>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Login | SIM Mahasiswa</title>

    <link rel="stylesheet"
          href="login-dashboard.css?v=1">
</head>

<body class="login-body">

<main class="login-shell">

    <section class="login-showcase">

        <a class="brand light" href="index.php">
            <span class="brand-mark">🎓</span>
            <span>
                <strong>SIM Mahasiswa</strong>
                <small>Universitas Digital</small>
            </span>
        </a>

        <div class="showcase-center">

            <span class="eyebrow-light">
                PORTAL AKADEMIK DIGITAL
            </span>

            <h1>
                Selamat datang<br>
                kembali.
            </h1>

            <p>
                Kelola informasi akademik dalam
                satu platform yang praktis,
                aman, dan terintegrasi.
            </p>

            <div class="showcase-tiles">
                <span>✦ Modern</span>
                <span>◈ Terintegrasi</span>
                <span>✓ Aman</span>
            </div>

        </div>

        <div class="showcase-footer">
            Sistem Informasi Manajemen Mahasiswa
        </div>

    </section>

    <section class="login-panel">

        <a class="back-link" href="index.php">
            ← Kembali ke beranda
        </a>

        <div class="login-card">

            <div class="login-icon">🔐</div>

            <span class="overline">AKSES AKUN</span>

            <h2>Masuk ke akunmu</h2>

            <p class="muted">
                Gunakan akun yang terdaftar
                di sistem untuk melanjutkan.
            </p>

            <?php if ($error): ?>
                <div class="alert" role="alert">
                    <?= e($error) ?>
                </div>
            <?php endif; ?>

            <form method="post" action="login.php">

                <label for="username">
                    Username
                </label>

                <input
                    id="username"
                    name="username"
                    type="text"
                    autocomplete="username"
                    required
                    value="<?= e($_POST['username'] ?? '') ?>"
                    placeholder="Masukkan username"
                >

                <label for="password">
                    Password
                </label>

                <div class="password-wrap">

                    <input
                        id="password"
                        name="password"
                        type="password"
                        autocomplete="current-password"
                        required
                        placeholder="Masukkan password"
                    >

                    <button
                        type="button"
                        id="togglePassword">
                        Lihat
                    </button>

                </div>

                <button
                    class="primary-button"
                    type="submit">
                    Masuk ke Dashboard →
                </button>

            </form>

            <p class="login-help">
                Belum punya akun?
                Hubungi administrator kampus.
            </p>

        </div>

        <div class="panel-foot">
            © <?= date('Y') ?> SIM Mahasiswa
        </div>

    </section>

</main>

<script>
document.getElementById('togglePassword')
    .addEventListener('click', function () {

        const input = document.getElementById('password');

        if (input.type === 'password') {
            input.type = 'text';
            this.textContent = 'Sembunyikan';
        } else {
            input.type = 'password';
            this.textContent = 'Lihat';
        }

    });
</script>

</body>
</html>
