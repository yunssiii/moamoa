<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8"%>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
    <!-- css -->
    <link rel="stylesheet" href="/resources/css/nav.css"/>
    <link rel="stylesheet" href="/resources/css/account.css"/>
    <title>계정페이지</title>
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
            <div class="up-name">${otherInfoDTO.user_nickname}</div>
            <div class="up-email">${otherInfoDTO.user_email}</div>
        </div>
        <hr/>
        <div class="a-down-box">
            <c:if test="${empty otherPostList}">
                <div class="noPost">작성한 게시글이 없습니다.</div>
            </c:if>
            <c:if test="${!empty otherPostList}">
                <div class="grid">
                    <c:forEach var="otherPosts" items="${otherPostList}">
                        <div class="grid-item">
                            <img src="/images/${otherPosts.image_savename}"/>
                            <p class="hover-text">${otherPosts.post_title}</p>
                        </div>
                    </c:forEach>
                </div>
            </c:if>
        </div>
    </div>
    


</body>
</html>