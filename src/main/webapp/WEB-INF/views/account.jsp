<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!-- css -->
    <link rel="stylesheet" href="../css/nav.css"/>
    <link rel="stylesheet" href="../css/account.css"/>
    <title>메인페이지</title>
    <script>
        // masonry 레이아웃 js
        function SetGridItemHeight(){
            let grid = document.getElementsByClassName('grid')[0];
            let rowHeight = parseInt(window.getComputedStyle(grid).getPropertyValue('grid-auto-rows')); //그리드의 grid-auto-rows 속성값
            let rowGap = parseInt(window.getComputedStyle(grid).getPropertyValue('grid-row-gap')); //그리드의 grid-gap 속성값
            let item = grid.getElementsByClassName('grid-item');

            for(let i =0; i < item.length;++i){
                item[i].style.gridRowEnd = `span ${Math.floor((item[i].children[0].offsetHeight)/35)}`
            }
        }
    
        window.addEventListener("load", SetGridItemHeight);
        window.addEventListener("resize", SetGridItemHeight);
    </script>
</head>
<body>

    <nav class="navigator">
        <div class="nav-logo">Log Picture</div>
        <div class="search-box">
            <span class="material-symbols-outlined">
                search
            </span>
            <input type="text" class="nav-search-input" placeholder="원하는 태그를 입력해보세요."/>
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

    <div class="account-wrap">
        <div class="a-up-box">
            <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Smilies/Growing%20Heart.png" alt="Growing Heart" width="130" height="130" />
            <div class="up-name">enzi_i</div>
            <div class="up-email">dmswl@gmail.com</div>
        </div>
        <hr/>
        <div class="a-down-box">
            <div class="grid">
                <div class="grid-item">
                    <img src="/images/logPicture1.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="/images/logPicture2.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <!-- <div class="grid-item">
                    <img src="/images/logPicture3.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="/images/logPicture4.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="/images/logPicture5.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="/images/logPicture6.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="/images/logPicture7.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="/images/logPicture8.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="/images/logPicture9.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="/images/logPicture10.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="/images/logPicture11.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="/images/logPicture12.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="/images/logPicture13.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="/images/logPicture14.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="/images/logPicture15.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="/images/logPicture16.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="/images/logPicture17.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="/images/logPicture18.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="/images/logPicture19.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="/images/logPicture20.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="/images/logPicture21.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="/images/logPicture22.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="/images/logPicture23.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="/images/logPicture24.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div> -->
            </div>
        </div>
    </div>
    


</body>
</html>