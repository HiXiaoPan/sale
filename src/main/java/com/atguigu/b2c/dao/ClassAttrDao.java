package com.atguigu.b2c.dao;

import java.util.List;
import java.util.Map;

import com.atguigu.b2c.bean.T_MALL_ATTR_CONTAIN_VALUE;

public interface ClassAttrDao {

	List<T_MALL_ATTR_CONTAIN_VALUE> get_class_2_attr_and_value(Integer class_2_id);

	void insert_attr(T_MALL_ATTR_CONTAIN_VALUE t_MALL_ATTR_CONTAIN_VALUE);

	void insert_value(Map<String, Object> param);

}
