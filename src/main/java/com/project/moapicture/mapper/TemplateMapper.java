package com.project.moapicture.mapper;

import com.project.moapicture.dto.TemplateDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TemplateMapper {

    public int selectMethod() throws Exception;
    public void insertMethod(TemplateDTO dto) throws Exception;

}
