package com.project.moapicture.service;

import com.project.moapicture.dto.HashtagDTO;
import com.project.moapicture.dto.PostDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface MainService {

    public List<HashtagDTO> getPostIdFromTag(@Param("tag_name")String tag_name) throws Exception;
    public PostDTO getTagPost(@Param("post_id")int post_id) throws Exception;

}
