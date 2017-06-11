package com.atguigu.b2c.service;

import java.util.List;

import com.atguigu.b2c.bean.T_MALL_ATTR_CONTAIN_VALUE;

public interface ClassAttrService {

	List<T_MALL_ATTR_CONTAIN_VALUE> get_class_2_attr_and_value(Integer class_2_id);

	void add_attr_value(List<T_MALL_ATTR_CONTAIN_VALUE> attrAndValues, Integer class_2_id);

}
