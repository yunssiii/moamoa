package com.project.moapicture.service;

import com.project.moapicture.dto.HashtagDTO;
import com.project.moapicture.dto.PostDTO;
import com.project.moapicture.dto.TemplateDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleService {

    public PostDTO getReadData(@Param("post_id") int postId) throws Exception;
    public List<HashtagDTO> getHashtag(@Param("post_id") int postId) throws Exception;

    //--여기부터는 삭제!! --------------------------
    public void deletePost(@Param("post_id")int post_id) throws Exception;

}
