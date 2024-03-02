package com.project.moapicture.controller;

import com.project.moapicture.dto.HashtagDTO;
import com.project.moapicture.dto.PostDTO;
import com.project.moapicture.service.ArticleService;
import com.project.moapicture.service.CreatedService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;


@Controller
public class BoardController {

    //article, created, updated page

    @Autowired
    private CreatedService createdService;

    @Autowired
    private ArticleService articleService;

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
    public ResponseEntity<String> created_ok(HttpServletRequest request, @RequestParam String title, @RequestParam String content,
                                             @RequestParam String hashtags, @RequestParam MultipartFile image, @RequestParam(name = "id") String strPostId) throws Exception {

        String email = "hchdbsgk@naver.com"; //일단 하드코딩
        int intPostId = Integer.parseInt(strPostId);

        System.out.println("title넘?>>>>>>>" + title);
        System.out.println("content?>>>>>>>" + content);
        System.out.println("image?>>>>>>>" + image);
        System.out.println("hashtags?>>>>>>>" + hashtags);

        //등록이면
        if (intPostId == 0){

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
                    createdService.insertPostHashtag(postId,tagId);
                    createdService.insertHashtag(tagId,tagName);

                    tagId++;
                }
            }

            System.out.println("글등록시 게시글아이디>>>>>>>>" + postId);

            return new ResponseEntity<>("{\"postId\": " + postId + "}", HttpStatus.OK);

        }else { //수정이면

            //게시글 수정
            createdService.updatePost(title,content,intPostId);

            //이미지 수정
            if(!image.isEmpty()) {

                //이미지 저장 물리적 경로
                String uploadPath = request.getServletContext().getRealPath("/images").replace("\\", "/");

                //이미지 원본 이름
                String originalName = image.getOriginalFilename();

                System.out.println("수정upload 경로>>>>>>>>>>>>" + uploadPath);
                System.out.println("수정originalName >>>>>>>>>>>>" + originalName);

                try {
                    //이미지 저장 디렉토리 생성 (물리적으로 이미지를 저장할 파일)
                    //-> uploadPath로 이미지 저장할 디렉토리 경로를 알아냄
                    File uploadDir = new File(uploadPath);
                    if (!uploadDir.exists()) {
                        uploadDir.mkdirs();
                    }

                    //새로운 파일명 설정
                    String saveFileName = System.currentTimeMillis() + "-" + originalName;
                    //디렉토리 위치와 새로운 파일명을 저장
                    File saveFile = new File(uploadDir, saveFileName);

                    //파일 저장
                    image.transferTo(saveFile);

                    createdService.updateImage(saveFileName,originalName,uploadPath,intPostId);

                } catch (Exception e) {
                    System.out.println("파일 업로드 실패: " + e.getMessage());
                }
            }

            //해시태그 삭제 후 다시 insert
            createdService.deleteHashtags(intPostId);

            int tagId = createdService.tagMaxNum()+1;
            String[] hashtagArray;

            if(!hashtags.equals("")){ //해시태그가 있을 때만 해시태그에 insert
                hashtagArray = hashtags.split(","); // hashtags를 콤마로 구분하여 배열로 변환

                for(String tagName : hashtagArray){
                    createdService.insertPostHashtag(intPostId,tagId);
                    createdService.insertHashtag(tagId,tagName);

                    tagId++;
                }
            }
        }

        System.out.println("수정시 게시글아이디>>>>>>>>" + intPostId);

        return new ResponseEntity<>("{\"postId\": " + strPostId + "}", HttpStatus.OK);

    }

    @RequestMapping(value="/article", method = {RequestMethod.GET,RequestMethod.POST})
    public ModelAndView article(HttpServletRequest request, @RequestParam(name = "id") String postId) throws Exception {

        String email = "hchdbsgk@naver.com"; //일단 하드코딩

        ModelAndView mav = new ModelAndView();

        System.out.println("?로 넘어온 값..?>>>>>" + postId);

        int intPostId = Integer.parseInt(postId);

        PostDTO postDTO = articleService.getReadData(intPostId);

//        System.out.println("이미지이름>>>>>>" + postDTO.getImage_savename());
//        System.out.println("날짜>>>>>>>>"+postDTO.getPcreated_date());

        if(postDTO == null){
            mav.setViewName("redirect:/main");
            return mav;
        }

        List<HashtagDTO> hashtagList = articleService.getHashtag(intPostId);

        mav.addObject("postDTO",postDTO);
        mav.addObject("hashtagList",hashtagList);
        mav.addObject("email",email);


        System.out.println("세션이메일>>>>>>>" + email);
        System.out.println("dto이메일>>>>>>>>>>>" + postDTO.getUser_email());
        System.out.println("dto아이디>>>>>>>>>>" + postDTO.getPost_id());

        mav.setViewName("article");

        return mav;
    }

    @RequestMapping(value="/updated", method = RequestMethod.GET)
    public ModelAndView update(@RequestParam(name = "id") String postId) throws Exception {

        int intPostId = Integer.parseInt(postId);

        PostDTO postDTO = articleService.getReadData(intPostId);

        ModelAndView mav = new ModelAndView();

        mav.addObject("postDTO",postDTO);
        mav.addObject("postId",postId);

        mav.setViewName("created");

        return mav;
    }

    @RequestMapping(value = "/delete", method = {RequestMethod.POST,RequestMethod.GET})
    public void delete (HttpServletResponse response, @RequestParam(name = "id") String postId) throws Exception {

        System.out.println("삭제할 id>>>>>" + postId);

        int intPostId = Integer.parseInt(postId);

        articleService.deletePost(intPostId);

        System.out.println("삭제 완료");

//        //삭제 후 완료 알림 띄우기
//        response.setContentType("text/html; charset=euc-kr"); //한글설정
//        PrintWriter out = response.getWriter();
//        out.println("<script>alert('삭제 완료되었습니다.');</script> ");
//        out.flush();
//
//        ModelAndView mav = new ModelAndView();
//
//        mav.setViewName("redirect:/main");
//
//        return mav;
        response.setContentType("text/html; charset=euc-kr");
        PrintWriter out = response.getWriter();
        out.println("<script>");
        out.println("alert('삭제 완료되었습니다.');");
        out.println("location.href='/main';"); // 리다이렉트
        out.println("</script>");
        out.flush();

    }

}


