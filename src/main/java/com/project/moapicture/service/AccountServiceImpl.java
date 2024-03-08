package com.project.moapicture.service;

import com.project.moapicture.dto.CommentsDTO;
import com.project.moapicture.dto.PostDTO;
import com.project.moapicture.dto.UserInfoDTO;
import com.project.moapicture.mapper.AccountMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class AccountServiceImpl implements AccountService {

    @Autowired
    private AccountMapper mypageMapper;

    @Override
    public String getNicfromEmail(String user_email) throws Exception {
        return mypageMapper.getNicfromEmail(user_email);
    }

    @Override
    public String getEmailfromNic(String user_nickname) throws Exception {
        return mypageMapper.getEmailfromNic(user_nickname);
    }

    @Override
    public UserInfoDTO getMyInfo(String user_email) throws Exception {
        return mypageMapper.getMyInfo(user_email);
    }

    @Override
    public List<PostDTO> getLikedPost(String user_email) throws Exception {
        return mypageMapper.getLikedPost(user_email);
    }

    @Override
    public List<PostDTO> getMyPost(String user_email) throws Exception {
        return mypageMapper.getMyPost(user_email);
    }

    @Override
    public List<CommentsDTO> getMyComment(String user_email) throws Exception {
        return mypageMapper.getMyComment(user_email);
    }



}
