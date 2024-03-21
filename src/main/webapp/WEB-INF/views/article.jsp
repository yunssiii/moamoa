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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Rounded:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
          font-size: 20pt;
        }

        .material-symbols-outlined:hover{
            cursor: pointer;
        }

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

        .saveclicked {
            font-variation-settings:
            'FILL' 1,
            'wght' 400,
            'GRAD' 0,
            'opsz' 24;
            font-size: 20pt;
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

    <div class="article-wrap flex">
        <div class="article-image-area">
            <img src="/images/${postDTO.image_savename}"/>
        </div>
        <div class="article-content-area">
            <div class="content-up-area flex">
                <div class="account-box1 flex">
                    <img class="a-account_image" src="/images/${postDTO.image_savename}" onclick="location.href='profile/' + '${postDTO.user_nickname}'"/>
                    <div style="margin-left: 10px;">
                        <input type="button" value="${postDTO.user_nickname}" class="a-account-btn" onclick="location.href='profile/' + '${postDTO.user_nickname}'">
                        <div style="font-size: 8pt;">${postDTO.pcreated_date}</div>
                    </div>
                </div>
                <div class="account-box2 flex">
                    <c:if test="${email eq postDTO.user_email}">
                        <input type="button" value="수정" class="a-update-btn" onclick="location.href='updated?id=' + '${postDTO.post_id}'">
                        <input type="button" value="삭제" class="a-update-btn a-delete-btn" onclick="location.href='delete?id=' + '${postDTO.post_id}'">
                    </c:if>
                    <span class="material-symbols-outlined">
                        download
                    </span>

                    <button class="a-save-btn" type="button" >
                            <!-- 로그인한 사용자가 좋아요를 한 게시글일 경우 -->
                            <c:if test="${isLike}">
                                <span class="material-symbols-outlined saveclicked" id="saveBtn" onclick="saveBtnClicked(${postDTO.post_id})">
                                    bookmark
                                </span>
                            </c:if>
                            <!-- 로그인한 사용자가 좋아요를 안한 게시글일 경우 -->
                            <c:if test="${not isLike}">
                                <span class="material-symbols-outlined" id="saveBtn" onclick="saveBtnClicked(${postDTO.post_id})">
                                    bookmark
                                </span>
                            </c:if>
                    </button>
                </div>
            </div>

            <div class="content-down-area">
                <div class="content-box">
                    <div class="content-text">${postDTO.post_content}</div>
                    <div>
                        <c:forEach var="hashtags" items="${hashtagList}">
                            <input class="content-tag" type="button" value="#${hashtags.tag_name}" onclick="location.href='logpicture/' + '${hashtags.tag_name}'">
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 댓글부분 -->
    <div class="comment-area">
        <div class="c-content-box flex" style="margin-bottom: 10px;align-items: center;">
            <div class="flex" style="align-items: center">
                <div style="font-size: 15pt;">댓글&nbsp;</div>
                <div>1</div>
            </div>
        </div>

        <!-- 본댓글입력 부분 -->
        <div id="commentbox-div" class="comment-input-box flex">
            <input type="text" id="c-input" class="comment-input" placeholder="댓글을 남겨보세요." onkeyup="activeCommentBtn()"/>
            <input type="button" id="submit-comment" class="comment-input-btn hidden" value="입력" onclick="submitComment(${postDTO.post_id})"/>
        </div>

        <!-- 댓글 조회 부분 -->
        <div style="height: 300px;overflow: auto">
            <c:forEach var="commentlist" items="${commentList}">
                <!-- 본댓글 조회 -->
                <c:if test="${commentlist.ref_step == 0}">
                    <div id="commnet${commentlist.comment_id}">
                        <div  class="flex" style="margin: 25px 5px;">
                            <div class="comment-content-box1">
                                <div class="c-content-name">${commentlist.user_nickname}랑 ${commentlist.ref_no}</div>
                                <div class="c-content-text">${commentlist.comment_content}</div>
                                <div class="comment-content-box2 flex">
                                    <div class="c-content-date">${commentlist.ccreated_date}</div>
                                    <!-- addInputComment()에 해당 댓글 닉네임 매개변수로 넘기기 -->
                                    <button class="c-content-btn" name="reply" type="button" onclick="replyInput('${commentlist.user_nickname}', ${commentlist.ref_step}, ${commentlist.comment_id}, ${commentlist.post_id})">답글 쓰기</button>
                                    <!-- 내 댓글일 때만 수정/삭제 visible -->
                                    <button class="c-content-btn" type="button">수정</button>
                                    <button class="c-content-btn" type="button">삭제</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </c:if>

                <!-- 대댓글 조회 -->
                <!-- commentlist.ref_step > 0 -->
                <c:forEach var="replylist" items="${replyList}">
                    <c:if test="${commentlist.ref_no eq replylist.ref_no}">
                        <div id="reply${replylist.comment_id}">
                            <div class="ref flex" style="margin: 25px 5px 10px 50px;">
                                <div class="comment-content-box1">
                                    <div class="c-content-name">${replylist.user_nickname}랑 ${replylist.ref_no}</div>
                                    <div class="c-content-text">${replylist.comment_content}</div>
                                    <div class="comment-content-box2 flex">
                                        <div class="c-content-date">${replylist.ccreated_date}</div>
                                        <button class="c-content-btn" name="reply" type="button" onclick="replyInput('${replylist.user_nickname}', ${replylist.ref_step}, ${replylist.comment_id}, ${replylist.post_id})">답글 쓰기</button>
                                        <!-- 내 댓글일 때만 수정/삭제 visible -->
                                        <button class="c-content-btn" type="button">수정</button>
                                        <button class="c-content-btn" type="button">삭제</button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </c:if>
                </c:forEach>
            </c:forEach>
        </div>


        <!-- 대댓글입력 부분 -->
<%--        <div id="reply-section" class="comment-input-box2 flex hidden">--%>
<%--            <!-- value에 @ + 닉네임해주기 -->--%>
<%--            <div contenteditable="true" type="text" id="reply-input" class="comment-input2">--%>
<%--                <button type="button" class="replyNickname" contenteditable="false">@닉네임&nbsp;</button>--%>
<%--            </div>--%>
<%--            <input type="button" class="comment-input-btn2" value="입력" onclick="submitReply(${postDTO.post_id})">--%>
<%--        </div>--%>
    </div>
    


</body>

<script type="text/javascript" src="resources/js/article.js"></script>

</html>