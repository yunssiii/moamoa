package com.project.moapicture.dto;

import lombok.Data;

@Data
public class HashtagDTO {

    private int tag_id;
    private String tag_name;

    //postId select할 때 join한 컬럼
    private int post_id;

}
