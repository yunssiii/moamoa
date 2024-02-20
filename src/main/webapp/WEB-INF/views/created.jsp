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
                    <input type="file" id="file" onchange="readURL(this)">
                </div>
            </div>
            <div class="right-box">
                <div class="created-titles">제목</div>
                <input class="created-inputs" type="text" placeholder="제목을 입력하세요."/>
                <div class="created-titles">내용</div>
                <textarea class="created-content" placeholder="내용을 입력하세요."></textarea>
                <!-- 태그 등록 시 바로 밑에 보이기 -->
                <label for="tags" class="created-titles flex">해시태그</label>
                <input id="tags" class="created-inputs" type="text" placeholder="Enter로 추가해보세요."/>
                <div id="tag-box">
                    <!-- <div>
                        <span class="tag">#크리스마스&nbsp;</span>
                        <button class="tag-xBtn">
                            x
                        </button>
                    </div> -->
                </div>
                <div class="flex btn-box">
                    <button class="upload-btn" type="button">등록</button>
                </div>
                
            </div>
        </div>
            
       
    </div>

    


</body>

<script>
    // 파일 선택 시 첨부파일input칸에 채우는 js
    $('#file').on('change',function(){
        var fileName = $('#file').val();
        $(".upload-name").val(fileName);
    });

    //파일 첨부 시 미리보기 js
    var previewElement = document.getElementById('preview');
    var imageBox = document.getElementsByClassName('image-text-box')[0];
    var imageText = document.getElementsByClassName('image-text')[0];

    function readURL(input) {
        if (input.files && input.files[0]) {

            var reader = new FileReader();

            //파일 첨부 읽으면
            reader.onload = function(e) {
                //target의 결과 src에 담기
                previewElement.src = e.target.result;
                //이미지 크기 등 css
                previewElement.style.width = '400px';
                previewElement.style.height = '450px';
                previewElement.style.borderRadius = '20px';
                imageBox.style.border = 'none';
                //'이미지를 선택하세요' 텍스트 지우기
                imageText.classList.add('hidden');
            };
            reader.readAsDataURL(input.files[0]);
        } else {
            document.getElementById('preview').src = "";
        }
    }

    //해시태그 추가 js
    const tagsInput = document.getElementById('tags');
    const tagBox = document.getElementById('tag-box');

    let hashtags = [];

    function addTags(tag){
        tag = tag.replace(/[\[\]]/g,'').trim(); //[]와 양쪽 공백 제거

        //입력된 값이 있고 이미 추가된 태그가 아닐 때! 
        if(tag && !hashtags.includes(tag)){

            const div = document.createElement('div'); //div태그 생성
            div.classList.add('aa');

            const span = document.createElement('span'); //span태그 생성
            span.innerText = '#' + tag + ' ';
            span.classList.add('tag');

            //추가한 태그 삭제 이벤트
            const xBtn = document.createElement("button"); //button태그 생성
            xBtn.innerText = 'x ';
            xBtn.classList.add('tag-xBtn');

            tagBox.appendChild(div);
            div.appendChild(span);
            div.appendChild(xBtn);
            hashtags.push(tag);

            console.log(hashtags);

            //x버튼 클릭 시 이벤트
            xBtn.addEventListener('click',()=>{
                tagBox.removeChild(div);
                hashtags = hashtags.filter((hashtag) => hashtag !== tag); //중복 검사 후 중복 시 저장하지 않음 
            })
        }
    }

    tagsInput.addEventListener('keydown', (event) => {

        //엔터가 입력되면
        if(event.key === 'Enter'){

            event.preventDefault();
            const tag = tagsInput.value.trim();
            if(tag){
                addTags(tag); //추가함수 호출
                tagsInput.value = '';
            }
        }
    });


</script>

</html>