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
    <link rel="stylesheet" href="resources/css/created.css"/>
    <!-- 폰트 -->
    <!-- <link href="https://hangeul.pstatic.net/hangeul_static/css/nanum-square.css" rel="stylesheet"> -->
    <!-- jquery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>


    <title>글등록페이지</title>
</head>
<body>

    <nav class="navigator">
        <div class="nav-logo">Moa Picture</div>
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

<%--    <form action="" method="post" name="insertform" enctype="multipart/form-data">--%>

    <div class="created-wrap">
        <div class="flex">
            <div class="left-box">
                <div class="image-text-box">
                    <div>
                        <img id="preview"/>
                    </div>
                    <div class="image-text">
                        <p>이미지를 선택하세요.</p>
                    </div>
                </div>
                <div class="filebox">
                    <input class="upload-name" value="첨부파일" placeholder="첨부파일" disabled>
                    <label for="file">파일찾기</label>
                    <%-- accept="image/*"은 올릴 수 있는 파일 유형을 이미지로 제한하는 것 --%>
                    <input type="file" id="file" name="image" accept="image/*" onchange="readURL(this)">
                </div>
            </div>
            <div class="right-box">
                <div class="created-titles">제목</div>
                <input class="created-inputs" type="text" id="title" name="title" placeholder="제목을 입력하세요." value="${postDTO.post_title}"/>
                <div class="created-titles">내용</div>
                <textarea class="created-content" id="postcontent" name="postcontent" placeholder="내용을 입력하세요.">${postDTO.post_content}</textarea>
                <!-- 태그 등록 시 바로 밑에 보이기 -->
                <label for="tags" class="created-titles flex">해시태그</label>
                <input id="tags" class="created-inputs" name="hashtag" type="text" placeholder="Enter로 추가해보세요."/>
                <div id="tag-box">
                    <!-- 태그 추가될 자리 -->
                </div>
                <div class="flex btn-box">
                    <c:if test="${postId eq null}">
                        <button class="upload-btn" type="button" onclick="createdIt(${postId})">등록</button>
                    </c:if>
                    <c:if test="${postId ne null}">
                        <button class="upload-btn" type="button" onclick="createdIt(${postId})">수정</button>
                    </c:if>
                </div>
                
            </div>
        </div>
    </div>

<%--    </form>--%>

    


</body>

<script>



    //var postId = ${postId};



    // -- 서버로 데이터 보내기 --

    //FormData 객체 생성



    // Fetch API를 사용하여 서버로 데이터 전송



    //서버로 데이터 보내기
    <%--function check(){--%>
    <%--    f = document.insertform;--%>

    <%--    str = f.title.value;--%>
    <%--    str = str.trim();--%>
    <%--    if(!str){--%>
    <%--        alert("제목을 입력해주세요.");--%>
    <%--        f.title.focus();--%>
    <%--        return;--%>
    <%--    }--%>
    <%--    f.title.value = str;--%>

    <%--    str = f.postcontent.value;--%>
    <%--    str = str.trim();--%>
    <%--    if(!str){--%>
    <%--        alert("내용을 입력해주세요.");--%>
    <%--        f.postcontent.focus();--%>
    <%--        return;--%>
    <%--    }--%>
    <%--    f.postcontent.value = str;--%>

    <%--    // 파일 선택 여부 확인--%>
    <%--    if (!fileData) {--%>
    <%--        alert("이미지를 선택해주세요.");--%>
    <%--        return;--%>
    <%--    }--%>

    <%--    //파일의 정보를 보냄--%>
    <%--    let formData = new FormData(f);--%>
    <%--    formData.append('image', fileData); // 'image'는 필드 이름, 'fileData'은 파일 데이터--%>

    <%--    &lt;%&ndash;f.action = "<%=cp%>/created";&ndash;%&gt;--%>
    <%--    &lt;%&ndash;f.submit();&ndash;%&gt;--%>

    <%--}--%>

</script>

<script type="text/javascript" src="resources/js/created.js"></script>

</html>