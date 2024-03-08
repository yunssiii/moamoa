package com.project.moapicture.mapper;

import com.project.moapicture.dto.CommentsDTO;
import com.project.moapicture.dto.PostDTO;
import com.project.moapicture.dto.UserInfoDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface AccountMapper {

    //세션 이메일로 닉네임 조회
    public String getNicfromEmail(@Param("user_email")String user_email) throws Exception;

    //닉네임으로 이메일 조회 (내 계정 다른 계정..)
    public String getEmailfromNic(@Param("user_nickname")String user_nickname) throws Exception;

    //mypage 필요한 정보 조회
    public UserInfoDTO getMyInfo(@Param("user_email")String user_email) throws Exception;
    public List<PostDTO> getLikedPost(@Param("user_email")String user_email) throws Exception;
    public List<PostDTO> getMyPost(@Param("user_email")String user_email) throws Exception;
    public List<CommentsDTO> getMyComment(@Param("user_email")String user_email) throws Exception;



}
