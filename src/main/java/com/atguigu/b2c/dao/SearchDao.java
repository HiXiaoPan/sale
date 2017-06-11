package com.atguigu.b2c.dao;

import java.util.HashMap;
import java.util.List;

import com.atguigu.b2c.bean.UNION_SKU_SHP_TM;


public interface SearchDao {
	List<UNION_SKU_SHP_TM> select_sku_shp_tm_by_fl2id_attrids_attrValueids(HashMap<String , Object> map);

	List<Integer> select_valueid_by_attrid(Integer integer);
}
