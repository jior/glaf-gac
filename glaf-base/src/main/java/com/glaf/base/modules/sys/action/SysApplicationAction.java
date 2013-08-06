package com.glaf.base.modules.sys.action;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionMessage;
import org.apache.struts.action.ActionMessages;
import org.springframework.web.struts.DispatchActionSupport;

import com.glaf.base.modules.Constants;
import com.glaf.base.modules.sys.model.SysApplication;
import com.glaf.base.modules.sys.model.SysTree;
import com.glaf.base.modules.sys.service.SysApplicationService;
import com.glaf.base.modules.sys.service.SysTreeService;
import com.glaf.base.utils.PageResult;
import com.glaf.base.utils.ParamUtil;

public class SysApplicationAction extends DispatchActionSupport{
	private static final Log logger = LogFactory.getLog(SysApplicationAction.class);
	private SysApplicationService sysApplicationService;
	private SysTreeService sysTreeService;
	
	public void setSysApplicationService(SysApplicationService sysApplicationService){
		this.sysApplicationService = sysApplicationService;
		logger.info("setSysApplicationService");
	}
	public void setSysTreeService(SysTreeService sysTreeService) {
		this.sysTreeService = sysTreeService;
		logger.info("setSysTreeService");
	}
	
	/**
	 * ��ʾ�����б�
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward showList(
		      ActionMapping mapping,
		      ActionForm actionForm,
		      HttpServletRequest request,
		      HttpServletResponse response) throws Exception{
		int parent = ParamUtil.getIntParameter(request, "parent", 0);
		int pageNo = ParamUtil.getIntParameter(request, "page_no", 1);
		int pageSize = ParamUtil.getIntParameter(request, "page_size", Constants.PAGE_SIZE);		
		PageResult pager = sysApplicationService.getApplicationList(parent, pageNo, pageSize);
		request.setAttribute("pager", pager);
		//��ʾ�б�ҳ��
		return mapping.findForward("show_list");
	}
	/**
	 * ��ʾ����ҳ��
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward prepareAdd(
		      ActionMapping mapping,
		      ActionForm actionForm,
		      HttpServletRequest request,
		      HttpServletResponse response) throws Exception{		
		return mapping.findForward("show_add");
	}
	/**
	 * �ύ������Ϣ
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward saveAdd(
		      ActionMapping mapping,
		      ActionForm actionForm,
		      HttpServletRequest request,
		      HttpServletResponse response) throws Exception{
		SysApplication bean = new SysApplication();
		bean.setName(ParamUtil.getParameter(request, "name"));
		bean.setDesc(ParamUtil.getParameter(request, "desc"));
		bean.setUrl(ParamUtil.getParameter(request, "url"));
		bean.setShowMenu(ParamUtil.getIntParameter(request, "showMenu", 0));
		
		SysTree node = new SysTree();
		node.setName(bean.getName());
		node.setDesc(bean.getName());
		node.setCode("");
		node.setParent((long)ParamUtil.getIntParameter(request, "parent", 0));		
		bean.setNode(node);
		
		boolean ret = sysApplicationService.create(bean);
		ActionMessages messages = new ActionMessages();
		if(ret){//����ɹ�		
			messages.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("application.add_success"));
		}else{//����ʧ��
			messages.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("application.add_failure"));
		}
		addMessages(request, messages);
		return mapping.findForward("show_msg");
	}
	/**
	 * ��ʾ�޸�ҳ��
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward prepareModify(
		      ActionMapping mapping,
		      ActionForm actionForm,
		      HttpServletRequest request,
		      HttpServletResponse response) throws Exception{
		long id = ParamUtil.getIntParameter(request, "id", 0);
		SysApplication bean = sysApplicationService.findById(id);
		request.setAttribute("bean", bean);
		
		SysTree parent = sysTreeService.getSysTreeByCode(Constants.TREE_APP);
		List list = new ArrayList();
		parent.setDeep(0);
		list.add(parent);
		sysTreeService.getSysTree(list, (int)parent.getId(), 1);
		request.setAttribute("parent", list);
		
		return mapping.findForward("show_modify");
	}
	/**
	 * �ύ�޸���Ϣ
	 * @param mapping
	 * @param form
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward saveModify(
		      ActionMapping mapping,
		      ActionForm actionForm,
		      HttpServletRequest request,
		      HttpServletResponse response) throws Exception{	
		long id = ParamUtil.getIntParameter(request, "id", 0);
		SysApplication bean = sysApplicationService.findById(id);
		if(bean!=null){				
			bean.setName(ParamUtil.getParameter(request, "name"));
			bean.setDesc(ParamUtil.getParameter(request, "desc"));
			bean.setUrl(ParamUtil.getParameter(request, "url"));
			bean.setShowMenu(ParamUtil.getIntParameter(request, "showMenu", 0));
			
			SysTree node =bean.getNode();
			node.setName(bean.getName());
			node.setDesc(bean.getName());
			node.setParent((long)ParamUtil.getIntParameter(request, "parent", 0));			
			bean.setNode(node);
		} 			
		boolean ret = sysApplicationService.update(bean);		
		ActionMessages messages = new ActionMessages();		
		if(ret){//����ɹ�		
			messages.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("application.modify_success"));
		}else{//����ʧ��
			messages.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("application.modify_failure"));
		}
		addMessages(request, messages);
		return mapping.findForward("show_msg");
	}
	/**
	 * ����ɾ����Ϣ
	 * @param mapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward batchDelete(
		      ActionMapping mapping,
		      ActionForm actionForm,
		      HttpServletRequest request,
		      HttpServletResponse response) throws Exception{		
		boolean ret = true;
		long[] id = ParamUtil.getLongParameterValues(request, "id");
		ret = sysApplicationService.deleteAll(id);
		
		ActionMessages messages = new ActionMessages();
		if(ret){//����ɹ�
			messages.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("application.delete_success"));
		}else{//����ʧ��
			messages.add(ActionMessages.GLOBAL_MESSAGE, new ActionMessage("application.delete_failure"));
		}
		addMessages(request, messages);
		return mapping.findForward("show_msg2");
	}	
	/**
	 * ��ʾ���ҳ��
	 * @param mapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward showPermission(
		      ActionMapping mapping,
		      ActionForm actionForm,
		      HttpServletRequest request,
		      HttpServletResponse response) throws Exception{
		return mapping.findForward("show_permission");
	}
	/**
	 * ��ʾ���ҳ��
	 * @param mapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward showFrame(
		      ActionMapping mapping,
		      ActionForm actionForm,
		      HttpServletRequest request,
		      HttpServletResponse response) throws Exception{
		String  id =request.getParameter("parent");
		String parent=id==null?Constants.TREE_APP:id;
		String url=request.getParameter("url");
		String action=request.getParameter("action");
		SysTree bean = sysTreeService.getSysTreeByCode(parent);
		if(bean!=null)
		request.setAttribute("parent", bean.getId()+"");
		request.setAttribute("url", url);
		return mapping.findForward("show_frame");
	}
	
	
	/**
	 * ��ʾ���ҳ��
	 * @param mapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward showBase(
		      ActionMapping mapping,
		      ActionForm actionForm,
		      HttpServletRequest request,
		      HttpServletResponse response) throws Exception{		
		return mapping.findForward("show_base");
	}
	/**
	 * ��ʾ������Ŀ�����˵�
	 * @param mapping
	 * @param actionForm
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	public ActionForward showNavMenu(
		      ActionMapping mapping,
		      ActionForm actionForm,
		      HttpServletRequest request,
		      HttpServletResponse response) throws Exception{
		int parent = ParamUtil.getIntParameter(request, "parent", 0);		
		List list = new ArrayList();
		sysTreeService.getSysTree(list, parent, 0);
		request.setAttribute("list", list);
		return mapping.findForward("show_nav");
	}	
}