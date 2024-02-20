package com.project.logpicture.service;

import com.project.logpicture.dto.TemplateDTO;

public interface TemplateService {

    public int selectMethod() throws Exception;
    public void insertMethod(TemplateDTO dto) throws Exception;

    // Mapper Interface를 그대로 가져와주기.

}
