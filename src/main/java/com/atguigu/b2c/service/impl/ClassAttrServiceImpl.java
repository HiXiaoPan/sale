package com.atguigu.b2c.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.atguigu.b2c.bean.T_MALL_ATTR_CONTAIN_VALUE;
import com.atguigu.b2c.dao.ClassAttrDao;
import com.atguigu.b2c.service.ClassAttrService;
@Service
public class ClassAttrServiceImpl implements ClassAttrService {
	@Autowired
	ClassAttrDao classAttrDao;
	@Override
	public List<T_MALL_ATTR_CONTAIN_VALUE> get_class_2_attr_and_value(Integer class_2_id) {
		List<T_MALL_ATTR_CONTAIN_VALUE> attrAndValues = classAttrDao.get_class_2_attr_and_value(class_2_id);
		return attrAndValues;
	}
	@Override
	public void add_attr_value(List<T_MALL_ATTR_CONTAIN_VALUE> attrAndValues,Integer class_2_id) {
		Map<String, Object> param = new HashMap<>();
		
		for (int i = 0; i < attrAndValues.size(); i++) {
			//插入属性名
			attrAndValues.get(i).setFlbh2(class_2_id);
			classAttrDao.insert_attr(attrAndValues.get(i));
			//插入属性值
			param.put("shxm_id", attrAndValues.get(i).getId());
			param.put("values", attrAndValues.get(i).getValues());
			classAttrDao.insert_value(param);
		}
		
	}

}
