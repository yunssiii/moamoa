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
    <link rel="stylesheet" href="/resources/css/main.css"/>
    <!-- 폰트 -->
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet"/>
    <script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>
    <script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
    <title>메인페이지</title>
</head>
<body>

    <nav class="navigator">
        <div class="nav-logo">Moa Picture</div>
        <div class="search-box">
            <span class="material-symbols-outlined">
                search
            </span>
            <c:if test="${empty tagName}">
                <input type="text" class="nav-search-input" placeholder="원하는 태그를 입력해보세요."/>
            </c:if>
            <c:if test="${!empty tagName}">
                <input type="text" class="nav-search-input" value="${tagName}" placeholder="원하는 태그를 입력해보세요."/>
            </c:if>
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

    <diV class="main-wrap">
        <div class="grid">
            <div class="grid-sizer"></div>
            <c:if test="${empty tagName}">
                <!-- main으로 바로 접속 -->
                <div class="grid-item">
                    <img src="resources/images/logPicture2.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="resources/images/logPicture3.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="resources/images/logPicture4.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="resources/images/logPicture5.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="resources/images/logPicture6.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="resources/images/logPicture7.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="resources/images/logPicture8.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="resources/images/logPicture9.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="resources/images/logPicture10.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="resources/images/logPicture11.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="resources/images/logPicture12.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="resources/images/logPicture13.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="resources/images/logPicture14.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="resources/images/logPicture1.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="resources/images/logPicture16.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="resources/images/logPicture17.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="resources/images/logPicture18.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="resources/images/logPicture19.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="resources/images/logPicture20.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="resources/images/logPicture21.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="resources/images/logPicture22.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="resources/images/logPicture23.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
                <div class="grid-item">
                    <img src="resources/images/logPicture24.jpeg"/>
                    <p class="hover-text">라디오 이미지</p>
                </div>
            </c:if>
            <c:if test="${empty hashtagList}">
                <!-- 그 태그가 없을 때 -->
                <div>검색 결과가 없습니다.</div>
            </c:if>
            <c:if test="${!empty tagName}">
                <!-- 태그 클릭 시 -->
                <c:forEach var="posts" items="${postList}">
                    <div class="grid-item">
                        <img src="/images/${posts.image_savename}"/>
                        <p class="hover-text">${posts.post_title}</p>
                    </div>
                </c:forEach>
            </c:if>


        </div>
    </diV>
    
    <script>
        var msnry = new Masonry( '.grid', {  
            itemSelector: '.grid-item',    
            columnWidth: '.grid-sizer',  
            percentPosition: true,  
            gutter : 23,
        });

        //이미지 겹침 방지 script
        imagesLoaded( '.grid' ).on( 'progress', function() {
            msnry.layout();
        });
        
    </script>

</body>
</html>