package com.project.moapicture.controller;

import com.project.moapicture.service.CreatedService;
import com.project.moapicture.service.TemplateService;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpRequest;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.IOException;


@Controller
public class CreatedController {

    @Autowired
    private CreatedService createdService;

    @Autowired
    private ResourceLoader resourceLoader;

    //@RequestMapping(value = "/created.action", method = RequestMethod.POST)

    @RequestMapping(value="/created", method = RequestMethod.GET)
    public ModelAndView created() throws Exception {
        ModelAndView mav = new ModelAndView();

        mav.setViewName("created");

        return mav;
    }

    @RequestMapping(value = "/created", method = RequestMethod.POST)
    public ResponseEntity<String> created_ok(HttpServletRequest request, @RequestParam String title, @RequestParam String content, @RequestParam String hashtags, @RequestParam MultipartFile image) throws Exception {

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
        if(!image.isEmpty()){

            int imageId = createdService.imageMaxNum()+1;
            //이미지 저장 물리적 경로
            String uploadPath = request.getServletContext().getRealPath("/images").replace("\\","/");

            //이미지 원본 이름
            String originalName = image.getOriginalFilename();

            System.out.println("upload 경로>>>>>>>>>>>>" + uploadPath);
            System.out.println("originalName >>>>>>>>>>>>" + originalName);

            try {
                //이미지 저장 디렉토리 생성 (물리적으로 이미지를 저장할 파일)
                //-> uploadPath로 이미지 저장할 디렉토리 경로를 알아냄
                File uploadDir = new File(uploadPath);
                if (!uploadDir.exists()){
                    uploadDir.mkdirs();
                }

                //새로운 파일명 설정
                String saveFileName = System.currentTimeMillis() + "-" + originalName;
                //디렉토리 위치와 새로운 파일명을 저장
                File saveFile = new File(uploadDir, saveFileName);

                //파일 저장
                image.transferTo(saveFile);

                //db에 저장
                createdService.insertImage(imageId,saveFileName,originalName,uploadPath,postId);

            }catch (Exception e){
                System.out.println("파일 업로드 실패: " + e.getMessage());
            }


        }

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

        return new ResponseEntity<>("{\"postId\": " + postId + "}", HttpStatus.OK);


//        ModelAndView mav = new ModelAndView();
//
//        //mav.setViewName("redirect:/article");
//
//        return mav;
    }

}
