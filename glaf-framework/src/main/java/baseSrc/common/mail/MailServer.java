/**
 * 邮件服务器信息
 * 本类主要用于获取邮件服务器信息实体以及保存服务器的设置
 * MailServer.java（类名）
 * 1.0.1.0（版本）
 * 作成者：ISC)xm
 * 作成时间：2012-03-03
 * 修改履历：
 *       年   月 日 区分 所 属/担 当   内 容                             版本号
 *     ---------- ---- ----------- ------------------------------  -----------
 */
package baseSrc.common.mail;

import baseSrc.common.LogHelper;
import java.io.File;
import java.io.Serializable;
import java.util.Iterator;
import org.dom4j.Document;
import org.dom4j.Element;
import org.dom4j.io.SAXReader;


/**
 * 
 * 邮件服务器信息 本类主要用于获取邮件服务器信息实体以及保存服务器的设置
 * 
 */
public class MailServer implements Serializable {
	private static LogHelper logger = new LogHelper(MailServer.class);

	private static final long serialVersionUID = 1L;

	private static final String Df_KeyId = "DEFAULT_MAIL";
	private static final String Df_ServerPort = "25";
	private static final String configFileXml = "mailServicesConfig.xml";
	private String configFile ="";
	private String serverPort = Df_ServerPort;
	private String serverip = "";
	private String username = "";
	private String password = "";
	private String sendername = "";
	private String repeatmail = "";
	//ISC)TXT 2012-12-24 追加mailAddr属性 start
	private String mailAddr = "";
	//ISC)TXT 2012-12-24 追加mailAddr属性 end
	private String mailKey = Df_KeyId;

	public MailServer(String mailKey) {
		if (mailKey != null && mailKey.trim().length() > 0) {
			this.mailKey = mailKey;
		} else {
			this.mailKey = Df_KeyId;
		}
	}

	public MailServer() {
		this.mailKey = Df_KeyId;
	}

	/**
	 * @throws Exception 
	 * 获取一个邮件服务器信息实体
	 * @throws  Exception
	 * 
	 */
	public void loadMailServer() throws Exception{
		// 获取部署后路径
		String ProjectPath = new File(getClass().getClassLoader().getResource(
				"").toURI()).getPath();
		// 设置配置文件路径
		this.configFile = ProjectPath + System.getProperty("file.separator") + configFileXml;
		logger.info("configFile:"+this.configFile);
		File f = new File(this.configFile);
		SAXReader reader = new SAXReader();
		Document doc = reader.read(f);
		Element root = doc.getRootElement();
		Element fooA;

		for (Iterator i = root.elementIterator("mail"); i.hasNext();) {
			fooA = (Element) i.next();
			if (this.mailKey.equals(fooA.attributeValue("key_id"))) {
				//ISC)TXT 2012-12-24 追加mailAddr属性 start
				this.setMailAddr(fooA.elementText("mailaddr"));
				//ISC)TXT 2012-12-24 追加mailAddr属性 end
				this.setServerip(fooA.elementText("serverip"));
				this.setUsername(fooA.elementText("username"));
				this.setPassword(fooA.elementText("password"));
				this.setServerPort(fooA.elementText("port"));
				break;
			}
		}
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRepeatmail() {
		return repeatmail;
	}

	public void setRepeatmail(String repeatmail) {
		this.repeatmail = repeatmail;
	}

	public String getSendername() {
		return sendername;
	}

	public void setSendername(String sendername) {
		this.sendername = sendername;
	}

	public String getServerip() {
		return serverip;
	}

	public void setServerip(String serverip) {
		this.serverip = serverip;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getServerPort() {
		return serverPort;
	}

	public void setServerPort(String serverPort) {
		this.serverPort = serverPort;
	}
	//ISC)TXT 2012-12-24 追加mailAddr属性 start

	public String getMailAddr() {
		return mailAddr;
	}

	public void setMailAddr(String mailAddr) {
		this.mailAddr = mailAddr;
	}
	//ISC)TXT 2012-12-24 追加mailAddr属性 end
}
