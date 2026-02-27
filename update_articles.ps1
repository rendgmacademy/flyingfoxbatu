$basePath = "d:\antigravity\Outbound Batu Malang\FlyingFox Batu"
$baseUrl = "https://flyingfoxbatu.vercel.app"

$articles = @(
    @{
        File = "sensasi-flying-fox-batu-malang.html"
        Title = "Sensasi Flying Fox Terpanjang di Batu Malang – Flying Fox Batu Malang"
        Description = "Rasakan sensasi flying fox terpanjang di Batu Malang. Trek 200+ meter di ketinggian 30-50 meter dengan pemandangan pegunungan Arjuno. Info harga mulai Rp 75.000, tips keselamatan, dan cara booking."
        Keywords = "flying fox batu malang, flying fox terpanjang jawa timur, wahana flying fox batu, harga flying fox batu, sensasi flying fox"
        BreadcrumbName = "Sensasi Flying Fox"
        ArticleDatePublished = "2024-05-10"
    },
    @{
        File = "tips-memilih-paket-outbound.html"
        Title = "Tips Memilih Paket Outbound yang Tepat untuk Perusahaan – Flying Fox Batu Malang"
        Description = "Panduan lengkap memilih paket outbound perusahaan. Tips pemilihan lokasi, jenis aktivitas, budgeting, hingga evaluasi keberhasilan program."
        Keywords = "tips memilih paket outbound, paket outbound perusahaan, outbound gathering perusahaan, tips outbound company, panduan outbound"
        BreadcrumbName = "Tips Memilih Paket Outbound"
        ArticleDatePublished = "2024-05-12"
    },
    @{
        File = "5-game-outbound-terbaik.html"
        Title = "5 Game Outbound Terbaik untuk Kerjasama Tim – Flying Fox Batu Malang"
        Description = "Rekomendasi 5 game outbound terbaik untuk meningkatkan kerjasama tim perusahaan. Mulai dari trust fall, spider web, hingga raft building."
        Keywords = "game outbound terbaik, permainan team building, games outbound seru, aktivitas kerjasama tim, outbound games perusahaan"
        BreadcrumbName = "5 Game Outbound Terbaik"
        ArticleDatePublished = "2024-05-08"
    },
    @{
        File = "manfaat-team-building.html"
        Title = "Manfaat Team Building untuk Karyawan Perusahaan – Flying Fox Batu Malang"
        Description = "Temukan manfaat psikologis dan profesional team building bagi karyawan perusahaan. Meningkatkan komunikasi, kepercayaan, produktivitas, dan loyalitas tim."
        Keywords = "manfaat team building, team building karyawan, keuntungan outbound perusahaan, program team building, manfaat outbound"
        BreadcrumbName = "Manfaat Team Building"
        ArticleDatePublished = "2024-05-06"
    },
    @{
        File = "5-spot-foto-coban-rondo.html"
        Title = "5 Spot Foto Terbaik di Coban Rondo Batu Malang – Flying Fox Batu Malang"
        Description = "Jangan lewatkan 5 spot foto instagramable di kawasan air terjun Coban Rondo Batu Malang. Tips fotografi, jam terbaik, dan akses lokasi."
        Keywords = "spot foto coban rondo, wisata coban rondo batu, air terjun coban rondo, lokasi instagramable batu malang, foto coban rondo"
        BreadcrumbName = "5 Spot Foto Coban Rondo"
        ArticleDatePublished = "2024-05-04"
    },
    @{
        File = "coban-rondo-fun-games.html"
        Title = "Seru-seruan Fun Games Outbound di Coban Rondo – Flying Fox Batu Malang"
        Description = "Nikmati fun games outbound di kawasan Coban Rondo Batu Malang. Aktivitas seru untuk keluarga, sekolah, dan rombongan perusahaan di alam terbuka."
        Keywords = "fun games coban rondo, outbound coban rondo, aktivitas outbound batu, games outbound keluarga, wisata outbound coban rondo"
        BreadcrumbName = "Fun Games Coban Rondo"
        ArticleDatePublished = "2024-05-02"
    },
    @{
        File = "paket-hemat-liburan-sekolah.html"
        Title = "Paket Hemat Liburan Sekolah 2024 – Flying Fox Batu Malang"
        Description = "Dapatkan diskon khusus paket outbound untuk rombongan sekolah dan universitas selama liburan semester. Paket lengkap termasuk flying fox, fun games, dan makan siang."
        Keywords = "paket outbound sekolah, liburan sekolah batu malang, paket hemat outbound pelajar, outbound murah sekolah, study tour batu malang"
        BreadcrumbName = "Paket Hemat Liburan Sekolah"
        ArticleDatePublished = "2024-04-28"
    },
    @{
        File = "persiapan-barang-outbound.html"
        Title = "Persiapan Barang yang Harus Dibawa Saat Outbound – Flying Fox Batu Malang"
        Description = "Checklist lengkap persiapan barang untuk kegiatan outbound di Batu Malang. Mulai dari pakaian, alas kaki, obat-obatan, hingga perlengkapan dokumentasi."
        Keywords = "persiapan outbound, barang bawaan outbound, checklist outbound, perlengkapan outbound, apa yang dibawa outbound"
        BreadcrumbName = "Persiapan Barang Outbound"
        ArticleDatePublished = "2024-04-25"
    }
)

foreach ($article in $articles) {
    $filePath = Join-Path $basePath $article.File
    $pageUrl = "$baseUrl/$($article.File)"

    if (-not (Test-Path $filePath)) {
        Write-Host "SKIP: $($article.File) not found" -ForegroundColor Yellow
        continue
    }

    $content = Get-Content $filePath -Raw

    $ogImage = ""
    if ($content -match 'src="(https://lh3\.googleusercontent\.com/[^"]+)"') {
        $ogImage = $matches[1]
    }

    $content = $content -replace '<html lang="id">', '<html lang="id" prefix="og: https://ogp.me/ns#">'
    $content = $content -replace '<title>[^<]+</title>', "<title>$($article.Title)</title>"

    $hasMetaDesc = $content -match '<meta name="description"'

    $metaBlock = "    <meta name=`"keywords`" content=`"$($article.Keywords)`" />`r`n"
    $metaBlock += "    <meta name=`"author`" content=`"Flying Fox Batu Malang`" />`r`n"
    $metaBlock += "    <meta name=`"robots`" content=`"index, follow, max-image-preview:large, max-snippet:-1, max-video-preview:-1`" />`r`n"
    $metaBlock += "    <link rel=`"canonical`" href=`"$pageUrl`" />`r`n"
    $metaBlock += "    <link rel=`"alternate`" hreflang=`"id`" href=`"$pageUrl`" />`r`n"
    $metaBlock += "    <link rel=`"icon`" type=`"image/svg+xml`" href=`"favicon.svg`" />`r`n"
    $metaBlock += "    <meta name=`"theme-color`" content=`"#0d1f13`" />`r`n"
    $metaBlock += "    <meta property=`"og:type`" content=`"article`" />`r`n"
    $metaBlock += "    <meta property=`"og:site_name`" content=`"Flying Fox Batu Malang`" />`r`n"
    $metaBlock += "    <meta property=`"og:title`" content=`"$($article.Title)`" />`r`n"
    $metaBlock += "    <meta property=`"og:description`" content=`"$($article.Description)`" />`r`n"
    $metaBlock += "    <meta property=`"og:url`" content=`"$pageUrl`" />`r`n"
    $metaBlock += "    <meta property=`"og:image`" content=`"$ogImage`" />`r`n"
    $metaBlock += "    <meta property=`"og:image:width`" content=`"1200`" />`r`n"
    $metaBlock += "    <meta property=`"og:image:height`" content=`"630`" />`r`n"
    $metaBlock += "    <meta property=`"og:locale`" content=`"id_ID`" />`r`n"
    $metaBlock += "    <meta property=`"article:published_time`" content=`"$($article.ArticleDatePublished)`" />`r`n"
    $metaBlock += "    <meta name=`"twitter:card`" content=`"summary_large_image`" />`r`n"
    $metaBlock += "    <meta name=`"twitter:title`" content=`"$($article.Title)`" />`r`n"
    $metaBlock += "    <meta name=`"twitter:description`" content=`"$($article.Description)`" />`r`n"
    $metaBlock += "    <meta name=`"twitter:image`" content=`"$ogImage`" />`r`n"
    $metaBlock += "    <link rel=`"preconnect`" href=`"https://cdn.jsdelivr.net`" crossorigin />`r`n"
    $metaBlock += "    <link rel=`"preconnect`" href=`"https://fonts.googleapis.com`" crossorigin />`r`n"
    $metaBlock += "    <link rel=`"preconnect`" href=`"https://fonts.gstatic.com`" crossorigin />`r`n"
    $metaBlock += "    <link rel=`"dns-prefetch`" href=`"https://lh3.googleusercontent.com`" />"

    if (-not $hasMetaDesc) {
        $content = $content -replace "(<title>[^<]+</title>)", "`$1`r`n    <meta name=`"description`" content=`"$($article.Description)`" />"
    }

    if ($content -notmatch 'og:type') {
        $content = $content -replace '(<link href="https://fonts\.googleapis\.com/icon\?family=Material\+Icons\+Round" rel="stylesheet"\s*/?>)', "`$1`r`n$metaBlock"
    }

    $headline = $article.Title -replace ' . Flying Fox Batu Malang', ''
    $sd1 = '    <script type="application/ld+json">' + "`r`n"
    $sd1 += '    {"@context":"https://schema.org","@type":"BreadcrumbList","itemListElement":[{"@type":"ListItem","position":1,"name":"Home","item":"' + $baseUrl + '/"},{"@type":"ListItem","position":2,"name":"Blog","item":"' + $baseUrl + '/blog.html"},{"@type":"ListItem","position":3,"name":"' + $article.BreadcrumbName + '","item":"' + $pageUrl + '"}]}' + "`r`n"
    $sd1 += '    </script>' + "`r`n"
    $sd2 = '    <script type="application/ld+json">' + "`r`n"
    $sd2 += '    {"@context":"https://schema.org","@type":"Article","headline":"' + $headline + '","description":"' + $article.Description + '","image":"' + $ogImage + '","datePublished":"' + $article.ArticleDatePublished + '","dateModified":"2026-02-27","author":{"@type":"Organization","name":"Flying Fox Batu Malang","url":"' + $baseUrl + '"},"publisher":{"@type":"Organization","name":"Flying Fox Batu Malang","logo":{"@type":"ImageObject","url":"' + $baseUrl + '/favicon.svg"}},"mainEntityOfPage":{"@type":"WebPage","@id":"' + $pageUrl + '"}}' + "`r`n"
    $sd2 += '    </script>' + "`r`n"

    if ($content -notmatch 'BreadcrumbList') {
        $content = $content -replace '</head>', "$sd1$sd2</head>"
    }

    $content = $content -replace '<script src="https://cdn\.jsdelivr\.net/npm/bootstrap@5\.3\.3/dist/js/bootstrap\.bundle\.min\.js"></script>', '<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" defer></script>'

    [System.IO.File]::WriteAllText($filePath, $content)
    Write-Host "DONE: $($article.File)" -ForegroundColor Green
}

Write-Host "All articles updated!" -ForegroundColor Cyan
