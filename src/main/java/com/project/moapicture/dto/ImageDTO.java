package com.project.moapicture.dto;

import lombok.Data;

@Data
public class ImageDTO {

    private int image_id;
    private int post_id;
    private String image_savename;
    private String image_originalname;
    private String image_url;

}
