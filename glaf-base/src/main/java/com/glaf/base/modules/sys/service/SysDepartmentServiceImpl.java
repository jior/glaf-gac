package com.glaf.base.modules.sys.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.glaf.base.dao.AbstractSpringDao;
import com.glaf.base.modules.sys.SysConstants;
import com.glaf.base.modules.sys.model.MstDepartment;
import com.glaf.base.modules.sys.model.ORGElement;
import com.glaf.base.modules.sys.model.SysDepartment;
import com.glaf.base.modules.sys.model.SysTree;
import com.glaf.base.utils.PageResult;

public class SysDepartmentServiceImpl implements SysDepartmentService {
	private static final Log logger = LogFactory.getLog(SysDepartmentServiceImpl.class);
	private SysTreeService sysTreeService;	
	private AbstractSpringDao abstractDao;
	
	public void setAbstractDao(AbstractSpringDao abstractDao) {
		this.abstractDao = abstractDao;
		logger.info("setAbstractDao");
	}
	public void setSysTreeService(SysTreeService sysTreeService) {
		this.sysTreeService = sysTreeService;
		logger.info("setSysTreeService");
	}
	
	/**
	 * ����
	 * @param bean SysDepartment
	 * @return boolean
	 */
	public boolean create(SysDepartment bean){		
		boolean ret = false;		
		if(abstractDao.create(bean)){//�����¼�ɹ�
			bean.setSort((int)bean.getId());//���������Ϊ�ղ����idֵ
			bean.getNode().setSort(bean.getSort());
			abstractDao.update(bean);
			ret = true;
		}
		return ret;
	}
	/**
	 * ����
	 * @param bean SysDepartment
	 * @return boolean
	 */
	public boolean update(SysDepartment bean){	
		if(bean.getNode() != null){
			List<SysTree> sts = (List<SysTree>)this.sysTreeService.getSysTreeList((int)bean.getNode().getId());
			if(sts != null && sts.size() > 0){
				this.updateSubStatus(sts, bean.getStatus());
			}
		}
		return abstractDao.update(bean);
	}
	
	/**
	 * �޸��Ӳ��ŵ�״̬(add by kxr 2010-09-15)
	 * @param list
	 * @param status
	 * @return
	 */
	private boolean updateSubStatus(List<SysTree> list, Integer status){
		List<SysTree> sts = null;
		SysDepartment sdp = null;
		for(SysTree st : list){
			sts = (List<SysTree>)this.sysTreeService.getSysTreeList((int)st.getId());
			if(sts != null && sts.size() > 0){
				this.updateSubStatus(sts,status);
			}
			sdp = st.getDepartment();
			if(sdp != null){
				sdp.setStatus(status);
				this.update(sdp);
			}
		}
		return true;
	}
	
	/**
	 * ������ʷ����
	 * @param bean
	 * @return
	 */
//	public boolean updateHistoryDepart(SysDepartment bean,long historyIds[],SysUser user){
//		if(this.abstractDao.execute("delete SysDepartHistory a where a.newDepart.id="+bean.getId())){
//			if(historyIds != null && historyIds.length != 0){
//				Set historyDeparts = new HashSet();
//				for(int i=0 ; i<historyIds.length ; i++){
//					SysDepartment oldDepart = this.findById(historyIds[i]);
//					SysDepartHistory historyDepart = new SysDepartHistory();
//					historyDepart.setOldDepart(oldDepart);
//					historyDepart.setNewDepart(bean);
//					historyDepart.setActorId(user.getId());
//					historyDepart.setCreateDate(new Date());
//					historyDepart.setUpdateDate(new Date());
//					historyDepart.setRemark("");
//					this.abstractDao.create(historyDepart);
//					historyDeparts.add(historyDepart);
//				}
//				bean.setHistoryDeparts(historyDeparts);
//			}
//		}
//		return true;
//	}
	/**
	 * ɾ��
	 * @param bean SysDepartment
	 * @return boolean
	 */
	public boolean delete(SysDepartment bean){
		return sysTreeService.delete(bean.getId());
	}
	/**
	 * ɾ��
	 * @param id int
	 * @return boolean
	 */
	public boolean delete(long id){
		SysDepartment bean = findById(id);
		if(bean!=null){
			return delete(bean);
		}else{
			return false;
		}
	}
	/**
	 * ����ɾ��
	 * @param id
	 * @return
	 */
	public boolean deleteAll(long[] id){
		List list = new ArrayList();
		String ids ="";
		boolean isFirst =true;
		for(int i=0; i<id.length; i++){
			logger.info("id:" + id[i]);
			SysDepartment bean = findById(id[i]);
			if(bean!=null)list.add(bean);
			if(isFirst)isFirst=false;
			else ids+=",";
			ids+=id[i];
		}
		this.abstractDao.executeSQL("update MST_DEPARTMENT set deptid =0 where deptid in("+ids+")");
		return abstractDao.deleteAll(list);
	}
	
	
	
	/**
	 * ��ȡ����
	 * @param id
	 * @return
	 */
	public SysDepartment findById(long id){
		return (SysDepartment) abstractDao.find(SysDepartment.class, new Long(id));
	}
	/**
	 * ��������Ҷ���
	 * @param name String
	 * @return SysDepartment
	 */
	public SysDepartment findByNo(String code){
		SysDepartment bean = null;
		Object[] values=new Object[]{code};
		String query = "from SysDepartment a where a.no=? order by a.id asc";
		List list = abstractDao.getList(query, values, null);
		if(list!=null && list.size()>0){//�м�¼
			bean = (SysDepartment)list.get(0);
		}
		return bean;
	}
	/**
	 * �����Ʋ��Ҷ���
	 * @param name String
	 * @return SysDepartment
	 */
	public SysDepartment findByName(String name){
		SysDepartment bean = null;
		Object[] values=new Object[]{name};
		String query = "from SysDepartment a where a.name=? order by a.id asc";
		List list = abstractDao.getList(query, values, null);
		if(list!=null && list.size()>0){//�м�¼
			bean = (SysDepartment)list.get(0);
		}
		return bean;
	}
	/**
	 * ��ȡ��ҳ�б�
	 * @param parent int
	 * @param pageNo int
	 * @param pageSize int
	 * @return
	 */
	public PageResult getSysDepartmentList(int parent, int pageNo, int pageSize){
		//��������
		Object[] values=new Object[]{new Long(parent)};
		String query = "select count(*) from SysDepartment a where a.node.parent=?";
		int count = ((Long)abstractDao.getList(query, values, null).iterator().next()).intValue();
		if(count==0){//�����Ϊ��
			PageResult pager = new PageResult();
			pager.setPageSize(pageSize);
			return pager;
		}		
		//��ѯ�б�
		query = "from SysDepartment a where a.node.parent=? order by a.sort desc";
		return abstractDao.getList(query, values, pageNo, pageSize, count);		
	}
	
	/**
	 * ��ȡ�б�
	 * @return List
	 */
	public List getSysDepartmentList(){
		String query = "from SysDepartment a ";
		return abstractDao.getList(query, null, null);		
	}
	/**
	 * ��ȡ�б�
	 * @param parent int
	 * @return List
	 */
	public List getSysDepartmentList(int parent){
		//��������
		Object[] values=new Object[]{new Long(parent)};
		String query = "from SysDepartment a where a.node.parent=? order by a.sort desc";
		return abstractDao.getList(query, values, null);		
	}
	/**
	 * ����
	 * @param bean SysDepartment
	 * @param operate int ����
	 */
	public void sort(long parent, SysDepartment bean, int operate){
		if(bean==null) return;
		if(operate==SysConstants.SORT_PREVIOUS){//ǰ��
			sortByPrevious(parent, bean);
		}else if(operate==SysConstants.SORT_FORWARD){//����
			sortByForward(parent, bean);
		}		
	}
	/**
	 * ��ǰ�ƶ�����
	 * @param bean
	 */
	private void sortByPrevious(long parent, SysDepartment bean){
		Object[] values=new Object[]{new Long(parent), new Integer(bean.getSort())};
		//����ǰһ������
		String query = "from SysDepartment a where a.node.parent=? and a.sort>? order by a.sort asc";		
		List list = abstractDao.getList(query, values, null);
		if(list!=null && list.size()>0){//�м�¼
			SysDepartment temp = (SysDepartment)list.get(0);
			int i = bean.getSort();
			bean.setSort(temp.getSort());			
			abstractDao.update(bean);//����bean
			SysTree node = bean.getNode();
			node.setSort(bean.getSort());
			abstractDao.update(node);
			
			temp.setSort(i);
			abstractDao.update(temp);//����temp
			node = temp.getNode();
			node.setSort(temp.getSort());
			abstractDao.update(node);
		}
	}
	/**
	 * ����ƶ�����
	 * @param bean
	 */
	private void sortByForward(long parent, SysDepartment bean){
		Object[] values=new Object[]{new Long(parent), new Integer(bean.getSort())};
		//���Һ�һ������
		String query = "from SysDepartment a where a.node.parent=? and a.sort<? order by a.sort desc";
		List list = abstractDao.getList(query, values, null);
		if(list!=null && list.size()>0){//�м�¼
			SysDepartment temp = (SysDepartment)list.get(0);
			int i = bean.getSort();
			bean.setSort(temp.getSort());			
			abstractDao.update(bean);//����bean
			SysTree node = bean.getNode();
			node.setSort(bean.getSort());
			abstractDao.update(node);
			
			temp.setSort(i);
			abstractDao.update(temp);//����temp
			node = temp.getNode();
			node.setSort(temp.getSort());
			abstractDao.update(node);
			
		}
	}
	/**
	 * ��ȡ�û������б�
	 * @param list
	 * @param node
	 */
	public void findNestingDepartment(List list, SysDepartment node){
		if(node==null)return;
		SysTree tree = node.getNode();
		if(tree.getParent()==0){//�ҵ����ڵ�
			logger.info("findFirstNode:" + node.getId());
			list.add(node);
		}else{
			SysTree treeParent = sysTreeService.findById(tree.getParent());
			SysDepartment parent = treeParent.getDepartment();
			findNestingDepartment(list, parent);
		}
		list.add(node);
	}
	
	/**
	 * �������ݴ�HR������ӵ�ϵͳ��
	 */
	public boolean addHRDeptToSystem(String ids[]){
		if(ids==null)return false;
		updateHRDeptToTree();
		/**
		 * �����ڵ�û������ʱ�������Ӹ��ڵ�
		 */
		MstDepartment dept =ORGElement.root.getDept();
		if(dept!=null&&dept.getTreeId()==0){
			
			SysTree st = sysTreeService.findById(5);
			SysTree rootTree = new SysTree();
			rootTree.setCode(""+dept.getUnitId());
			rootTree.setDeep(dept.getUnitLevel());
			rootTree.setName(dept.getDescription());
			rootTree.setParent(5);
			sysTreeService.create(rootTree);
			dept.setTreeId((int)rootTree.getId());
			this.abstractDao.update(dept);
			ORGElement.deptMapSystem.put(""+rootTree.getId(), ORGElement.root);
		}
		
		for(String s:ids){
			ORGElement org= (ORGElement)ORGElement.deptMapSystem.get(s);
			if(org==null)continue;
			saveToSystem(org);
		}
		return true;
	}
	
	
	

	
	/**
	 * ��ʼ��HR�����ݵ�����
	 */
	public void updateHRDeptToTree(){
		Map params = new HashMap();
		List list = this.abstractDao.getList("from MstDepartment dept  order by dept.unitLevel asc", params);
		if(list!=null)
			for(Object o:list){
			MstDepartment d =(MstDepartment)o;
			ORGElement.put(d);
			
		}
		ORGElement.fix();
		MstDepartment dept =ORGElement.root.getDept();
		if(dept!=null&&dept.getTreeId()==0){
			
			SysTree st = sysTreeService.findById(13);
			SysTree rootTree = new SysTree();
			rootTree.setCode(""+dept.getUnitId());
			rootTree.setDeep(dept.getUnitLevel());
			rootTree.setName(dept.getDescription());
			rootTree.setParent(13);
			sysTreeService.create(rootTree);
			dept.setTreeId((int)rootTree.getId());
			this.abstractDao.update(dept);
			ORGElement.deptMapSystem.put(""+rootTree.getId(), ORGElement.root);
		}
		for(Object o:ORGElement.notTree){
			ORGElement org =(ORGElement)o;
			if(org.getDept().getTreeId()==0){
				save(org);
			}
		}
	}
	
	
	
	/**
	 * �������Ľṹ��HR�Ĳ��Ŷ�Ӧ
	 * @param org
	 * @return
	 */
	private int save(ORGElement org){
		MstDepartment dept=org.getDept();
		if(org.getParent()==null)return -1;
		int ptid =org.getParent().getDept().getTreeId();
		if(ptid<1){
			ptid= save(org.getParent());
		}
		if(ptid<1){
			System.out.println(dept.getDescription()+"�Ҳ������ڵ�!");
			return -1;
			}
		SysTree st = sysTreeService.findById(ptid);
		SysTree rootTree = new SysTree();
		rootTree.setCode(""+dept.getUnitId());
		rootTree.setDeep(dept.getUnitLevel());
		rootTree.setName(dept.getDescription());
		rootTree.setParent(ptid);
		sysTreeService.create(rootTree);
		dept.setTreeId((int)rootTree.getId());
		this.abstractDao.update(dept);
		ORGElement.deptMapSystem.put(""+rootTree.getId(), org);
		SysDepartment sySdept = new SysDepartment();
		sySdept.setCode(dept.getUnitCode());
		sySdept.setNode(rootTree);
		sySdept.setDesc(dept.getDescription());
		sySdept.setName(dept.getDescription());
		sySdept.setFincode(dept.getFinUnitCode());
		create( sySdept);
		return dept.getTreeId();
	}
	
	
	/**
	 * 
	 * @param org
	 * @return
	 */
	private int saveToSystem(ORGElement org){
		MstDepartment dept=org.getDept();
		if(org.getParent()==null)return -1;
		int ptid =org.getParent().getDept().getDeptid();
		if(ptid<1){
			ptid= saveToSystem(org.getParent());
		}
		if(ptid<1){
			System.out.println(dept.getDescription()+"�Ҳ������ڵ�!");
			return -1;
			}
		if(dept.getDeptid()>0)return dept.getDeptid();
		SysTree st = sysTreeService.findById(ptid);
		SysTree rootTree = new SysTree();
		rootTree.setCode(""+dept.getUnitId());
		rootTree.setDeep(dept.getUnitLevel());
		rootTree.setName(dept.getDescription());
		rootTree.setParent(ptid);
		sysTreeService.create(rootTree);
		SysDepartment sySdept = new SysDepartment();
		sySdept.setCode(dept.getUnitCode());
		sySdept.setNode(rootTree);
		sySdept.setDesc(dept.getDescription());
		sySdept.setName(dept.getDescription());
		sySdept.setFincode(dept.getFinUnitCode());
		create( sySdept);
		dept.setDeptid((int)sySdept.getId());
		this.abstractDao.update(dept);
		ORGElement.deptMapSystem.put(""+rootTree.getId(), org);
		return dept.getDeptid();
	}
	
}
