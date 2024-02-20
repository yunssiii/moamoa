package com.project.moapicture.dto;

import lombok.Data;

@Data
public class PostDTO {

    private int post_id;
    private String user_email;
    private String post_title;
    private String post_content;
    private String user_nickname;
    private String pcreated_date;
    private String pupdated_date;
    private int hitcount;
    private int like_count;

}
