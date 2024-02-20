package com.project.moapicture.controller;

import com.project.moapicture.service.TemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CreatedController {

    @Autowired
    private TemplateService templateService;

    @RequestMapping(value="/created")
    public ModelAndView template() throws Exception {
        ModelAndView mav = new ModelAndView();

        mav.setViewName("created");

        return mav;
    }

}
