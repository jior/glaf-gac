package com.glaf.base.modules.sys.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.glaf.base.dao.AbstractSpringDao;
import com.glaf.base.modules.sys.SysConstants;
import com.glaf.base.modules.sys.model.SysDepartment;
import com.glaf.base.modules.sys.model.SysDeptRole;
import com.glaf.base.modules.sys.model.SysTree;
import com.glaf.base.utils.PageResult;

public class SysDepartmentServiceImpl implements SysDepartmentService {
	private static final Log logger = LogFactory
			.getLog(SysDepartmentServiceImpl.class);
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
	 * 保存
	 * 
	 * @param bean
	 *            SysDepartment
	 * @return boolean
	 */
	public boolean create(SysDepartment bean) {
		boolean ret = false;
		if (abstractDao.create(bean)) {// 插入记录成功
			bean.setSort((int) bean.getId());// 设置排序号为刚插入的id值
			bean.getNode().setSort(bean.getSort());
			abstractDao.update(bean);
			ret = true;
		}
		return ret;
	}

	/**
	 * 更新
	 * 
	 * @param bean
	 *            SysDepartment
	 * @return boolean
	 */
	public boolean update(SysDepartment bean) {
		if (bean.getNode() != null) {
			List<SysTree> sts = (List<SysTree>) this.sysTreeService
					.getSysTreeList((int) bean.getNode().getId());
			if (sts != null && sts.size() > 0) {
				this.updateSubStatus(sts, bean.getStatus());
			}
		}
		return abstractDao.update(bean);
	}

	/**
	 * 修改子部门的状态
	 * 
	 * @param list
	 * @param status
	 * @return
	 */
	private boolean updateSubStatus(List<SysTree> list, Integer status) {
		List<SysTree> sts = null;
		SysDepartment sdp = null;
		for (SysTree st : list) {
			sts = (List<SysTree>) this.sysTreeService.getSysTreeList((int) st
					.getId());
			if (sts != null && sts.size() > 0) {
				this.updateSubStatus(sts, status);
			}
			sdp = st.getDepartment();
			if (sdp != null) {
				sdp.setStatus(status);
				this.update(sdp);
			}
		}
		return true;
	}

	/**
	 * 删除
	 * 
	 * @param bean
	 *            SysDepartment
	 * @return boolean
	 */
	@SuppressWarnings("unchecked")
	public boolean delete(SysDepartment bean) {
		logger.debug("---------------delete dept------------------------");
		List<SysTree> trees = new ArrayList<SysTree>();
		int nodeId = 0;
		if (bean.getNode() != null) {
			nodeId = (int) bean.getNode().getId();
		} else {
			if (bean.getNodeId() != 0) {
				nodeId = (int) bean.getNodeId();
			}
		}
		SysTree root = sysTreeService.getSysTreeWithDept(nodeId);
		if (root != null && root.getDepartment() != null) {
			trees.add(root);
		}
		sysTreeService.getSysTreeWithDepts(trees, nodeId, 0);
		if (trees != null && !trees.isEmpty()) {
			for (SysTree tree : trees) {
				if (tree.getDepartment() != null) {
					SysDepartment dept = tree.getDepartment();
					Object[] values = new Object[] { new Long(dept.getId()) };
					String query = "from SysDeptRole a where a.dept.id=? order by a.sort desc";
					List<SysDeptRole> deptRoles = abstractDao.getList(query,
							values, null);
					if (deptRoles != null && !deptRoles.isEmpty()) {
						for (SysDeptRole deptRole : deptRoles) {
							long deptRoleId = deptRole.getId();
							abstractDao
									.executeSQL(" delete from sys_permission where roleId="
											+ deptRoleId);
							abstractDao
									.executeSQL(" delete from sys_access where roleId="
											+ deptRoleId);
							abstractDao
									.executeSQL(" delete from sys_user_role where roleId="
											+ deptRoleId);
							abstractDao
									.executeSQL(" delete from sys_dept_role where id="
											+ deptRoleId);
						}
					}
					logger.debug("---------------delete users------------------------");
					abstractDao
							.executeSQL(" delete from sys_user where deptId="
									+ dept.getId());
					abstractDao
							.executeSQL(" delete from sys_department where id="
									+ dept.getId());

					abstractDao.executeSQL(" delete from sys_tree where id="
							+ tree.getId());
				}
			}
		}
		return true;
	}

	/**
	 * 删除
	 * 
	 * @param id
	 *            int
	 * @return boolean
	 */
	public boolean delete(long id) {
		SysDepartment bean = findById(id);
		if (bean != null) {
			return delete(bean);
		} else {
			return false;
		}
	}

	/**
	 * 批量删除
	 * 
	 * @param id
	 * @return
	 */
	public boolean deleteAll(long[] id) {
		List list = new ArrayList();
		String ids = "";
		boolean isFirst = true;
		for (int i = 0; i < id.length; i++) {
			logger.info("id:" + id[i]);
			SysDepartment bean = findById(id[i]);
			if (bean != null)
				list.add(bean);
			if (isFirst)
				isFirst = false;
			else
				ids += ",";
			ids += id[i];
		}
		// this.abstractDao.executeSQL("update MST_DEPARTMENT set deptid =0 where deptid in("+ids+")");
		return abstractDao.deleteAll(list);
	}

	/**
	 * 获取对象
	 * 
	 * @param id
	 * @return
	 */
	public SysDepartment findById(long id) {
		return (SysDepartment) abstractDao.find(SysDepartment.class, new Long(
				id));
	}

	/**
	 * 按代码查找对象
	 * 
	 * @param name
	 *            String
	 * @return SysDepartment
	 */
	public SysDepartment findByNo(String code) {
		SysDepartment bean = null;
		Object[] values = new Object[] { code };
		String query = "from SysDepartment a where a.no=? order by a.id asc";
		List list = abstractDao.getList(query, values, null);
		if (list != null && list.size() > 0) {// 有记录
			bean = (SysDepartment) list.get(0);
		}
		return bean;
	}

	/**
	 * 按名称查找对象
	 * 
	 * @param name
	 *            String
	 * @return SysDepartment
	 */
	public SysDepartment findByName(String name) {
		SysDepartment bean = null;
		Object[] values = new Object[] { name };
		String query = "from SysDepartment a where a.name=? order by a.id asc";
		List list = abstractDao.getList(query, values, null);
		if (list != null && list.size() > 0) {// 有记录
			bean = (SysDepartment) list.get(0);
		}
		return bean;
	}

	/**
	 * 获取分页列表
	 * 
	 * @param parent
	 *            int
	 * @param pageNo
	 *            int
	 * @param pageSize
	 *            int
	 * @return
	 */
	public PageResult getSysDepartmentList(int parent, int pageNo, int pageSize) {
		// 计算总数
		Object[] values = new Object[] { new Long(parent) };
		String query = "select count(*) from SysDepartment a where a.node.parent=?";
		int count = ((Long) abstractDao.getList(query, values, null).iterator()
				.next()).intValue();
		if (count == 0) {// 结果集为空
			PageResult pager = new PageResult();
			pager.setPageSize(pageSize);
			return pager;
		}
		// 查询列表
		query = "from SysDepartment a where a.node.parent=? order by a.sort desc";
		return abstractDao.getList(query, values, pageNo, pageSize, count);
	}

	/**
	 * 获取列表
	 * 
	 * @return List
	 */
	public List getSysDepartmentList() {
		String query = "from SysDepartment a ";
		return abstractDao.getList(query, null, null);
	}

	/**
	 * 获取列表
	 * 
	 * @param parent
	 *            int
	 * @return List
	 */
	public List getSysDepartmentList(int parent) {
		// 计算总数
		Object[] values = new Object[] { new Long(parent) };
		String query = "from SysDepartment a where a.node.parent=? order by a.sort desc";
		return abstractDao.getList(query, values, null);
	}

	/**
	 * 排序
	 * 
	 * @param bean
	 *            SysDepartment
	 * @param operate
	 *            int 操作
	 */
	public void sort(long parent, SysDepartment bean, int operate) {
		if (bean == null)
			return;
		if (operate == SysConstants.SORT_PREVIOUS) {// 前移
			sortByPrevious(parent, bean);
		} else if (operate == SysConstants.SORT_FORWARD) {// 后移
			sortByForward(parent, bean);
		}
	}

	/**
	 * 向前移动排序
	 * 
	 * @param bean
	 */
	private void sortByPrevious(long parent, SysDepartment bean) {
		Object[] values = new Object[] { new Long(parent),
				new Integer(bean.getSort()) };
		// 查找前一个对象
		String query = "from SysDepartment a where a.node.parent=? and a.sort>? order by a.sort asc";
		List list = abstractDao.getList(query, values, null);
		if (list != null && list.size() > 0) {// 有记录
			SysDepartment temp = (SysDepartment) list.get(0);
			int i = bean.getSort();
			bean.setSort(temp.getSort());
			abstractDao.update(bean);// 更新bean
			SysTree node = bean.getNode();
			node.setSort(bean.getSort());
			abstractDao.update(node);

			temp.setSort(i);
			abstractDao.update(temp);// 更新temp
			node = temp.getNode();
			node.setSort(temp.getSort());
			abstractDao.update(node);
		}
	}

	/**
	 * 向后移动排序
	 * 
	 * @param bean
	 */
	private void sortByForward(long parent, SysDepartment bean) {
		Object[] values = new Object[] { new Long(parent),
				new Integer(bean.getSort()) };
		// 查找后一个对象
		String query = "from SysDepartment a where a.node.parent=? and a.sort<? order by a.sort desc";
		List list = abstractDao.getList(query, values, null);
		if (list != null && list.size() > 0) {// 有记录
			SysDepartment temp = (SysDepartment) list.get(0);
			int i = bean.getSort();
			bean.setSort(temp.getSort());
			abstractDao.update(bean);// 更新bean
			SysTree node = bean.getNode();
			node.setSort(bean.getSort());
			abstractDao.update(node);

			temp.setSort(i);
			abstractDao.update(temp);// 更新temp
			node = temp.getNode();
			node.setSort(temp.getSort());
			abstractDao.update(node);

		}
	}

	/**
	 * 获取用户部门列表
	 * 
	 * @param list
	 * @param node
	 */
	public void findNestingDepartment(List list, SysDepartment node) {
		if (node == null)
			return;
		SysTree tree = node.getNode();
		if (tree.getParent() == 0) {// 找到根节点
			logger.info("findFirstNode:" + node.getId());
			list.add(node);
		} else {
			SysTree treeParent = sysTreeService.findById(tree.getParent());
			SysDepartment parent = treeParent.getDepartment();
			findNestingDepartment(list, parent);
		}
		list.add(node);
	}

	/**
	 * 部门数据从HR表中添加到系统中
	 */
	public boolean addHRDeptToSystem(String ids[]) {
		throw new java.lang.RuntimeException("Not Support");
	}

	/**
	 * 初始化HR的数据到树中
	 */
	public void updateHRDeptToTree() {
		throw new java.lang.RuntimeException("Not Support");
	}

}
