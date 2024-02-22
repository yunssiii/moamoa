package com.project.moapicture.controller;

import com.project.moapicture.service.CreatedService;
import com.project.moapicture.service.TemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CreatedController {

    @Autowired
    private CreatedService createdService;

    //@RequestMapping(value = "/created.action", method = RequestMethod.POST)

    @RequestMapping(value="/created", method = RequestMethod.GET)
    public ModelAndView created() throws Exception {
        ModelAndView mav = new ModelAndView();

        mav.setViewName("created");

        return mav;
    }

    @RequestMapping(value = "/created", method = RequestMethod.POST)
    public ModelAndView created_ok() throws Exception {
        ModelAndView mav = new ModelAndView();

        mav.setViewName("redirect:/article");

        return mav;
    }

}
