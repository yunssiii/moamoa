// 파일 선택 시 첨부파일input칸에 이미지명 채우는 js
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

var hashtags = [];

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

        //해시태그의 x버튼 클릭 시 이벤트
        xBtn.addEventListener('click',()=>{
            tagBox.removeChild(div);
            hashtags = hashtags.filter((hashtag) => hashtag !== tag); //중복 검사 후 중복 시 저장하지 않음
        })
    }
}

//해시태그 input에서 엔터 입력 시 해시태그div 생성하는 js
//해시태그에 특수문자 포함되지 않도록 함
tagsInput.addEventListener('keydown', (event) => {

    var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-+┼<>@\#$%&\'\"\\\(\=]/gi; //특수문자 검사 정규식

    //엔터가 입력되면
    if(event.key === 'Enter'){

        event.preventDefault();

        if (regExp.test(tagsInput.value)){ //검사
            alert('해시태그에는 문자, 숫자, 밑줄(_)만 입력할 수 있습니다.');
            tagsInput.value = '';
        }else {
            const tag = tagsInput.value.trim();
            if(tag){
                addTags(tag); //추가함수 호출
                tagsInput.value = '';
            }
        }
    }
});


// 업로드할 파일 정보 불러오기
let imageData;
$(document).on("change", "input[name='image']", function() {
    // 파일 입력 필드에서 선택된 파일의 데이터를 가져와서 변수에 저장
    imageData = this.files[0];
    console.log("imageData는?>>>>>>>>> ", imageData);
});

const title = document.getElementById('title');
const content = document.getElementById('postcontent');

var formData = new FormData();

//-- 글 등록할 때 보내기 ---------------------------------------------------------
function createdIt(postId){

    if(!title.value){
        alert("제목을 입력해주세요.");
        title.focus();
        return;
    }

    if(!content.value){
        alert("내용을 입력해주세요.");
        content.focus();
        return;
    }

    if(!imageData){
        alert("이미지를 선택해주세요.");
        return;
    }

    // 텍스트 데이터와 파일 데이터를 FormData에 추가
    formData.append('title', title.value);
    formData.append('content', content.value);
    formData.append('image', imageData);
    //해시태그 배열을 formdata에 추가하기
    if (hashtags.length == 0){ //해시태그가 없는 경우
        formData.append('hashtags', ''); //공백으로 보내기
    }else {
        hashtags.forEach(tag => {
            formData.append('hashtags', tag);
        });
    }

    // console.log('title>>>>>>>>>'+title.value);
    // console.log('content>>>>>>>>>'+content.value);
    // console.log('imageData>>>>>>>>>'+imageData);
    // console.log('hashtags[]>>>>>>>>>'+hashtags);

    console.log("postId >>>" + postId);

    //postId가 없으면 글 등록 ajax
    if (postId == null){

        console.log("왓ㄴ;??")


        formData.append('id',"0");

        fetch('/created', {
            method: 'POST',
            body: formData
        })
            .then(response => response.json())
            .then(data => {
                console.log('postId: ', data.postId);
                return window.location.href = '/article?id=' + data.postId;
            })
            .catch(error => {
                console.error('Error:', error);
            });

    }else { //postId가 있으면 수정 ajax

        console.log("여기로 왓니?")

        fetch('/created?id='+postId, {
            method: 'POST',
            body: formData
        })
            .then(response => response.json())
            .then(data => {
                console.log('postId: ', data.postId);
                return window.location.href = '/article?id=' + data.postId;
            })
            .catch(error => {
                console.error('Error:', error);
            });

    }



    // .then(response => {
    //         if (response.ok) {
    //             alert("굿>>" + response);
    //             return window.location.href = '/article';
    //         }
    //         throw new Error('Network response was not ok.');
    //     })
    //     .then(data => {
    //         console.log('Server response:', data);
    //     })
    //     .catch(error => {
    //         console.error('Error sending data to server:', error);
    //     });

}