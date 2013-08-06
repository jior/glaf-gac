package menuBuild;

import java.util.*;



import sysSrc.common.login.SimpleJson;

public class builMenu {

	

	// 根据list中的每一个JSON构造Accirdion的PANEL
	public String buildAccordionPanel(List<SimpleJson> list)  {
		String sMenu ="";
		if (list != null) {
			for (SimpleJson sj : list) {
				 sMenu += "<div title=\""+sj.getName()+"\" data-options=\"iconCls:'icon-blank'\" style=\"padding:10px;\"><ul class=\"easyui-tree\">"
						;
				//pw.write(sMenu);
				if (sj.getChildren() != null) {
					sMenu+=buildTreeMenu(sj.getChildren());
				}
				sMenu+=("</ul></div>");
			}
		}
		return sMenu;
	}

	private String buildTreeMenu(SimpleJson[] menuArr) {
		//System.out.print("");
		StringBuilder sb=new StringBuilder();
		String beginTag, endTag;
		for (SimpleJson childMenu : menuArr) {
			boolean haschild = hasChild(childMenu);
			if (haschild) {
				beginTag = "<li><span>";
				endTag = "</span><ul>";
			} else {
				beginTag = "<li>";
				endTag = " </li>";
			}
			//pw.write(beginTag);
			sb.append(beginTag);
			//pw.write(childMenu.getName());
			sb.append("<a href=\"#\" onclick=\"goUrl('"+childMenu.getUrl()+"');return false\">"+childMenu.getName()+"</a>");
			//pw.write(endTag);
			sb.append(endTag);
			if (haschild) {
				sb.append(buildTreeMenu(childMenu.getChildren()));
			}
			if (haschild) {
				//pw.write("</ul>");
				sb.append("</ul>");
			}
		}
		return sb.toString();
		 //pw.write("</ul> ");
	}

	// 判断是否有子菜单 返回TRUE 表示有子菜单
	// sj:当前菜单
	private boolean hasChild(SimpleJson sj) {
		SimpleJson[] r = sj.getChildren();
		return null != r && 0 < r.length;
	}
}
