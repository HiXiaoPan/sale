package com.atguigu.b2c.bean;

import java.util.List;
import java.util.Map;

public class Datas {
	private Integer flbh2id;
	private List<Map<String,Integer>> attrAndValueids;
	private List<Integer> attrids;
	public List<Integer> getAttrids() {
		return attrids;
	}
	public void setAttrids(List<Integer> attrids) {
		this.attrids = attrids;
	}
	public Integer getFlbh2id() {
		return flbh2id;
	}
	public void setFlbh2id(Integer flbh2id) {
		this.flbh2id = flbh2id;
	}
	public List<Map<String,Integer>> getAttrAndValueids() {
		return attrAndValueids;
	}
	public void setAttrAndValueids(List<Map<String,Integer>> attrAndValueids) {
		this.attrAndValueids = attrAndValueids;
	}
}
