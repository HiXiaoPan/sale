package com.atguigu.b2c.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.atguigu.b2c.bean.T_MALL_PRODUCT;
import com.atguigu.b2c.service.SpuService;
import com.atguigu.b2c.utils.B2cUploadUtil;
@RequestMapping("/spu")
@Controller
public class SpuController {
	@Autowired
	SpuService spuServiceImpl;
	
	@RequestMapping(value="/manager.htm",method=RequestMethod.POST)
	public ModelAndView addSpu(@RequestParam("photos") MultipartFile[] photos,T_MALL_PRODUCT product) {
		//ModelAndView mav = new ModelAndView("redirect:index/index/{success}.htm");
		//重定向到了 spu/index/index/{success}.htm 。这是相对路径啊
		ModelAndView mav = new ModelAndView("redirect:/index/index/{success}.htm");
		String success = "添加操作失败";
		try {
			List<String> files = B2cUploadUtil.uploadFiles(photos);
			product.setShp_tp(files.get(0));
			boolean spu_add = spuServiceImpl.spu_add(files,product);
			if(spu_add) {
				success = "添加成功";
			}
			mav.addObject("success", success);
		} catch (Exception e) {
			mav.addObject("success",success);
			e.printStackTrace();
		}
		return mav;
	}
	@RequestMapping("/manager_add/{success}.htm")
	public String goto_manager_add(@PathVariable("success") String success,ModelMap map) {
		map.put("success", success);
		return "background/spu/manager_add";
	}
}
