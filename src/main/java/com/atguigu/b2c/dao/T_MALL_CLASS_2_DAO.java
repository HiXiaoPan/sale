package com.atguigu.b2c.dao;

import java.util.List;


import com.atguigu.b2c.bean.T_MALL_CLASS_2;

public interface T_MALL_CLASS_2_DAO {
	public List<T_MALL_CLASS_2> selectClass2ByClass1id(Integer id);
}
