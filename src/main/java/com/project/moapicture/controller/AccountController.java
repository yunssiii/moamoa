package com.project.moapicture.controller;

import com.project.moapicture.service.TemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AccountController {

    @Autowired
    private TemplateService templateService;

    //패스 변수 방식
    @RequestMapping(value="/profile/{useremail}",method = RequestMethod.GET)
    public ModelAndView otherAccount(@PathVariable("useremail")String userEmail) throws Exception {

        String email = "hchdbsgk@naver.com"; //일단 하드코딩
        String nick = "hchdbsgk"; //일단 닉네임으로 햇어서 이걸로 비교해야하는데 쿼리 짤 시간없으니

        ModelAndView mav = new ModelAndView();

        if(nick.equals(userEmail)){
            mav.setViewName("mypage2");
        }else {
            mav.setViewName("account");
        }



        return mav;
    }

}

//@RequestMapping(value="/profile/{username}", method = RequestMethod.GET)
//public String getUserProfile(@PathVariable("username") String username, Model model) {
//    // username을 사용하여 사용자 정보 조회 로직
//    model.addAttribute("user", userService.getUserByUsername(username));
//    return "userProfile";
//}
