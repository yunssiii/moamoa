package com.project.moapicture.service;

import com.project.moapicture.dto.HashtagDTO;
import com.project.moapicture.dto.ImageDTO;
import com.project.moapicture.dto.PostHashtagDTO;
import com.project.moapicture.dto.TemplateDTO;
import com.project.moapicture.mapper.CreatedMapper;
import com.project.moapicture.mapper.TemplateMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CreatedServiceImpl implements CreatedService {

    @Autowired
    private CreatedMapper createdMapper;


    @Override
    public int postMaxNum() throws Exception {
        return createdMapper.postMaxNum();
    }

    @Override
    public int imageMaxNum() throws Exception {
        return createdMapper.imageMaxNum();
    }

    @Override
    public int tagMaxNum() throws Exception {
        return createdMapper.tagMaxNum();
    }

    @Override
    public int likeMaxNum() throws Exception {
        return createdMapper.likeMaxNum();
    }

    @Override
    public String selectNickname(String user_email) throws Exception {
        return createdMapper.selectNickname(user_email);
    }

    @Override
    public void insertPost(int post_id, String user_email, String post_title, String post_content, String user_nickname) throws Exception {
        createdMapper.insertPost(post_id,user_email,post_title,post_content,user_nickname);
    }

    @Override
    public void insertImage(ImageDTO imageDTO) throws Exception {
        createdMapper.insertImage(imageDTO);
    }

    @Override
    public void insertHashtag(int tag_id, String tag_name) throws Exception {
        createdMapper.insertHashtag(tag_id,tag_name);
    }

    @Override
    public void insertPostHashtag(int post_id, int tag_id) throws Exception {
        createdMapper.insertPostHashtag(post_id,tag_id);
    }

    @Override
    public void insertUserLike(int like_id, int post_id, String user_email) throws Exception {
        createdMapper.insertUserLike(like_id,post_id,user_email);
    }
}
