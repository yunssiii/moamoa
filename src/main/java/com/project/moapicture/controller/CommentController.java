package com.project.moapicture.controller;

import com.project.moapicture.dto.CommentsDTO;
import com.project.moapicture.service.CommentService;
import com.project.moapicture.service.CreatedService;
import com.project.moapicture.service.TemplateService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class CommentController {

    @Autowired
    private CommentService commentService;

    @Autowired
    private CreatedService createdService;

    @RequestMapping(value="/comment", method = RequestMethod.POST)
    public ResponseEntity<Map<String, Object>> comment(@RequestBody CommentsDTO commentsDTO) throws Exception {

        String email = "hchdbsgk@naver.com"; //일단 하드코딩

        int postId = commentsDTO.getPost_id();
        String commentYN = commentsDTO.getCommentYN();
        String commentContent = commentsDTO.getComment_content();
        String userNickname = createdService.selectNickname(email);
        int commentId = commentService.commentMaxNum()+1;
        int refNo = commentService.refNoMaxNum()+1;

        System.out.println("댓글입력될 게시글..>>" + postId);
        System.out.println("본댓이니? >>" + commentYN);


        if(commentYN.equals("y")){//본 댓일 경우 insert
            commentService.insertComment(commentId,commentContent,userNickname,refNo,0,postId,email);
        }else if(commentYN.equals("n")){//대댓일 경우 insert
            commentService.insertComment(commentId,commentContent,userNickname,refNo,1,postId,email);
        }


//        //--
//
//
//        for (CommentsDTO dto : refStepList){
//            if(dto.getRef_step() == 0){
//                commentsDTOList = commentService.getCommentList(postId,0);
//                break; // 본댓만 처리하고 반복 중단
//            }
//        }
//
//        if (!commentsDTOList.isEmpty()) {
//            response.put("comments", commentsDTOList);
//            response.put("message", "댓글 조회 성공");
//            return new ResponseEntity<>(response, HttpStatus.OK);
//        }
//
//        // 댓글 리스트가 비어 있거나, ref_step이 0이 아닌 경우
//        response.put("result", "댓글 insert 성공");
//        return new ResponseEntity<>(response, HttpStatus.OK);
//        //--



        //본댓 select
        List<CommentsDTO> refStepList = commentService.getRefStepList(postId);
        Map<String, Object> commentResponse = new HashMap<>();
        List<CommentsDTO> commentsDTOList = new ArrayList<>();

        for (CommentsDTO dto : refStepList){
            if(dto.getRef_step() == 0){
                 commentsDTOList = commentService.getCommentList(postId,0);
                 break; //본댓 조회했으니 반복문 나가기
            }
        }

        if(!commentsDTOList.isEmpty()){
            commentResponse.put("commentList",commentsDTOList);
            commentResponse.put("message","본댓글 조회 성공");
            return new ResponseEntity<>(commentResponse, HttpStatus.OK);
        }

        return new ResponseEntity<>(Map.of("result", "댓글 insert 성공"), HttpStatus.OK);
    }

}
