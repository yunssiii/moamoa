package com.project.moapicture.controller;

import com.project.moapicture.service.CreatedService;
import com.project.moapicture.service.TemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
    public void created_ok(@RequestParam String title, @RequestParam String content, @RequestParam String hashtags, @RequestParam MultipartFile image) throws Exception {

        String email = "hchdbsgk@naver.com"; //일단 하드코딩

        System.out.println("title넘?>>>>>>>" + title);
        System.out.println("content?>>>>>>>" + content);
        System.out.println("image?>>>>>>>" + image);
        System.out.println("hashtags?>>>>>>>" + hashtags);


        int postId = createdService.postMaxNum()+1;
        String nickname = createdService.selectNickname(email);

        //게시글 insert
        if (!nickname.isEmpty()){ //닉네임 있으면 - 닉네임 insert
            createdService.insertPost(postId,email,title,content,nickname);
        }else { //없으면 - 이메일 insert
            createdService.insertPost(postId,email,title,content,email);
        }

        //이미지 insert


        //해시태그 insert
        int tagId = createdService.tagMaxNum()+1;
        String[] hashtagArray;

        if(!hashtags.equals("")){ //해시태그가 있을 때만 해시태그에 insert
            hashtagArray = hashtags.split(","); // hashtags를 콤마로 구분하여 배열로 변환

            for(String tagName : hashtagArray){
                createdService.insertHashtag(tagId,tagName);
                //포스트태그 insert
                createdService.insertPostHashtag(postId,tagId);

                tagId++;
            }
        }




//        ModelAndView mav = new ModelAndView();
//
//        //mav.setViewName("redirect:/article");
//
//        return mav;
    }

}
