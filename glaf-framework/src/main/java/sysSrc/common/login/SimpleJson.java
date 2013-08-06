package sysSrc.common.login;

import java.io.Serializable;

public class SimpleJson implements Serializable {

	private SimpleJson[] children;
	private String description;
	private String name;
	private String nodeId;
	private String showMenu;
	private String sort;
	private String url;

	
	public SimpleJson[] getChildren() {
		return children;
	}
	public void setChildren(SimpleJson[] children) {
		this.children = children;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getNodeId() {
		return nodeId;
	}
	public void setNodeId(String nodeId) {
		this.nodeId = nodeId;
	}
	public String getShowMenu() {
		return showMenu;
	}
	public void setShowMenu(String showMenu) {
		this.showMenu = showMenu;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
}
