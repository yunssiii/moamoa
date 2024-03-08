package com.project.moapicture.controller;

import com.project.moapicture.dto.HashtagDTO;
import com.project.moapicture.dto.LikeDTO;
import com.project.moapicture.dto.PostDTO;
import com.project.moapicture.service.MainService;
import com.project.moapicture.service.TemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.List;

@Controller
public class MainController {

    @Autowired
    private MainService mainService;

    @RequestMapping(value="/logpicture")
    public ModelAndView main() throws Exception {
        ModelAndView mav = new ModelAndView();

        mav.setViewName("main");

        return mav;
    }

    @RequestMapping(value="/logpicture/{hashtag}",method = RequestMethod.GET)
    public ModelAndView clickHashtag(@PathVariable("hashtag")String hashtag) throws Exception {

        ModelAndView mav = new ModelAndView();

        List<HashtagDTO> hashtagDTOList = mainService.getPostIdFromTag(hashtag);
        List<PostDTO> posts = new ArrayList<>();

        System.out.println("주소로 넘어온 hashtag>>" +hashtag);

        for (HashtagDTO dto : hashtagDTOList) {
            // HashtagDTO 객체로부터 postId를 가져옵니다.
            int postId = dto.getPost_id(); // getPostId() 메소드는 실제 HashtagDTO 클래스의 postId 필드를 가져오는 메소드의 이름과 일치해야 합니다.

            System.out.println("게시글 아이디 >>" + postId);

            // 가져온 postId를 이용하여 PostDTO 객체를 얻습니다.
            PostDTO postDTO = mainService.getTagPost(postId); // getTagPost 메소드가 postId를 매개변수로 받아 해당하는 PostDTO를 반환한다고 가정

            // 결과 리스트에 PostDTO 객체를 추가합니다.
            posts.add(postDTO);

            System.out.println("게시글 정보 >>>" + posts);
        }



        mav.addObject("tagName",hashtag);
        mav.addObject("hashtagList",hashtagDTOList);
        mav.addObject("postList",posts);

        mav.setViewName("main");

        return mav;
    }

}
