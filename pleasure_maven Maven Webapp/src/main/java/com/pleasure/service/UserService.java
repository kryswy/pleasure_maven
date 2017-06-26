package com.pleasure.service;

import java.util.List;

import com.pleasure.dto.User;


public interface UserService {
	void register(User user) ;
	boolean validateActiveState(int UserID, String activateCode);
	User getUserByUserName(String userName);
	void setUserPwdCode(User user, String code);
	void changePwd(User user, String newpassword);

	List<User> getUserList();
	
	User getUserById(int id);
	boolean checkUserName(String userName);
	boolean checkEmail(String userName, String email);
}
