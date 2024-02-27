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
    //-> dto로 매개변수하면 insert할 때 dto에 다 저장한 다음 dto로 넘겨줘야해서 귀찮음..! 그냥 하나하나 적음

    //각 id maxnum select
    public int postMaxNum()  throws Exception;
    public int imageMaxNum()  throws Exception;
    public int tagMaxNum()  throws Exception;
    public int likeMaxNum()  throws Exception;

    //post에 insert할 닉네임 조회
    public String selectNickname(@Param("user_email") String user_email) throws Exception;

    //created에서 insert
    public void insertPost(
            @Param("post_id")int post_id, @Param("user_email") String user_email, @Param("post_title") String post_title,
            @Param("post_content") String post_content, @Param("user_nickname") String user_nickname) throws Exception;
    public void insertImage(@Param("image_id")int image_id, @Param("image_savename") String image_savename,
                            @Param("image_originalname") String image_originalname, @Param("image_url") String image_url,
                            @Param("post_id") int post_id) throws Exception;
    public void insertHashtag(@Param("tag_id") int tag_id,@Param("tag_name") String tag_name) throws Exception;
    public void insertPostHashtag(@Param("post_id") int post_id,@Param("tag_id") int tag_id) throws Exception;
    public void insertUserLike(@Param("like_id") int like_id, @Param("post_id") int post_id, @Param("user_email") String user_email) throws Exception;

}
