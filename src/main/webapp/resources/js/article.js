//저장 버튼 클릭 시 내부 검정 - 하양 바꾸기 js
//like 테이블 insert 관리
function saveBtnClicked(postId) {
    var saveBtn = document.getElementById("saveBtn");

    if(!saveBtn.classList.contains("saveclicked")){//saveclicked 라는 클래스가 없으면
        saveBtn.classList.add("saveclicked"); //추가

        //like 테이블 insert되도록 서버로 보내기
        fetch('/article', {
            method: 'POST',
            headers: {
                "Content-Type": "application/json",
            },
            body:JSON.stringify({
                post_id: postId,
                saveYN: "y"
            })
        })
            .then(response => response.json())
            .then(data => {
                console.log("result : " + data.result);
                alert("저장되었습니다.");
            })
            .catch(error => {
                console.error('Error:', error);
            });

    }else { //있으면

        console.log("postId 머니? >>" + postId);

        saveBtn.classList.remove("saveclicked"); //제거

        //like 테이블 delete되도록 서버로 보내기
        fetch('/article', {
            method: 'POST',
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                post_id: postId,
                saveYN: "n"
            })
        })
            .then(response => response.json())
            .then(data => {
                console.log("result : " + data.result);
                alert("저장이 해제되었습니다.");
            })
            .catch(error => {
                console.error('Error:', error);
            });
    }
}

//댓글창 내용 입력 시에 [입력] 버튼 활성화

let isButtonCreated = false;
let inputButton;

function activeCommentBtn(){
    const commentDiv = document.getElementById("commentbox-div");
    const commentValue = document.getElementById("c-input").value; // value()가 아닌 value로 변경

    console.log(isButtonCreated);

    if (commentValue.trim() !== "" && !isButtonCreated) { // commentValue가 비어 있지 않은지 확인
        // commentValue가 있으면 commentDiv 아래에 <input type="button" class="comment-input-btn" value="입력"> 추가하기
        inputButton = document.createElement("input");
        inputButton.setAttribute("type", "button");
        inputButton.setAttribute("class", "comment-input-btn");
        inputButton.setAttribute("value", "입력");
        commentDiv.appendChild(inputButton);

        isButtonCreated = true; // 버튼이 생성되었음을 나타내는 변수를 true로 설정합니다.
    }else if(commentValue == "" && isButtonCreated){
        commentDiv.removeChild(inputButton);

        isButtonCreated = false;
    }
}

//대댓 input 추가
//[답글 쓰기] 버튼 클릭 시 대댓 input 생성


function clickReplyBtn() {
    const replySection = document.getElementById("reply-section");
    // const replyInput = document.getElementById("reply-input");
    //const contentSpan = document.getElementById("span");

    // const nickname = document.getElementById("nickname");
    // const span = document.getElementById("span");
    //
    // const content = nickname.innerText.replace("", ""); // @닉네임 부분은 제외하고 가져오기
    //
    // // span 요소에 내용 설정
    // span.innerText = content;


    // 답글 input 태그에 @윤하 추가하기
    // replyInput.value = "@enzi_i ";
    //
    // // @윤하 글자 파랑색으로 변경하기
    // replyInput.style.color = "blue";
    //
    // const nicknameSpan = document.createElement("span"); //닉네임 담을 span
    // // nicknameSpan.style.color = "blue" // 색 파랑으로
    //
    // const beforeSpan = replyInput.value; //매개변수로 넘어온 이름 "@" + 닉네임 + " "
    // const afterSpan = replyText.substring(beforeSpan.length); // 닉네임 이후의 내용
    // nicknameSpan.innerHTML = `${beforeSpan}<span style="color: black;">${afterSpan}</span>`;

    // 답글 작성란 보이기
    replySection.style.display = "flex";
}






