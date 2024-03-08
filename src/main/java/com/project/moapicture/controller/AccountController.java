package com.project.moapicture.controller;

import com.project.moapicture.dto.CommentsDTO;
import com.project.moapicture.dto.PostDTO;
import com.project.moapicture.dto.UserInfoDTO;
import com.project.moapicture.service.AccountService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class AccountController {

    @Autowired
    private AccountService mypageService;

    //패스 변수 방식
    @RequestMapping(value="/profile/{usernickname}",method = RequestMethod.GET)
    public ModelAndView otherAccount(@PathVariable("usernickname")String userNickName) throws Exception {

        String email = "hchdbsgk@naver.com"; //일단 하드코딩
        String nick = mypageService.getNicfromEmail(email);

        System.out.println("주소로 넘어온 닉네임>>" + userNickName);

        ModelAndView mav = new ModelAndView();

        if(nick.equals(userNickName)){

            String myEmail =  mypageService.getEmailfromNic(userNickName);

            UserInfoDTO userInfoDTO = mypageService.getMyInfo(myEmail);
            List<PostDTO> likedPostList =  mypageService.getLikedPost(myEmail);
            List<PostDTO> myPostList = mypageService.getMyPost(myEmail);
            List<CommentsDTO> myCommentList = mypageService.getMyComment(myEmail);

            mav.addObject("userInfoDTO",userInfoDTO);
            mav.addObject("likedPostList",likedPostList);
            mav.addObject("myPostList",myPostList);
            mav.addObject("myCommentList",myCommentList);

            mav.setViewName("mypage");
        }else {

            String otherEmail = mypageService.getEmailfromNic(userNickName);

            System.out.println("다른 계정 이메일>>" + otherEmail);

            if(otherEmail == null){
                mav.setViewName("redirect:/logpicture");
            }else {
                UserInfoDTO otherInfoDTO = mypageService.getMyInfo(otherEmail);
                List<PostDTO> otherPostList = mypageService.getMyPost(otherEmail);

                mav.addObject("otherInfoDTO",otherInfoDTO);
                mav.addObject("otherPostList",otherPostList);

                mav.setViewName("account");
            }
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
