package com.pleasure.controller;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pleasure.dto.PClass;
import com.pleasure.service.ClassService;


@Controller
public class ClassController {
	@Resource
	private ClassService classService;
	@RequestMapping("/getChildsById.do")
	@ResponseBody
	public List<PClass> getChildsById(int classID){
		return classService.getAllChildProducts(classID);
	}


}
