package com.project.moapicture.dto;

import lombok.Data;

@Data
public class CommentsDTO {

    private int comment_id;
    private int post_id;
    private String user_email;
    private String comment_content;
    private String user_nickname;
    private String ccreated_date;
    private String cupdated_date;
    private int ref_no;
    private int ref_step;

    //mypage select할 때 post와 jain해서 추가
    private String post_title;

    //본댓 대댓 구분
    private String commentYN;
}
