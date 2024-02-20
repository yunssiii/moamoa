<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- css -->
    <link rel="stylesheet" href="../css/login.css"/>
    <!-- 폰트 -->
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet"/>
    <title>로그인 페이지</title>
</head>
<body>

    <!-- 
        기본 visible
        아이디 찾기 누르면 hidden
     -->
    <div class="login-wrap">
        <div class="login-logo">Log Picture</div>
        <input type="text" class="login-input" placeholder="이메일"/>
        <input type="password" class="login-input2" placeholder="비밀번호"/>
        <div class="login-btn-box">
            <button type="button" class="login-btn">로그인</button>
        </div>

        <!-- 
            이메일 찾기 클릭 시 해당 블록 visible
            기본 hidden

            <input type="text" class="email-name" placeholder="이름"/>
            <input type="password" class="email-tel" placeholder="전회번호"/>
            <div class="login-btn-box">
                <button type="button" class="email-btn">이메일 찾기</button>
            </div>
         -->

         <!-- 
            기본 visible
            아이디 찾기 누르면 hidden
          -->
        <div class="login-other-wrap">
            <a href="#" class="login-other-a">이메일 찾기 |</a>
            <a href="#" class="login-other-a"> 비밀번호 재설정 |</a>
            <a href="#" class="login-other-a"> 회원가입</a>
        </div>
    </div>
    
</body>
</html>