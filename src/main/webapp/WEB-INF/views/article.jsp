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
    <link rel="stylesheet" href="resources/css/nav.css"/>
    <link rel="stylesheet" href="resources/css/article.css"/>
    <!-- 폰트 -->
    <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet"/>
    <title>글페이지</title>
    <style>
        .material-symbols-outlined {
          font-variation-settings:
          'FILL' 0,
          'wght' 400,
          'GRAD' 0,
          'opsz' 24;
          font-size: 25pt;
        }

        .material-symbols-outlined:hover{
            cursor: pointer;
        }
    </style>
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

    <div class="article-wrap flex">
        <div class="article-image">
            <img src="/images/${postDTO.image_savename}"/>
        </div>
        <div class="article-content">
            <div class="content-up-1 flex">
                <div>
                    <div style="font-size: 15pt;margin-bottom: 10px;">${postDTO.user_nickname}</div>
                    <div style="font-size: 10pt;">${postDTO.pcreated_date}</div>
                </div>
                <div class="content-up-2 flex">
                    <span class="material-symbols-outlined">
                        download
                    </span>
                    <button class="content-save-btn" type="button">저장</button>
                </div>
            </div>

            <div class="content-scroll-box">
                <div class="content-middle">
                    <div class="content-title">${postDTO.post_title}</div>
                    <div class="content-text">${postDTO.post_content}</div>
                    <div>
                        <c:forEach var="hashtags" items="${hashtagList}">
                            <button class="content-tag" type="button">${hashtags.tag_name}</button>
                        </c:forEach>
                    </div>
                </div>
                <hr/>
                <div class="content-down">
                    <div class="flex" style="margin-bottom: 10px;align-items: center;">
                        <div style="font-size: 15pt;">댓글</div>
                        <div>&nbsp;&nbsp;1개</div>
                    </div>
                    <div class="flex">
                        <div class="down-2">
                            <div class="comment-name">enzi_i</div>
                            <div class="comment-text">와 정말 멋져요!!</div>
                            <div class="down-3 flex">
                                <div class="comment-date">1일</div>
                                <button class="comment-addBtn" type="button">답글 쓰기</button>
                            </div>
                        </div>
                        <!-- 내 댓글일 때만 수정/삭제 visible -->
                        <div class="down-4">
                            <button class="comment-user-btn" type="button">수정</button>
                            |
                            <button class="comment-user-btn" type="button">삭제</button>
                        </div>
                    </div>
                </div>
            </div>
            <!-- 클릭 시 흰색으로 바꾸기 - js -->
            <div class="comment-box flex">
                <input type="text" class="comment-input" placeholder="댓글을 남겨보세요."/>
                <span class="material-symbols-outlined">
                    send
                </span>
            </div>
        </div>
    </div>
    


</body>
</html>