package com.project.moapicture.service;

import com.project.moapicture.dto.HashtagDTO;
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
}
