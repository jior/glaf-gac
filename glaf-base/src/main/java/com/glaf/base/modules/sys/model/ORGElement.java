package com.glaf.base.modules.sys.model;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ORGElement {
	public static final int TYPE_DEP=1;
	public static final int TYPE_EMP=2;
	protected ORGElement parent;
	protected ORGElement sub_h;
	protected ORGElement sub_f;
	protected ORGElement next;
	protected ORGElement privoues;
	protected int type;
	protected MstDepartment dept;
	protected int subSize;
	protected int parentId;
	
	/**
	 * 还没有找到父节点的
	 */
	static List notappend = new ArrayList();
	
	/**
	 * 未添加到树中的
	 */
	public static List notTree = new ArrayList();
	
	/**
	 * 所有的节点
	 */
	static Map deptMap = new HashMap();
	
	/**
	 * 所有的节点
	 */
	public static Map deptMapSystem = new HashMap();
	
	/**
	 * 根
	 */
	public static ORGElement root =null;
	
	static List noParent = new ArrayList();
	
	public static void put(MstDepartment dept){
		if(dept==null)return;
		int p = dept.getParentUnitId();
		ORGElement org = new ORGElement();
		org.dept=dept;
		if(p==0&&root==null)root=org;
		ORGElement parent =(ORGElement)deptMap.get(""+p);
		deptMap.put(""+dept.getUnitId(), org);
		if(parent==null){
			notappend.add(org);
		}else{
			parent.putChild(org);
		}
		
		if(dept.getTreeId()==0){
			notTree.add(org);
		}
		if(dept.getTreeId()!=0){
			ORGElement.deptMapSystem.put(""+dept.getTreeId(),org);
		}
		
	}
	
	public static void fix(){
		for(Object o:notappend){
			ORGElement org =(ORGElement)o;
			ORGElement p=(ORGElement)deptMap.get(""+org.dept.getParentUnitId());
			if(p!=null){
				p.putChild(org);
			}
		}
	}
	
	
	public void putChild(ORGElement org){
		if(this.sub_h==null){
			this.sub_h=org;
			this.sub_f=org;
		}else{
			this.sub_f.next=org;
			org.privoues=this.sub_f;
		}
		org.parent=this;
		this.subSize++;
	}

	/**
	 * 
	 * @return
	 */
	public int getParentId() {
		return parentId;
	}
	public void setParentId(int parentId) {
		this.parentId = parentId;
	}

	public ORGElement getParent() {
		return parent;
	}
	public void setParent(ORGElement parent) {
		this.parent = parent;
	}

	public ORGElement getNext() {
		return next;
	}
	public void setNext(ORGElement next) {
		this.next = next;
	}
	public ORGElement getPrivoues() {
		return privoues;
	}
	public void setPrivoues(ORGElement privoues) {
		this.privoues = privoues;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public MstDepartment getDept() {
		return dept;
	}
	public void setDept(MstDepartment o) {
		this.dept = o;
	}
	public int getSubSize() {
		return subSize;
	}
	public void setSubSize(int subSize) {
		this.subSize = subSize;
	}
	
	

}
