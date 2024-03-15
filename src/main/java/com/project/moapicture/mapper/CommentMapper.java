package com.project.moapicture.mapper;

import com.project.moapicture.dto.CommentsDTO;
import com.project.moapicture.dto.TemplateDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CommentMapper {


    public void insertComment(@Param("comment_id")int commentId, @Param("comment_content")String commentContent,
                              @Param("user_nickname") String userNickname, @Param("ref_no")int refNo, @Param("ref_step")int refStep,
                              @Param("post_id")int postId, @Param("user_email")String userEmail) throws Exception;
    public int commentMaxNum() throws Exception;
    public int refNoMaxNum() throws Exception;
    public List<CommentsDTO> getRefStepList(@Param("post_id")int postId) throws Exception;
    public List<CommentsDTO> getCommentList(@Param("post_id")int postId, @Param("ref_step")int refStep) throws Exception;

}
