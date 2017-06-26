package com.pleasure.controller;



import net.sf.json.JSONArray;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



import com.pleasure.dto.ChatRecord;
import com.pleasure.dto.User;
import com.pleasure.service.ChatRecordService;
import com.pleasure.service.UserService;



import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

/**
 * Created by wy  on 2016/12/27.
 */
@Controller
public class ChatController {

	@Resource
	ChatRecordService chatRecordService;

	@Resource
	UserService userChatService;

	@RequestMapping("/sendmsg.do")
	public void getMsgFromClient(HttpServletRequest request) {

		String userName = request.getParameter("userName");
		String msg = request.getParameter("msg");
		String createtime = request.getParameter("createtime");
		int direction = Integer.parseInt(request.getParameter("direction"));
		int isread = Integer.parseInt(request.getParameter("isread"));

		chatRecordService.saveRecord(new ChatRecord(userName, direction, msg,
				"", createtime, isread));

	}

	@RequestMapping("/chat.do")
	public ModelAndView chat(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("kefuclient.jsp");
		return mv;
	}

	@RequestMapping("/recordget.do")
	public void sendRecord(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		String userName = request.getParameter("userName");
		List<ChatRecord> records = chatRecordService.getRecord(userName);
		JSONArray jsonArray = JSONArray.fromObject(records);

		response.getWriter().print(jsonArray.toString());
	}

	@RequestMapping("/chat_m.do")
	public ModelAndView chat_m(HttpServletRequest request) {

		User admin = userChatService.getUserById(10000);
		request.getSession().setAttribute("admin", admin);

		ModelAndView mv = new ModelAndView();

		List<User> users = userChatService.getUserList();
		List<String> noreadlist = chatRecordService.getNoReadNames();
		noreadlist.add("admin");

		mv.addObject("users", users);
		mv.addObject("noreads", noreadlist);
		mv.setViewName("kefuserver.jsp");
		return mv;
	}

	@RequestMapping("/readrecord.do")
	public void readrecord(HttpServletRequest request) {

		String userName = request.getParameter("userName");
		chatRecordService.hasRead(userName);
	}

	@RequestMapping("/newtipget.do")
	public void getNewMessage(HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		response.setCharacterEncoding("utf-8");
		List<String> names = chatRecordService.getNoReadNames();
		JSONArray jsonArray = JSONArray.fromObject(names);

		response.getWriter().print(jsonArray.toString());
	}
	@RequestMapping("/countrecords.do")
    @ResponseBody
    public int countRecords(){
        return chatRecordService.countRecords();
    }
}
