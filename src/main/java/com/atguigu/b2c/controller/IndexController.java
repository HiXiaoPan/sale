package com.atguigu.b2c.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
@RequestMapping("/index")
@Controller
public class IndexController {
	@RequestMapping("goto_redis_reflush_class2.htm")
	public String index() {
		return "background/redis/reflush_class2";
	}
	@RequestMapping("/index/{success}.htm")
	public String index(@PathVariable String success,ModelMap map) {
		map.put("success", success);
		return "bgFullManager";
	}
	@RequestMapping("/goto_class_sku_manager.htm")
	public String goto_sku_manager_add() {
		return "background/sku/manager_add";
	}
	@RequestMapping("/goto_spu_manager.htm")
	public String goto_spu_manager_add() {
		return "background/spu/manager_add";
	}
	@RequestMapping("/goto_class_attr_manager.htm")
	public String goto_class_attr_add() {
		
		return "background/classAttr/class_attr_manager";
	}
}
