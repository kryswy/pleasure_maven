package com.pleasure.controller;

import java.io.FileOutputStream;
import java.io.IOException;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@Controller
public class UploadController {

	@RequestMapping(value = "/upFiles.do", method = { RequestMethod.POST,RequestMethod.GET })
	@ResponseBody
	public String uploadFiles(@RequestParam(value = "files") CommonsMultipartFile[] files,String[] filenames) {
		int i = 0;
		for (MultipartFile file : files) {
			saveFile(file, filenames[i]);
			i++;
		}
		return "Success";
		
	}


	private boolean saveFile(MultipartFile file, String filename) {
		if (!file.isEmpty()) {
			try {
			
/*				filename += file.getOriginalFilename().substring(
						file.getOriginalFilename().lastIndexOf("."));*/
				
				FileCopyUtils.copy(file.getInputStream(), new FileOutputStream(
						filename));
				return true;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return false;
	}
}
