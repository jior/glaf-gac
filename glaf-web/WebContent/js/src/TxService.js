var AppCode = "glaf-web";   //��Ŀ���

/**
 * Ajaxҵ������
 * created by kxr 20090320
 */
TxService = {
	xResult : null,
	
	/**
	 * ���ܣ�����Ajax�첽����xmlhttp
	 * @return
	 */
	create : function()
	{		
		if(this.xmlHttp)
			return true;
		
		if(window.XMLHttpRequest) {
			this.xmlHttp = new XMLHttpRequest();
		}
		if(!this.xmlHttp) {
			this.xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			if(!this.xmlHttp) {
				this.xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
				if(!this.xmlHttp){
					this.xmlHttp = new ActiveXObject("Msxml2.XMLHTTP.3.0");
				}
			}
		}
		if(!this.xmlHttp) {
			alert("���������汾̫�ͣ������������XMLHttpRequest ActiveX���������ҳ��");
			return false;
		}
		
		return true;
	},
	/**
	 * ���ܣ��ύ���
	 * @param doc
	 * @return
	 */
	postXML : function(doc, fn, reqtype){
		try{
			var xResult;
			if(this.create()) {
				var reqUrl = doc.documentElement.getAttribute("url");
				if(!reqUrl) reqUrl = "/" + AppCode + "/sv";
				else reqUrl = "/" + AppCode + reqUrl;
		
				if(!fn){//ͬ���ύ
					//alert('ͬ���ύ���');
					this.xmlHttp.open("POST", reqUrl, false);
					if(!reqtype){
						this.xmlHttp.setRequestHeader("content-type","text/xml");
					} else {
						this.xmlHttp.setRequestHeader("content-type",reqtype);
					}
					this.xmlHttp.send(doc);
					if(!reqtype){
						return this.xmlHttp.responseXML;	
					} else {
						return this.xmlHttp.responseText;
					}
				}else{	//�첽�ύ
					//alert('�첽�ύ���');
					var onReadyState = (function(obj, fn, checkFn) {
						return function () {
							try {
								if (obj.readyState == 4) {
									var xRs = obj.responseXML;
									checkFn(xRs);
									if (typeof fn.ok == "string") {
										eval(fn.ok + "(xResult);");
									} else {
										fn.ok(xRs);
									}
									xRs = null;
									fn.ok = null;
									fn.err = null;
									fn = null;									
									obj = null;	
									checkFn = null;												
								}
							}catch(exception){
								alert(exception);
								if (typeof fn.err == "string") {
									eval(fn.err + "(xResult, exception);");
								} else {
									fn.err(xRs, exception);
								}
								fn.ok = null;
								fn.err = null;
								fn = null;									
								obj = null;		
								checkFn = null;												
							}
						}
					})(this.xmlHttp, fn, this.checkResult);
					this.xmlHttp.onreadystatechange = onReadyState;
					this.xmlHttp.open("POST", reqUrl, true);
					this.xmlHttp.send(doc);
					onReadyState = null;	
				}
			}	
		}catch(ex){
			throw ex;
		}
	},
	
	/**
	 * ���ܣ���ȡָ��·��ҳ���ı�
	 * @param url
	 * @return
	 */
	getText : function(url, fn) {
		try{
			var xResult = url ? url : "";	
			
			if(this.create()){				
				if(!fn){//ͬ���ύ
					this.xmlHttp.open("POST", reqUrl, false);
					this.xmlHttp.send();
					xResult = this.xmlHttp.responseText;	
					this.xmlhttp = null;
					
					return xResult;
				}else{	//�첽�ύ
					var onReadyState = (function(obj, fn, checkFn) {
						return function () {
							try {
								if (obj.readyState == 4) {
									var xRs = obj.responseXML;
									checkFn(xRs);
									if (typeof fn.ok == "string") {
										eval(fn.ok + "(xResult);");
									} else {
										fn.ok(xRs);
									}
									xRs = null;
									fn.ok = null;
									fn.err = null;
									fn = null;									
									obj = null;	
									checkFn = null;												
								}
							}catch(exception) {
								if (typeof fn.err == "string") {
									eval(fn.err + "(xResult, exception);");
								} else {
									fn.err(xRs, exception);
								}
								fn.ok = null;
								fn.err = null;
								fn = null;									
								obj = null;		
								checkFn = null;												
							}
						}
					})(XMLHttp, fn, this.checkResult);
					this.xmlHttp.onreadystatechange = onReadyState;
					this.xmlHttp.open("POST", reqUrl, true);
					this.xmlHttp.send();
					onReadyState = null;	
					this.xmlHttp = null;
					url = null;
					fn = null;
				}
				
				
				this.xmlHttp.open("POST",url,false);
				this.xmlHttp.send();
				xResult = this.xmlHttp.responseText;
			}
			
			return xResult;
		}catch(ex) {
			throw ex;
		}
	},
	
	/** =====================================================================
	 * ������: checkResult
	 * ������: kxr
	 * ����ʱ��: 2010-05-20
	 * ����: ����̨���ص�XML�����Ƿ�����嶨������Ϣ
	 * ����: doc ��̨���ص�XML����
	 * =====================================================================
	 */			
	checkResult: function(doc)
	{
		try {
			var root = doc.documentElement;
			var sErrNo = root.getAttribute("number");  
			if (sErrNo && (sErrNo != 0))
			{
				var sSource = "Source: " + root.getAttribute("source");
				var sErrDesc = "Reason: "+ root.getAttribute("description");
				sErrDesc = sSource + "\n" + sErrDesc;
				GzkEx.doThrow(sErrNo, sErrDesc, "TxService.checkResult");
			}
		} 
		catch(exception) {
			GzkEx.doAlert(exception, "TxService.checkResult");
		}
	}
};