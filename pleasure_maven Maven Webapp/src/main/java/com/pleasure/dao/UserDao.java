package com.pleasure.dao;

import java.util.List;
import java.util.Map;

import com.pleasure.dto.User;





public interface UserDao {

	int addUser(User user);

	User getUserByUserName(String userName);

	int changeActiveState(User user);

	int getIdByUserName(String userName);

	User getUserById(int userID);

	void setUserPwdCode(Map<String,Object> map);

	void changePwd(Map<String,Object> map);

	List<User> getUserList();

}
