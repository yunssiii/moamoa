package com.project.moapicture.service;

import com.project.moapicture.dto.HashtagDTO;
import com.project.moapicture.dto.LikeDTO;
import com.project.moapicture.dto.PostDTO;
import com.project.moapicture.dto.TemplateDTO;
import com.project.moapicture.mapper.ArticleMapper;
import com.project.moapicture.mapper.TemplateMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    private ArticleMapper articleMapper;


    @Override
    public PostDTO getReadData(int postId) throws Exception {
        return articleMapper.getReadData(postId);
    }

    @Override
    public List<HashtagDTO> getHashtag(int postId) throws Exception {
        return articleMapper.getHashtag(postId);
    }

    @Override
    public void deletePost(int post_id) throws Exception {
        articleMapper.deletePost(post_id);
    }

    @Override
    public void insertLike(int like_id, int post_id, String user_email) throws Exception {
        articleMapper.insertLike(like_id, post_id, user_email);
    }

    @Override
    public void deleteLike(int like_id) throws Exception {
        articleMapper.deleteLike(like_id);
    }

    @Override
    public int likeMaxNum() throws Exception {
        return articleMapper.likeMaxNum();
    }

    @Override
    public int likeCountMaxNum(int post_id) throws Exception {
        return articleMapper.likeCountMaxNum(post_id);
    }

    @Override
    public void updateLikeCount(int like_count, int post_id) throws Exception {
        articleMapper.updateLikeCount(like_count, post_id);
    }

    @Override
    public int getLikeId(String user_email, int post_id) throws Exception {
        return articleMapper.getLikeId(user_email, post_id);
    }

    @Override
    public List<LikeDTO> getAllLikeId(int post_id) throws Exception {
        return articleMapper.getAllLikeId(post_id);
    }
}
