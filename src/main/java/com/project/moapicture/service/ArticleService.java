package com.project.moapicture.service;

import com.project.moapicture.dto.HashtagDTO;
import com.project.moapicture.dto.LikeDTO;
import com.project.moapicture.dto.PostDTO;
import com.project.moapicture.dto.TemplateDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ArticleService {

    public PostDTO getReadData(@Param("post_id") int postId) throws Exception;
    public List<HashtagDTO> getHashtag(@Param("post_id") int postId) throws Exception;

    //--여기부터는 삭제!! --------------------------
    public void deletePost(@Param("post_id")int post_id) throws Exception;

    //--여기부터는 like 관리
    public void insertLike(@Param("like_id")int like_id, @Param("post_id")int post_id,
                           @Param("user_email")String user_email) throws Exception;
    public void deleteLike(@Param("like_id")int like_id) throws Exception;
    public int likeMaxNum() throws Exception;
    public int likeCountMaxNum(@Param("post_id")int post_id) throws Exception;
    public void updateLikeCount(@Param("like_count")int like_count, @Param("post_id")int post_id) throws Exception;
    public int getLikeId(@Param("user_email")String user_email, @Param("post_id")int post_id) throws Exception;
    public List<LikeDTO> getAllLikeId(@Param("post_id")int post_id) throws Exception;

}
