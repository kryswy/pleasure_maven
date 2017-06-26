package com.pleasure.interceptors;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.pleasure.dto.User;



public class LoginInterceptor implements HandlerInterceptor {
	
	List<String> allowedPath;
	public List<String> getAllowedPath() {
		return allowedPath;
	}

	public void setAllowedPath(List<String> allowedPath) {
		this.allowedPath = allowedPath;
	}

	@Override
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object obj) throws Exception {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		User user=(User) session.getAttribute("user");
		if(user!=null){
			return true;
		}
		response.sendRedirect("error.jsp?type=2");
		return false;
		
	}

}
