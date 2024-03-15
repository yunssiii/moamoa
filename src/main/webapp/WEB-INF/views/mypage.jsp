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
    <link rel="stylesheet" href="/resources/css/nav.css"/>
    <link rel="stylesheet" href="/resources/css/mypage.css"/>
    <script src="https://unpkg.com/imagesloaded@4/imagesloaded.pkgd.min.js"></script>
    <script src="https://unpkg.com/masonry-layout@4/dist/masonry.pkgd.min.js"></script>
    <!-- jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <title>마이페이지</title>
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

    <div class="mypage-wrap">
        <div class="a-up-box">
            <img src="https://raw.githubusercontent.com/Tarikul-Islam-Anik/Animated-Fluent-Emojis/master/Emojis/Smilies/Growing%20Heart.png" alt="Growing Heart" width="130" height="130" />
            <div class="up-name">${userInfoDTO.user_nickname}</div>
            <div class="up-email">${userInfoDTO.user_email}</div>
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
        <div id="saveBox" class="hidden" style="width: 90%;">
            <div class="grid">
                <div class="grid-sizer"></div>
                <c:if test="${empty likedPostList}">
                    저장한 게시글이 없습니다.
                </c:if>
                <c:if test="${!empty likedPostList}">
                    <c:forEach var="likedPosts" items="${likedPostList}">
                        <div class="grid-item">
                            <img src="/images/${likedPosts.image_savename}"/>
                            <p class="hover-text">${likedPosts.post_title}</p>
                        </div>
                    </c:forEach>
                </c:if>
            </div>
        </div>

        <!-- 게시글 -->
        <div id="postBox" class="hidden" style="width: 80%;background-color: white;padding: 30px;border-radius: 10px;height: 300px;">
           <table>
                <colgroup>
                    <col style="width: 75%;"/>
                    <col style="width: 15%;"/>
                    <col style="width: 10%;"/>
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col">제목</th>
                        <th scope="col">작성일</th>
                        <th scope="col">조회수</th>
                    </tr>
                </thead>
                <!-- 등록된 게시글 없을 때 -->
                <!-- <tbody>
                    <tr>
                        <td colspan="3" class="td-none">등록된 게시글이 없습니다.</td>
                    </tr>
                </tbody> -->
                <tbody>
                    <!-- 반복 -->
                    <c:if test="${empty myPostList}">
                        <tr>
                            <td colspan="3" class="td-none">등록된 게시글이 없습니다.</td>
                        </tr>
                    </c:if>
                    <c:if test="${!empty myPostList}">
                        <c:forEach var="myPosts" items="${myPostList}">
                            <tr>
                                <td class="td-post">
                                    <input type="checkbox" id="post-chk1" name="post-chk" value="${myPosts.post_id}"/>
                                    <label for="post-chk1"></label>
                                    <div>${myPosts.post_title}</div>
                                </td>
                                <td class="td-center">${myPosts.pcreated_date}</td>
                                <td class="td-center">${myPosts.like_count}</td>
                            </tr>
                        </c:forEach>
                    </c:if>
                </tbody>
                <!-- 페이징 -->
                <tfoot>
                    <tr style="border: none;">
                        <td colspan="3">1</td>
                    </tr>
                </tfoot>
           </table>
           <div class="post-bottom">
                <div class="post-bottom-div">
                    <input type="checkbox" id="all-post-chk" name="all-post-chk" value=""/>
                    <label for="all-post-chk"></label>
                    <span>전체선택</span>
                </div>
                <div>
                    <button type="button">삭제</button>
                    <button type="button">글쓰기</button>
                </div>
           </div>
        </div>

        <!-- 댓글 -->
        <div id="commentBox" class="hidden" style="width: 80%;background-color: white;padding: 30px;border-radius: 10px;height: 330px;">
            <table>
                <thead>
                    <tr>
                        <th>댓글</th>
                    </tr>
                </thead>
                <tbody>
                    <!-- 반복 -->
                    <c:if test="${empty myCommentList}">
                        <tr>
                            <td colspan="3" class="td-none">등록된 댓글이 없습니다.</td>
                        </tr>
                    </c:if>
                    <c:if test="${!empty myCommentList}">
                        <c:forEach var="myComments" items="${myCommentList}">
                            <tr>
                                <td class="comment-td">
                                    <div>
                                        <input type="checkbox" id="comment-chk1" name="comment-chk" value="${myComments.comment_id}"/>
                                        <label for="comment-chk1"></label>
                                    </div>
                                    <a href="#" class="comment-href">
                                        <div>${myComments.comment_content}</div>
                                        <div class="comment-date">${myComments.ccreated_date}</div>
                                        <div class="comment-title">
                                            ${myComments.post_title}
                                            <!-- <span>[1]</span> -->
                                        </div>
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </c:if>
                </tbody>
                <tfoot>
                    <tr style="border: none;">
                        <td colspan="3">1</td>
                    </tr>
                </tfoot>
            </table>
            <div class="post-bottom">
                <div class="post-bottom-div">
                    <input type="checkbox" id="all-comment-chk" name="all-comment-chk" value=""/>
                    <label for="all-comment-chk"></label>
                    <span>전체선택</span>
                </div>
                <div>
                    <button type="button">삭제</button>
                    <button type="button">글쓰기</button>
                </div>
           </div>
        </div>

    </div>
    


</body>

<script>



    const btns = [myInfoBtn, saveBtn, postBtn, commentBtn]; //메인 버튼들
    const boxes = [myInfoBox1, myInfoBox2, saveBox, postBox, commentBox]; //메인 버튼의 하위박스들
    const updates = [updateNicName,updatePassword]; //내 정보 - 닉네임/비밀번호 변경 버튼
    const updateBoxs = [nicnameBox,passwordBox]; //닉네임,비밀번호 변경 박스 

    //게시글 체크박스들
    const postChk = document.getElementsByName("post-chk");
    const postAllChk = document.getElementsByName("all-post-chk");
    //댓글 체크박스들
    const commentChk = document.getElementsByName("comment-chk");
    const commentAllChk = document.getElementsByName("all-comment-chk");

    //내 정보/저장/게시글/댓글 버튼 클릭 시 click버튼 추가/제거(클릭 시 색 변화됨)
    //탭에 따른 하위박스 변경 
    function mybtnsClick(event) {

        // console.log('메인버튼 클릭됨>>>>>>>>>'+event.target.innerText);

        btns.forEach(btn => btn.classList.remove('click'));
        event.target.classList.add('click');

        boxes.forEach(box => box.classList.add('hidden'));

        //masonry 레이아웃 사용
        var msnry = new Masonry( '.grid', {  
            itemSelector: '.grid-item',    
            columnWidth: '.grid-sizer',  
            percentPosition: true,  
            gutter : 23,
        });

        //masonry 레이아웃 - 이미지 겹침 방지 script
        imagesLoaded( '.grid' ).on( 'progress', function() {
            msnry.layout();
        });
        
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

            // 체크박스 모두 false로
            //getElementsByName는 유사배열객체로 checked 속성을 사용하기 위해 반복문이 필요하다.
            for (let i = 0; i < commentChk.length; i++) {
                commentChk[i].checked = false;
            }

            for (let i = 0; i < commentAllChk.length; i++) {
                commentAllChk[i].checked = false;
            }
        } else if (event.target == commentBtn) {
            commentBox.classList.remove('hidden');
        }
    }

    //내 정보 - 닉네임 변경 / 비밀번호 변경 클릭 시 hidden 클래스 추가
    function updateClick(event) {

        updates.forEach(update => update.classList.remove('myInfo-click'));
        event.target.classList.add("myInfo-click");

        updateBoxs.forEach(updateBox => updateBox.classList.add('hidden'));

        if(event.target == updateNicName){
            nicnameBox.classList.remove('hidden');
        }else if(event.target == updatePassword){
            passwordBox.classList.remove('hidden');
        }
    }

    btns.forEach(btn => btn.addEventListener('click',mybtnsClick));
    updates.forEach(update => update.addEventListener('click',updateClick));

</script>

<!-- 체크박스 js -->
<script>
    
    // 게시글 체크박스 
    $(document).ready(function(){

        //전체 선택 시
        $("#all-post-chk").click(function(){
            if($("#all-post-chk").is(":checked")){
                $("input[name=post-chk]").prop("checked",true);
            }else {
                $("input[name=post-chk]").prop("checked",false);
            }
        });

        //개별 선택 시
        //전체의 수와 선택된 박스의 수를 비교
        $("input[name=post-chk]").click(function(){

            var total = $("input[name=post-chk]").length;
            var checked = $("input[name=post-chk]:checked").length;

            if(total != checked){
                $("#all-post-chk").prop("checked",false);
            }else {
                $("#all-post-chk").prop("checked",true);
            }
        });

    });

    // 댓글 체크박스 
    $(document).ready(function(){

        //전체 선택 시
        $("#all-comment-chk").click(function(){
            if($("#all-comment-chk").is(":checked")){
                $("input[name=comment-chk]").prop("checked",true);
            }else {
                $("input[name=comment-chk]").prop("checked",false);
            }
        });

        //개별 선택 시
        //전체의 수와 선택된 박스의 수를 비교
        $("input[name=comment-chk]").click(function(){

            var total = $("input[name=comment-chk]").length;
            var checked = $("input[name=comment-chk]:checked").length;

            if(total != checked){
                $("#all-comment-chk").prop("checked",false);
            }else {
                $("#all-comment-chk").prop("checked",true);
            }
        });

    });
</script>


</html>