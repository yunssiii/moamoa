package com.project.moapicture.dto;

import lombok.Data;

@Data
public class LikeDTO {

    private int like_id;
    private String user_email;
    private int post_id;
    private String like_date;

}
