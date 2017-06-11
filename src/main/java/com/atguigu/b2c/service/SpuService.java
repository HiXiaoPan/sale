package com.atguigu.b2c.service;

import java.util.List;

import com.atguigu.b2c.bean.T_MALL_PRODUCT;

public interface SpuService {
	public boolean spu_add(List<String> files, T_MALL_PRODUCT product);
}
