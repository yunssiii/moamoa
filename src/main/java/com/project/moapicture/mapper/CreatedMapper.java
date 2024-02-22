package com.project.moapicture.mapper;

import com.project.moapicture.dto.HashtagDTO;
import com.project.moapicture.dto.ImageDTO;
import com.project.moapicture.dto.PostHashtagDTO;
import com.project.moapicture.dto.TemplateDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.parameters.P;

@Mapper
public interface CreatedMapper {

    //insert할 때 매개변수가 dto와 완전히 동일한 애들은 dto로 매개변수 넣음

    public void insertPost(
            @Param("post_id")int post_id, @Param("user_email") String user_email, @Param("post_title") String post_title,
            @Param("post_content") String post_content, @Param("user_nickname") String user_nickname) throws Exception;
    public void insertImage(ImageDTO imageDTO) throws Exception;
    public void insertHashtag(HashtagDTO hashtagDTO) throws Exception;
    public void insertPostHashtag(PostHashtagDTO postHashtagDTO) throws Exception;
    public void insertUserLike(@Param("like_id") int like_id, @Param("post_id") int post_id, @Param("user_email") String user_email) throws Exception;

}
