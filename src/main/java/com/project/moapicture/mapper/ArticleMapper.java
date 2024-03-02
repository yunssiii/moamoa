package com.project.moapicture.mapper;

import com.project.moapicture.dto.HashtagDTO;
import com.project.moapicture.dto.PostDTO;
import com.project.moapicture.dto.TemplateDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface ArticleMapper {

    public PostDTO getReadData(@Param("post_id") int postId) throws Exception;

    //여러 개의 필드가 반환되니까 list에 담기
    public List<HashtagDTO> getHashtag(@Param("post_id") int postId) throws Exception;

    //--여기부터는 삭제!! --------------------------
    public void deletePost(@Param("post_id")int post_id) throws Exception;

}
