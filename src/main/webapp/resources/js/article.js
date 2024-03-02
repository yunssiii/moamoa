//저장 버튼 클릭 시 내부 검정 - 하양 바꾸기 js
function saveBtnClicked() {
    var saveBtn = document.getElementById("saveBtn");

    if(!saveBtn.classList.contains("saveclicked")){//saveclicked 라는 클래스가 없으면
        saveBtn.classList.add("saveclicked"); //추가
    }else { //있으면
        saveBtn.classList.remove("saveclicked"); //제거
    }
}

//게시글 삭제
// function deletePost(postId){
//
//     f = document.deleteFrom;
//
//     f.action = "/delete?id=" + postId;
//     f.submit();
//
// }
