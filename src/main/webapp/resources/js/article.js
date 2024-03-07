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



