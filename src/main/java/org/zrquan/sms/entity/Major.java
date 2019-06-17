package org.zrquan.sms.entity;

import com.alibaba.fastjson.annotation.JSONField;

public class Major {
	private int id;

	@JSONField(name = "name")
	private String name;

	@JSONField(name = "dept")
	private Department dept;

	private int proNeed;
	private int comNeed;
	private int proSelect;
	private int comSelect;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Department getDept() {
		return dept;
	}

	public void setDept(Department dept) {
		this.dept = dept;
	}

	public int getProNeed() {
		return proNeed;
	}

	public void setProNeed(int proNeed) {
		this.proNeed = proNeed;
	}

	public int getComNeed() {
		return comNeed;
	}

	public void setComNeed(int comNeed) {
		this.comNeed = comNeed;
	}

	public int getProSelect() {
		return proSelect;
	}

	public void setProSelect(int proSelect) {
		this.proSelect = proSelect;
	}

	public int getComSelect() {
		return comSelect;
	}

	public void setComSelect(int comSelect) {
		this.comSelect = comSelect;
	}
}
