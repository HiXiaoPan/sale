package com.atguigu.b2c.utils;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class B2cUploadUtil {
	public static List<String> uploadFiles(MultipartFile[] files) throws Exception{
		String location="E:\\code\\workspace\\mars\\Maven_Mall_01\\src\\main\\webapp\\imgs";
		List<String> fileNames = new ArrayList<>();
		for (MultipartFile file : files) {
			if(!file.getOriginalFilename().equals("")) {
				String filename =System.currentTimeMillis()+ file.getOriginalFilename();
				file.transferTo(new File(location+"/"+filename));
				fileNames.add(filename);
			}
			
		}
		return fileNames;
	}
}
