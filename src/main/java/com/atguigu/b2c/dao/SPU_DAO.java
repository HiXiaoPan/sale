package com.atguigu.b2c.dao;

import java.util.Map;

import com.atguigu.b2c.bean.T_MALL_PRODUCT;

public interface SPU_DAO {

	int insertImages(Map<String, Object> param);

	int insertProduct(T_MALL_PRODUCT product);

}
