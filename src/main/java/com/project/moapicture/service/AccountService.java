package com.project.moapicture.service;

import com.project.moapicture.dto.CommentsDTO;
import com.project.moapicture.dto.PostDTO;
import com.project.moapicture.dto.UserInfoDTO;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface AccountService {

    public String getNicfromEmail(@Param("user_email")String user_email) throws Exception;
    public String getEmailfromNic(@Param("user_nickname")String user_nickname) throws Exception;

    public UserInfoDTO getMyInfo(@Param("user_email")String user_email) throws Exception;
    public List<PostDTO> getLikedPost(@Param("user_email")String user_email) throws Exception;
    public List<PostDTO> getMyPost(@Param("user_email")String user_email) throws Exception;
    public List<CommentsDTO> getMyComment(@Param("user_email")String user_email) throws Exception;


}
