package com.glaf.base.modules.sys.model;

import java.io.Serializable;
import java.util.Date;

public class ExpEmployees implements Serializable {
	private static final long serialVersionUID = -7677600372139823989L;
	private long id;
	private Date startDate;
	private Date endDate;
	private long type;
	private String name;
	private Date birth;
	private String status;
	private String identifier;
	private String sex;
	private String code;
	private String email;
	private String mobil;
	private String ddlType;
	private Date lastUpdate;
	private int deptId;

	public int getDeptId() {
		return deptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}

	public Date getBirth() {
		return birth;
	}

	public String getCode() {
		return code;
	}

	public String getDdlType() {
		return ddlType;
	}

	public String getEmail() {
		return email;
	}

	public Date getEndDate() {
		return endDate;
	}

	public long getId() {
		return id;
	}

	public String getIdentifier() {
		return identifier;
	}

	public Date getLastUpdate() {
		return lastUpdate;
	}

	public String getMobil() {
		return mobil;
	}

	public String getName() {
		return name;
	}

	public String getSex() {
		return sex;
	}

	public Date getStartDate() {
		return startDate;
	}

	public String getStatus() {
		return status;
	}

	public long getType() {
		return type;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public void setDdlType(String ddlType) {
		this.ddlType = ddlType;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public void setId(long id) {
		this.id = id;
	}

	public void setIdentifier(String identifier) {
		this.identifier = identifier;
	}

	public void setLastUpdate(Date lastUpdate) {
		this.lastUpdate = lastUpdate;
	}

	public void setMobil(String mobil) {
		this.mobil = mobil;
	}

	public void setName(String name) {
		this.name = name;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public void setType(long type) {
		this.type = type;
	}

}
