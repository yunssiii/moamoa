<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!-- css -->
    <link rel="stylesheet" href="../css/nav.css"/>
    <link rel="stylesheet" href="../css/mypage.css"/>
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

    <div class="mypage-wrap">
        <div class="a-up-box">
            <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Smilies/Growing%20Heart.png" alt="Growing Heart" width="130" height="130" />
            <div class="up-name">enzi_i</div>
            <div class="up-email">dmswl@gmail.com</div>
            <div>
                <button type="button" id="myInfoBtn" class="my-btns click">내 정보</button>
                <button type="button" id="saveBtn" class="my-btns">저장</button>
                <button type="button" id="postBtn" class="my-btns">게시글</button>
                <button type="button" id="commentBtn" class="my-btns">댓글</button>
            </div>
        </div>
    </div>
    <div class="a-down-box">

        <!-- 내 정보 -->
        <div id="myInfoBox1" class="myInfoBtns-box">
            <button id="updateNicName" class="update-btns myInfo-click">닉네임 변경</button>
            <span>|</span>
            <button id="updatePassword" class="update-btns">비밀번호 변경</button>
        </div>
        <div id="myInfoBox2" class="myInfo-box">
            <div id="nicnameBox" class="update-inputs-box">
                <div style="font-size: 17pt;margin-bottom: 20px;">
                    ◎ 닉네임 변경
                </div>
                <label for="nicname">닉네임</label>
                <div>
                    <input id="nicname" class="input-box1" type="text"/>
                    <button class="auth-btn" type="button">중복 확인</button>
                </div>
                <div style="display: flex;justify-content: center;">
                    <button class="update-btn">닉네임 변경</button>
                </div>
            </div>
            <div id="passwordBox" class="update-inputs-box hidden">
                <div style="font-size: 17pt;margin-bottom: 20px;">
                    ◎ 비밀번호 변경
                </div>
                <label for="password">현재 비밀번호</label>
                <input id="password" class="input-box2" type="password"/>
                <label for="new-password">새로운 비밀번호</label>
                <input id="new-password" class="input-box2" type="password"/>
                <label for="new-chkPassword">새로운 비밀번호 확인</label>
                <input id="new-chkPassword" class="input-box2"type="password"/>
                <div style="display: flex;justify-content: center;">
                    <button class="update-btn">비밀번호 변경</button>
                </div>
            </div>
        </div>

        <!-- 저장 -->
        <div id="saveBox" class="hidden">저장탭입니다.</div>

        <!-- 게시글 -->
        <div id="postBox" class="hidden">게시글탭입니다.</div>

        <!-- 댓글 -->
        <div id="commentBox" class="hidden">댓글탭입니다.</div>
            
        






        
        
        <!-- <div class="grid">
            <div class="grid-item">
                <img src="/images/logPicture1.jpeg"/>
                <p class="hover-text">라디오 이미지</p>
            </div>
            <div class="grid-item">
                <img src="/images/logPicture2.jpeg"/>
                <p class="hover-text">라디오 이미지</p>
            </div>
        </div> -->
    </div>
    


</body>

<script>

    const btns = [myInfoBtn, saveBtn, postBtn, commentBtn]; //메인 버튼들
    const boxes = [myInfoBox1, myInfoBox2, saveBox, postBox, commentBox]; //메인 버튼의 하위박스들


    //내 정보/저장/게시글/댓글 버튼 클릭 시 click버튼 추가/제거(클릭 시 색 변화됨)
    //탭에 따른 하위박스 변경 
    function mybtnsClick(event) {

        btns.forEach(btn => btn.classList.remove('click'));
        event.target.classList.add('click');

        boxes.forEach(box => box.classList.add('hidden'));
        
        if (event.target == myInfoBtn) {
            myInfoBox1.classList.remove('hidden');
            myInfoBox2.classList.remove('hidden');
            updateNicName.classList.add('myInfo-click');
            updatePassword.classList.remove('myInfo-click');
            nicnameBox.classList.remove('hidden');
            passwordBox.classList.add('hidden');
        } else if (event.target == saveBtn) {
            saveBox.classList.remove('hidden');
        } else if (event.target == postBtn) {
            postBox.classList.remove('hidden');
        } else if (event.target == commentBtn) {
            commentBox.classList.remove('hidden');
        }
    }

    //내 정보 - 닉네임 변경 / 비밀번호 변경 클릭 시 hidden 클래스 추가
    // const updateNicName = document.getElementById('updateNicName');
    // const updatePassword = document.getElementById('updatePassword');
    // const nicnameBox = document.getElementById('nicnameBox');
    // const passwordBox = document.getElementById('passwordBox');

    const updates = [updateNicName,updatePassword]; //내 정보 - 닉네임/비밀번호 변경 버튼
    const updateBoxs = [nicnameBox,passwordBox]; //닉네임,비밀번호 변경 박스 

    function updateClick(event) {
        // updateNicName.classList.remove('myInfo-click');
        // updatePassword.classList.remove('myInfo-click');

        // event.target.classList.add("myInfo-click");

        updates.forEach(update => update.classList.remove('myInfo-click'));
        event.target.classList.add("myInfo-click");

        updateBoxs.forEach(updateBox => updateBox.classList.add('hidden'));

        if(event.target == updateNicName){
            nicnameBox.classList.remove('hidden');
            // passwordBox.classList.add('hidden');
        }else if(event.target == updatePassword){
            passwordBox.classList.remove('hidden');
            // nicnameBox.classList.add('hidden');

        }
    }

    btns.forEach(btn => btn.addEventListener('click',mybtnsClick));
    updates.forEach(update => update.addEventListener('click',updateClick));

    // updateNicName.addEventListener('click',updateClick);
    // updatePassword.addEventListener('click',updateClick);

</script>

</html>