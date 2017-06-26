package com.pleasure.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;


import org.springframework.stereotype.Service;

import com.pleasure.dao.UserDao;
import com.pleasure.dto.User;
import com.pleasure.service.UserService;
import com.pleasure.utils.MailThread;


@Service
public class UserServiceImpl implements UserService {
	@Resource
	private UserDao userDao;
	@Override
	public void register(User user) {
		// TODO Auto-generated method stub
		String activateCode=UUID.randomUUID().toString();
		user.setActivateCode(activateCode);
		userDao.addUser(user);
		User u=userDao.getUserByUserName(user.getUserName());
		new MailThread(u).start();
	}
	@Override
	public boolean validateActiveState(int UserID, String activateCode) {
		// TODO Auto-generated method stub
		User user=userDao.getUserById(UserID);
		if(user.getActivateCode().equals(activateCode)){
			userDao.changeActiveState(user);
			return true;
		}
		return false;
	}
	@Override
	public User getUserByUserName(String userName) {
		// TODO Auto-generated method stub
		return userDao.getUserByUserName(userName);
	}
	@Override
	public void setUserPwdCode(User user, String code) {
		// TODO Auto-generated method stub
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("userID", user.getUserID());
		paramMap.put("passwordCode", code);
		userDao.setUserPwdCode(paramMap);
	}
	@Override
	public void changePwd(User user, String newpassword) {
		// TODO Auto-generated method stub
		Map<String,Object> paramMap=new HashMap<String,Object>();
		paramMap.put("userID", user.getUserID());
		paramMap.put("newpassword", newpassword);
		userDao.changePwd(paramMap);
		
	}
	@Override
	public List<User> getUserList() {
		return userDao.getUserList();
	}
	@Override
	public User getUserById(int id) {
		return userDao.getUserById(id);
	}
	@Override
	public boolean checkUserName(String userName) {
		// TODO Auto-generated method stub
		User user=userDao.getUserByUserName(userName);
		if(user==null){
			return true;
		}else{
			return false;
		}
			
	}
	@Override
	public boolean checkEmail(String userName, String email) {
		// TODO Auto-generated method stub
		User user=userDao.getUserByUserName(userName);
		if(user==null){
			return false;
		}else{
			if(user.getEmail().equals(email))
				return true;
			else
				return false;
		}
		
	}

}
