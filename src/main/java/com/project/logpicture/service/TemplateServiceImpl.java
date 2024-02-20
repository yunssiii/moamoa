package com.project.logpicture.service;

import com.project.logpicture.dto.TemplateDTO;
import com.project.logpicture.mapper.TemplateMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TemplateServiceImpl implements TemplateService {

    @Autowired
    private TemplateMapper templateMapper;

    @Override
    public int selectMethod() throws Exception {
        return templateMapper.selectMethod();
    };
    @Override
    public void insertMethod(TemplateDTO dto) throws Exception {
        templateMapper.insertMethod(dto);
    };

    // Mapper Interface를 그대로 가져와주기.

}
