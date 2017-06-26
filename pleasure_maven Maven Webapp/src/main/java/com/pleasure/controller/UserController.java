package com.pleasure.controller;


import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pleasure.dto.User;
import com.pleasure.service.UserService;
import com.pleasure.utils.MailThread;
import com.pleasure.utils.ResetPwdThread;
import com.pleasure.utils.SubscribeThread;


@Controller
public class UserController {
	
	@Resource
	private UserService userService;
	
	@RequestMapping("/register.do")
	public String register(User user,HttpSession session){
		userService.register(user);
		User u=userService.getUserByUserName(user.getUserName());
		session.setAttribute("user", u);
		return "redirect:index.do";
	}
	@RequestMapping("/checkLogin.do")
	public void checkLogin(HttpServletResponse response,HttpSession session) throws IOException{
		User u=(User) session.getAttribute("user");
		if(u==null){
			response.getWriter().println("0");
		}else{
			if(u.getUserID()==10000){
				response.getWriter().println("2");
			}else{
				response.getWriter().println("1");
			}
		}
		
	}
	@RequestMapping("/validate.do")
	public String validate(String userID,String ActivateCode,HttpSession session){
		boolean success=userService.validateActiveState(Integer.parseInt(userID),ActivateCode);
		if(success){
			User user=(User)session.getAttribute("user");
			user.setActivate("1");
		}
		return "redirect:index.do";
	}
	@RequestMapping("/login.do")
	public String login(User user,HttpSession session,HttpServletRequest request){
		User u=userService.getUserByUserName(user.getUserName());
		if(u==null){
			return "redirect:error.jsp?type=3";
		}else{
			if(u.getPassword().equals(user.getPassword())){
				session.setAttribute("user", u);
			}else{
				return "redirect:error.jsp?type=4";
			}
		}
		String path = request.getHeader("REFERER");
		String projectName=request.getContextPath();
		int index=path.indexOf(projectName)+projectName.length();
		path=path.substring(index);
		if(path.startsWith("/error.jsp")){
			return "redirect:index.do";
		}else{
			return "redirect:"+path;
		}
		
	}
	@RequestMapping("/logoff.do")
	public void logoff(HttpSession session){
		session.removeAttribute("user");
	}
	@RequestMapping("/sendRePwdCode.do")
	public void sendRePwdCode(String userName,String email,HttpServletResponse response) throws IOException{
		userName=new String(userName.getBytes("ISO-8859-1"),"utf-8");
		User u=userService.getUserByUserName(userName);
		if(u!=null){
			if(u.getEmail().equals(email)){
				String code=UUID.randomUUID().toString().replace("-", "").toUpperCase().substring(0, 6);//���6λ��֤��
				response.getWriter().println(code);
				userService.setUserPwdCode(u,code);
				u=userService.getUserByUserName(userName);
				new ResetPwdThread(u).start();
			}else{
				System.out.println("�����������ܱ����䲻��");
			}
		}else{
			System.out.println("û�д��û�");
		}
	}
	@RequestMapping("/resetPwd.do")
	public String resetPwd(String userName,String password){
		User user=userService.getUserByUserName(userName);
		if(user!=null){
			userService.changePwd(user,password);
			userService.setUserPwdCode(user, null);
		}
		return "redirect:index.do";
	}
	@RequestMapping("/subscribe.do")
	public String subscribe(String email){
		new SubscribeThread(email).start();
		return "index.do";
	}
	@RequestMapping("admin.do")
	public String goAdmin(){
		return "forward:WEB-INF/admin.jsp";
	}
	@RequestMapping("resendemail.do")
	public String reSendEmail(HttpSession session)
	{
		User user=(User) session.getAttribute("user");
		if(user!=null){
			new MailThread(user).start();
		}
		return "index.do";
	}
	@RequestMapping("checkUserName.do")
	@ResponseBody
	public String checkUserName(String userName){
		boolean canUse=userService.checkUserName(userName);
		if(canUse==true){
			return "1";
		}else{
			return "0";
		}
	}
	@RequestMapping("checkEmail.do")
	@ResponseBody
	public String checkEmail(String userName,String email) throws UnsupportedEncodingException{
		userName=new String(userName.getBytes("ISO-8859-1"),"utf-8");
		System.out.println("userName"+userName);
		System.out.println("email"+email);
		boolean result=userService.checkEmail(userName,email);
		if(result==true){
			return "1";
		}else{
			return "0";
		}
	}
	
}
