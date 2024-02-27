package com.project.moapicture.controller;

import com.project.moapicture.dto.HashtagDTO;
import com.project.moapicture.dto.PostDTO;
import com.project.moapicture.service.ArticleService;
import com.project.moapicture.service.TemplateService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @RequestMapping(value="/article", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView template(HttpServletRequest request, @RequestParam(name = "id") Integer postId) throws Exception {

        ModelAndView mav = new ModelAndView();

        System.out.println("?로 넘어온 값..?>>>>>" + postId);

        PostDTO postDTO = articleService.getReadData(postId);

        System.out.println("이미지이름>>>>>>" + postDTO.getImage_savename());

        if(postDTO == null){
            mav.setViewName("redirect:/main");
            return mav;
        }

        List<HashtagDTO> hashtagList = articleService.getHashtag(postId);

        mav.addObject("postDTO",postDTO);
        mav.addObject("hashtagList",hashtagList);

        mav.setViewName("article");

        return mav;
    }

}
