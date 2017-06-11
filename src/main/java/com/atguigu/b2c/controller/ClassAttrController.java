package com.atguigu.b2c.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.atguigu.b2c.bean.LIST_T_MALL_ATTR_CONTAIN_VALUE;
import com.atguigu.b2c.bean.T_MALL_ATTR_CONTAIN_VALUE;
import com.atguigu.b2c.service.ClassAttrService;
@RequestMapping("/classAttr")
@Controller
public class ClassAttrController {
	@Autowired
	ClassAttrService classAttrServiceImpl;
	
	@RequestMapping(value="class_attr.htm",method=RequestMethod.POST)
	public ModelAndView class_attr(LIST_T_MALL_ATTR_CONTAIN_VALUE attr_value,Integer class_2_id,String class_2_name) {
		List<T_MALL_ATTR_CONTAIN_VALUE> attrAndValues = attr_value.getAttr_value();
		 
		 classAttrServiceImpl.add_attr_value(attrAndValues,class_2_id);
		 //ModelAndView mav = new ModelAndView("redirect:/classAttr/goto_class_attr_add/{class_2_id}/{class_2_name}.htm");
		 //mav.addObject("class_2_id", class_2_id);
		 //mav.addObject("class_2_name", class_2_name);
		ModelAndView mav = new ModelAndView("redirect:/index/index/{success}.htm");
		 mav.addObject("success", class_2_id+"属性添加成功");
		return mav;
	}
	
	// 请求为/goto_class_attr_manager//.htm 请求不到，但只有一个/goto_class_attr_manager/.htm 可以
	@RequestMapping("/goto_class_attr_add/{class_2_id}/{class_2_name}.htm")
	public String goto_manager_add(@PathVariable Integer class_2_id,@PathVariable String class_2_name,ModelMap map) {
		map.put("class_2_id", class_2_id);
		map.put("class_2_name", class_2_name);
		return "background/classAttr/class_attr_add";
	}
	
	//easyui datagride需要 json
	@ResponseBody
	@RequestMapping(value="/fl2_attr_value_easyui.do" , method=RequestMethod.GET)
	public List<T_MALL_ATTR_CONTAIN_VALUE> get_fl2_attr_value_easyui(Integer class_2_id) {
		List<T_MALL_ATTR_CONTAIN_VALUE> attrAndValues =  classAttrServiceImpl.get_class_2_attr_and_value(class_2_id);
		return attrAndValues;
	} 
	
	@RequestMapping(value="/fl2_attr_value.do" , method=RequestMethod.GET)
	public String get_fl2_attr_value(Integer class_2_id,ModelMap map) {
		List<T_MALL_ATTR_CONTAIN_VALUE> attrAndValues =  classAttrServiceImpl.get_class_2_attr_and_value(class_2_id);
		map.put("attr_value", attrAndValues);
		//直接将下面这个页面返回给 ajax ,ajax function(data) data 将是一个html
		return "background/classAttr/class_attr";
	} 
	
}
