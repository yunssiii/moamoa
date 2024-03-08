package com.project.moapicture.mapper;

import com.project.moapicture.dto.HashtagDTO;
import com.project.moapicture.dto.PostDTO;
import com.project.moapicture.dto.TemplateDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface MainMapper {

    public List<HashtagDTO> getPostIdFromTag(@Param("tag_name")String tag_name) throws Exception;
    public PostDTO getTagPost(@Param("post_id")int post_id) throws Exception;

}
