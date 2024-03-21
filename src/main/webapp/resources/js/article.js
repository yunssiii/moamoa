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
        fetch('/comment', {
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

//본댓글창 내용 입력 시에 [입력] 버튼 활성화
function activeCommentBtn(){

    const commentValue = document.getElementById("c-input").value;
    const submitComment = document.getElementById("submit-comment");

    if(commentValue == ""){
        submitComment.classList.add("hidden");
    }else {
        submitComment.classList.remove("hidden");
    }

}

//[답글 쓰기] 버튼 클릭 시 대댓 input 생성
//닉네임..받아서 뿌려줘야하는데..

// var replySection = document.getElementsByName("reply");
//
// replySection.forEach(e => {
//     e.addEventListener('click', ()=>{
//         const replySection = document.getElementById("reply-section");
//
//         // 답글 작성란 보이기
//         replySection.style.display = "flex";
//     });
// });

// 대댓창 보이기
function removeReplySection() {
    const replySectionId = document.getElementById("reply-section");
    if (replySectionId) {
        replySectionId.parentNode.removeChild(replySectionId);
    }
}

function replyInput(nickname, refStep, commentId, postId){

    const replySectionId = document.getElementById("reply-section");
    let commnetId = document.getElementById("commnet"+commentId);
    let replyId = document.getElementById("reply"+commentId);

    if (replySectionId && refStep==0){
        commnetId.removeChild(replySectionId);
    }else if (replySectionId && refStep==1){
        replyId.removeChild(replySectionId);
    }

    // reply-section 요소 생성
    const replySection = document.createElement("div");
    replySection.setAttribute("id", "reply-section");
    replySection.classList.add("comment-input-box2", "flex");

    //내부 html 요소 생성
    replySection.innerHTML = `
        <div contenteditable="true" type="text" id="reply-input" class="comment-input2">
            <button type="button" class="replyNickname" contenteditable="false">@` + nickname + `&nbsp;</button>
        </div>
    <input type="button" class="comment-input-btn2" value="입력" onclick="submitReply(`+ postId +`)">
    `;

    //본댓글일 때
    if (!replySectionId && refStep==0){
        // 문서에 생성된 요소를 추가

        commnetId.appendChild(replySection);
    }else if(!replySectionId && refStep==1){

        replyId.appendChild(replySection);
    }

}



// function replyInput(nickname, refNo){
//     const replySection = document.getElementById("reply-section");
//
//
//
//     // 답글 작성란 보이기
//     replySection.style.display = "flex";
// }

// 본댓글 insert
function submitComment(postId){

    let inputElement = document.getElementById("c-input"); //본댓 입력창의 값

    console.log("postID..."+postId)
    console.log("본댓내용..." + inputElement.value)

    fetch('/comment', {
        method: 'POST',
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            post_id: postId,
            commentYN: "y",
            comment_content: inputElement.value
        })
    })
        .then(response => response.json())
        .then(data => {
            console.log("result : " + data.result);
            inputElement.value = "";
            alert("본댓글이 입력되었습니다.");

            if(data.commentList){
                console.log("잘 조회되니...??" + data.message);

            }
        })
        .catch(error => {
            console.error('Error:', error);
        });
}

//대댓글 insert
function submitReply(postId){

    let inputReplyElement = document.getElementById("c-input"); //본댓 입력창의 값
    let replyContent

    console.log("postID..."+postId)
    console.log("대댓내용..." + inputReplyElement.value)

    fetch('/comment', {
        method: 'POST',
        headers: {
            "Content-Type": "application/json",
        },
        body: JSON.stringify({
            post_id: postId,
            commentYN: "n",
            comment_content: inputReplyElement.value
        })
    })
        .then(response => response.json())
        .then(data => {
            console.log("result : " + data.result);
            inputReplyElement.value = "";
            alert("대댓글이 입력되었습니다.");
        })
        .catch(error => {
            console.error('Error:', error);
        });
}











