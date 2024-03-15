<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!-- css -->
    <link rel="stylesheet" href="../css/nav.css"/>
    <!-- 폰트 -->
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet"/>
    <title>Document</title>
    <style>
        /* nav의 search 아이콘 */
        .material-symbols-rounded {
            font-variation-settings:
                    'FILL' 0,
                    'wght' 400,
                    'GRAD' 0,
                    'opsz' 24;
            font-size: 17pt;
            color: gray;
            margin-left: 10px;
        }
    </style>
</head>
<body>

    <nav class="navigator">
        <div class="nav-logo">Moa Moa</div>
        <div class="search-box">
                    <span class="material-symbols-rounded">
                        search
                    </span>
            <input type="text" class="nav-search-input" placeholder="검색"/>
        </div>
        <div>
            <a class="nav-btn" href="#">로그인</a>
            <span style="font-size: 12pt;">|</span>
            <a class="nav-btn" href="#"> 회원가입</a>
        </div>

        <!-- 로그인 후 -->

        <!-- <div>
            <a class="nav-btn" href="#">글쓰기</a>
            <span style="font-size: 12pt;">|</span>
            <a class="nav-btn" href="#"> 로그아웃</a>
        </div> -->
        <a href="#">
                    <span class="material-symbols-outlined account-btn">
                        account_circle
                    </span>
        </a>
    </nav>
    
</body>
</html>