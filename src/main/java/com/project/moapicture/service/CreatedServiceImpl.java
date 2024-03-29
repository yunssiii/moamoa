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
    public String selectNickname(String user_email) throws Exception {
        return createdMapper.selectNickname(user_email);
    }

    @Override
    public void insertPost(int post_id, String user_email, String post_title, String post_content, String user_nickname) throws Exception {
        createdMapper.insertPost(post_id,user_email,post_title,post_content,user_nickname);
    }

    @Override
    public void insertImage(int image_id, String image_savename, String image_originalname, String image_url, int post_id) throws Exception {
        createdMapper.insertImage(image_id, image_savename, image_originalname, image_url, post_id);
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
    public void updatePost(String post_title, String post_content, int post_id) throws Exception {
        createdMapper.updatePost(post_title, post_content, post_id);
    }

    @Override
    public void updateImage(String image_savename, String image_originalname, String image_url, int post_id) throws Exception {
        createdMapper.updateImage(image_savename, image_originalname, image_url, post_id);
    }

    @Override
    public void deleteHashtags(int post_id) throws Exception {
        createdMapper.deleteHashtags(post_id);
    }
}
