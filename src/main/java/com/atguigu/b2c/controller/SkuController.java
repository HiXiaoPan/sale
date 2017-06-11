package com.atguigu.b2c.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.atguigu.b2c.bean.T_MALL_PRODUCT;
import com.atguigu.b2c.bean.T_MALL_SKU;
import com.atguigu.b2c.service.ClassAttrService;
import com.atguigu.b2c.service.SkuService;
@RequestMapping("/sku")
@Controller
public class SkuController {
	@Autowired
	SkuService skuServiceImpl;
	@Autowired
	ClassAttrService classAttrServiceImpl;
	
	//保存 sku 信息
	@RequestMapping(value="/sku_manager.do" ,method=RequestMethod.POST)
	public ModelAndView add_sku(T_MALL_SKU sku,LIST_T_MALL_ATTR_CONTAIN_VALUE attr_value) {
		//attr_value 存在空元素的可能需要判断出来
		skuServiceImpl.add_sku_and_skuAttrValue(sku,attr_value);
	/*	ModelAndView mav = new ModelAndView("redirect:/sku/goto_class_sku_manager/{success}.htm");
		mav.addObject("success", "恭喜添加成功");*/
		ModelAndView mav = new ModelAndView("redirect:/index/index/{success}.htm");
		 mav.addObject("success", "sku发布成功");
		return mav;
	}
	// 查询分类2对应的属性名值。
	@RequestMapping(value="/get_attr_value.do" , method=RequestMethod.GET)
	public String get_fl2_attr_value(Integer class_2_id,ModelMap map) {
		List<T_MALL_ATTR_CONTAIN_VALUE> attrAndValues =  classAttrServiceImpl.get_class_2_attr_and_value(class_2_id);
		map.put("attr_value", attrAndValues);
		return "background/sku/class_attr";
	}
	
	@ResponseBody
	@RequestMapping("/get_product.do")
	public List<T_MALL_PRODUCT> get_product(Integer flbh2,Integer pp_id){
		Map<String , Object> param = new HashMap<>();
		param.put("flbh2", flbh2);
		param.put("pp_id", pp_id);
		List<T_MALL_PRODUCT> products = skuServiceImpl.get_product_by_ppid_flan2(param);
		return products;
	}
	@RequestMapping("/goto_class_sku_manager/{success}.htm")
	public String goto_sku_manager_add(@PathVariable String success,ModelMap map) {
		map.put("success", success);
		return "background/sku/manager_add";
	}
}
