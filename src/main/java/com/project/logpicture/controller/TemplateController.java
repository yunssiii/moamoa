package com.project.logpicture.controller;

import com.project.logpicture.service.TemplateService;
import jakarta.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TemplateController {

    @Autowired
    private TemplateService templateService;

    @RequestMapping(value="/")
    public ModelAndView template() throws Exception {
        ModelAndView mav = new ModelAndView();

        mav.setViewName("template");

        return mav;
    }

}
