package com.project.moapicture.service;

import com.project.moapicture.dto.HashtagDTO;
import com.project.moapicture.dto.PostDTO;
import com.project.moapicture.dto.TemplateDTO;
import com.project.moapicture.mapper.MainMapper;
import com.project.moapicture.mapper.TemplateMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MainServiceImpl implements MainService {

    @Autowired
    private MainMapper mainMapper;

    @Override
    public List<HashtagDTO> getPostIdFromTag(String tag_name) throws Exception {
        return mainMapper.getPostIdFromTag(tag_name);
    }

    @Override
    public PostDTO getTagPost(int post_id) throws Exception {
        return mainMapper.getTagPost(post_id);
    }

}
