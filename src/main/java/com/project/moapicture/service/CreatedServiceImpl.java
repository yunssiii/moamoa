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
    public void insertPost(int post_id, String user_email, String post_title, String post_content, String user_nickname) throws Exception {
        createdMapper.insertPost(post_id,user_email,post_title,post_content,user_nickname);
    }

    @Override
    public void insertImage(ImageDTO imageDTO) throws Exception {
        createdMapper.insertImage(imageDTO);
    }

    @Override
    public void insertHashtag(HashtagDTO hashtagDTO) throws Exception {
        createdMapper.insertHashtag(hashtagDTO);
    }

    @Override
    public void insertPostHashtag(PostHashtagDTO postHashtagDTO) throws Exception {
        createdMapper.insertPostHashtag(postHashtagDTO);
    }

    @Override
    public void insertUserLike(int like_id, int post_id, String user_email) throws Exception {
        createdMapper.insertUserLike(like_id,post_id,user_email);
    }
}
