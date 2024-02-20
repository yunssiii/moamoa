package com.project.logpicture.mapper;

import com.project.logpicture.dto.TemplateDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TemplateMapper {

    public int selectMethod() throws Exception;
    public void insertMethod(TemplateDTO dto) throws Exception;

}
