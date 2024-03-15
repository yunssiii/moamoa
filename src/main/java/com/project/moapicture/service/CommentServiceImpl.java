package com.project.moapicture.service;

import com.project.moapicture.dto.CommentsDTO;
import com.project.moapicture.dto.TemplateDTO;
import com.project.moapicture.mapper.CommentMapper;
import com.project.moapicture.mapper.TemplateMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentMapper commentMapper;


    @Override
    public void insertComment(int commentId, String commentContent, String userNickname, int refNo, int refStep, int postId, String userEmail) throws Exception {
        commentMapper.insertComment(commentId, commentContent, userNickname, refNo, refStep, postId, userEmail);
    }

    @Override
    public int commentMaxNum() throws Exception {
        return commentMapper.commentMaxNum();
    }

    @Override
    public int refNoMaxNum() throws Exception {
        return commentMapper.refNoMaxNum();
    }

    @Override
    public List<CommentsDTO> getRefStepList(int postId) throws Exception {
        return commentMapper.getRefStepList(postId);
    }

    @Override
    public List<CommentsDTO> getCommentList(int postId, int refStep) throws Exception {
        return commentMapper.getCommentList(postId, refStep);
    }
}
