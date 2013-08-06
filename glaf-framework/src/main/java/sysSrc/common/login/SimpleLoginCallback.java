package sysSrc.common.login;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONArray;

import sysSrc.common.SysBaseCom;
import sysSrc.orm.TPrivilege;
import sysSrc.orm.TRolePrivilege;
import sysSrc.orm.TUsersRole;

import baseSrc.common.BaseCom;
import baseSrc.framework.BaseActionForm;
import baseSrc.framework.BaseConstants;

import com.glaf.base.business.ApplicationBean;
import com.glaf.base.callback.LoginCallback;
import com.glaf.base.modules.sys.model.SysUser;
public class SimpleLoginCallback implements LoginCallback {
	private static final Log logger = LogFactory.getLog(SimpleLoginCallback.class);

	public void afterLogin(SysUser loginUser, HttpServletRequest request,
			HttpServletResponse response) {
		logger.debug(loginUser.getName() + " is Login. ");
		ApplicationBean bean = new ApplicationBean(); 
		JSONArray array = bean.getUserMenu(3, loginUser.getAccount());
		BaseActionForm b = new BaseActionForm();
		b.setRecordsJsonStr(array.toString());
		List<SimpleJson> list = b.getGridList(SimpleJson.class);
		
		
		SysBaseCom baseCom = new SysBaseCom();
		
		baseCom.setUserId(loginUser.getAccount());
		baseCom.setUserName(loginUser.getName());
		baseCom.setIp(loginUser.getLoginIP());
		baseCom.setEmail(loginUser.getEmail());
		
		// 获取当前登录者拥有的所有权限，并放入session中
		baseCom.setFlg(true);
		//设置用户基本信息
		request.getSession().setAttribute(BaseConstants.ISC_BASE_BEANCOM_ID, baseCom);
		//设置用户menu
		request.getSession().setAttribute(BaseConstants.ISC_BASE_BEANCOM_MENU, list);
		logger.info("JSONArray :" + array);
	}
}
