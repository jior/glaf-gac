package com.glaf.base.modules.sys.model;

public class MstStation implements java.io.Serializable  {
	private int position_id;
	private int unit_id;
	private int position_code;
	private String description;
	private String employee_job_id;
	public int getPosition_id() {
		return position_id;
	}
	public void setPosition_id(int position_id) {
		this.position_id = position_id;
	}
	public int getUnit_id() {
		return unit_id;
	}
	public void setUnit_id(int unit_id) {
		this.unit_id = unit_id;
	}
	public int getPosition_code() {
		return position_code;
	}
	public void setPosition_code(int position_code) {
		this.position_code = position_code;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getEmployee_job_id() {
		return employee_job_id;
	}
	public void setEmployee_job_id(String employee_job_id) {
		this.employee_job_id = employee_job_id;
	}

}
