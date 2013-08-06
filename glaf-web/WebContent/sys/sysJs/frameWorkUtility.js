/*
================================================================================
项目名称 ：   基盘
文件名称 ：   frameWorkUtility.js                                 
描    述 ：   共通函数 
================================================================================================
修改履历                                                                								       
年 月 日		  区分			所 属/担 当                                   内 容									        
----------   ----   ----------------------------------        ---------------                                 
2009/5/7   	  编写   		Intasect/邹一文、廖学志、李闻海                  新規作成                                                                            
================================================================================
 */

/*
 ================================================================================
 功能: 定义根路径 每个项目需要单独定义此项
 ================================================================================
 */
var webroot = "http://" + window.location.host + "/glaf-web";
/*
 * ================================================================================
 * 功能: 在指定ID的控件上显示日历 参数: contralerId 控件ID, style 日期样式("yyyy MM dd"),min
 * 日历开始日期,min 日历结束日期
 * ================================================================================
 */
function showCalendar(contralerId, style, min, max) {
	if (style == null) {
		style = "yyyy-MM-dd";
	}
	if (min == null) {
		min = "1900-01-01";
	}
	if (max == null) {
		max = "2099-12-31";
	}

	var inputBox = document.getElementById(contralerId);
	inputBox.readOnly = true;

	inputBox.onfocus = function() {
		new WdatePicker( {
			el :$dp.$(contralerId),
			qsEnabled :false,
			dateFmt :style,
			minDate :min,
			maxDate :max
		});
	};
}
/*
 * ================================================================================
 * 功能: 锁定画面 参数: title 锁定画面时弹出提示框的标题信息, txt 锁定画面时弹出提示框的内容信息,titleColor
 * 锁定画面时提示框的颜色 * ================================================================================
 */
function lockWindows(title, txt, titleColor,butBack) {
	if (titleColor == null) {
		titleColor = "#3794E8";
	}
	if(butBack == null){
		butBack = "解锁";
	}
	document.body.onkeydown = function() {
		if (window.event.keyCode == 9)
			return false
	};
	document.body.scroll = "no";
	var shield = document.createElement("DIV");
	shield.style.position = "absolute";
	shield.style.left = "0px";
	shield.style.top = "0px";

	shield.style.width = "130%";
	shield.style.height = "130%";
	shield.style.background = "#333";
	shield.style.textAlign = "center";
	shield.style.zIndex = "1";
	shield.style.filter = "alpha(opacity=0)";

	var alertFram = document.createElement("DIV");
	alertFram.style.position = "absolute";
	alertFram.style.left = "50%";
	alertFram.style.top = "50%";
	alertFram.style.marginLeft = "-225px";
	alertFram.style.marginTop = "-75px";
	alertFram.style.width = "450px";
	alertFram.style.height = "150px";
	alertFram.style.background = "#ccc";
	alertFram.style.textAlign = "center";
	alertFram.style.lineHeight = "150px";
	alertFram.style.zIndex = "2";
	strHtml = "  <ul  style=\"list-style:none;margin:0px;padding:0px;width:100%\">\n";
	strHtml += "    <li style=\"background:"
			+ titleColor
			+ ";text-align:left;padding-left:20px;font-weight:bold;height:25px;line-height:25px;border:1px   solid   #F9CADE;\">["
			+ title + "]</li>\n";
	strHtml += "    <li style=\"background:#fff;text-align:center;font-weight:bold;height:120px;line-height:120px;border-left:1px   solid   #F9CADE;border-right:1px   solid   #F9CADE;\">"
			+ txt + "</li>\n";
	
	strHtml += "  </ul>\n";
	alertFram.innerHTML = strHtml;
	 var childDiv = document.createElement("div");
	 childDiv.style.width = '350px';
	 childDiv.style.align = 'right';
	 childDiv.onclick=function(){
		 unLockWindow(shield,alertFram);
	 };
	 
		 
	 childDiv.innerHTML="<input type='button' value='" + butBack + "' name='search' />";
	 alertFram.appendChild(childDiv);
	document.body.appendChild(alertFram);
	document.body.appendChild(shield);
	shield.focus();

	var c = 0;
	this.doAlpha = function() {
		if (c++ > 25) {
			clearInterval(ad);
			return 0;
		}
		shield.style.filter = "alpha(opacity=" + c + ");";
	}
	var ad = setInterval("doAlpha()", 50);

}

function unLockWindow(shield,alertFram){
	document.body.removeChild(shield);
	document.body.removeChild(alertFram);
	
}
/*
 * =========================================================================================================================================
 * 功能: 图片文件上传 参数: callback 方法结束时调用的回调函数,cip 创建者ip,cid 程序id,uid 创建者id,showFlag 是否显示 YES:显示,NO:不显示，默认不显示
 * =========================================================================================================================================
 */
function openIMGUploadWithCallBack(callback, cip, cid, uid, showFlag, type) {
	var url = webroot + '/sys/sysJsp/common/upload/fileUpload.jsp?' + '&cip='
			+ cip + '&cid=' + cid + '&uid=' + uid + '';
	if(showFlag!="YES"){
		url = url + '&rarFlag=YESBYPASSWORD';
	}
	if(type!=null&&type!=""){
		url = url + '&type='+type;
	}
	var arr = window.showModalDialog(url, window, "dialogWidth:" + 450
			+ "px;dialogHeight:" + 330
			+ "px;center:yes;help:no;resizable:no;status:no;scroll:no");
	if (arr) {
		callback(arr,showFlag);
	}
}
/*
 * =======================================================================================
 * 功能: 文件上传 参数: callback 方法结束时调用的回调函数,cip 创建者ip,cid 程序id,uid 创建者id
 * =======================================================================================
 */
function openUploadWithCallBack(callback, cip, cid, uid, type) {
	var url = webroot + '/sys/sysJsp/common/upload/fileUpload.jsp?' + '&cip='
			+ cip + '&cid=' + cid + '&uid=' + uid + '&rarFlag=YESBYPASSWORD';
	if(type!=null&&type!=""){
		url = url + '&type='+type;
	}
	var arr = window.showModalDialog(url, window, "dialogWidth:" + 450
			+ "px;dialogHeight:" + 330
			+ "px;center:yes;help:no;resizable:no;status:no;scroll:no");
	if (arr) {
		callback(arr);
	}
}

/*
 * ============================================================================================
 * 功能: 单个文件上传     参数: callback 方法结束时调用的回调函数,cip 创建者ip,cid 程序id,uid 创建者id
 * ============================================================================================
 */
function openOneUploadWithCallBack(callback, cip, cid, uid, type) {
	var url = webroot + '/sys/sysJsp/common/upload/fileUpload.jsp?' + '&cip='
			+ cip + '&cid=' + cid + '&uid=' + uid + '&rarFlag=YESBYPASSWORD' + '&oneFlag=YES';
	if(type!=null&&type!=""){
		url = url + '&type='+type;
	}
	var arr = window.showModalDialog(url, window, "dialogWidth:" + 450
			+ "px;dialogHeight:" + 330
			+ "px;center:yes;help:no;resizable:no;status:no;scroll:no");
	if (arr) {
		callback(arr);
	}
}

/*
 * ===============================================================================================================
 * 功能: 文件上传并压缩  参数: callback 方法结束时调用的回调函数,cip 创建者ip,cid 程序id,uid 创建者id, rarFlag 压缩标志
 * ===============================================================================================================
 */
function openZIPAfterUploadWithCallBack(callback, cip, cid, uid,zipFileName, type) {
	var url = webroot + '/sys/sysJsp/common/upload/fileUpload.jsp?' + '&cip='
			+ cip + '&cid=' + cid + '&uid=' + uid + '&rarFlag=YESTOZIP' + '&zipFileName=' + zipFileName + '';
	if(type!=null&&type!=""){
		url = url + '&type='+type;
	}
	var arr = window.showModalDialog(url, window, "dialogWidth:" + 450
			+ "px;dialogHeight:" + 330
			+ "px;center:yes;help:no;resizable:no;status:no;scroll:no");
	if (arr) {
		callback(arr);
	}
}

function domReady(f) {
	if (domReady.done)
		return f();
	if (domReady.timer) {
		domReady.ready.push(f);
	} else {
		domReady.ready = [ f ];
		domReady.timer = window.setInterval(isDOMReady, 50);

	}
}
/*
 * ================================================================================
 * 功能: 判断DOM是否加载完成
 * ================================================================================
 */
function isDOMReady() {

	if (domReady.done)
		return false;
	if (document && document.getElementsByTagName && document.getElementById
			&& document.body && typeof (allTypeMessage) != 'undefined') {
		clearInterval(domReady.timer);
		domReady.timer = null;
		for ( var i = 0; i < domReady.ready.length; i = i + 1)
			domReady.ready[i]();
		domReady.ready = null;
		domReady.done = true;
	}
}
function resetObjBackgroundColor(obj) {
	obj.style.backgroundColor = "";
}
function setErrBackgroundColor(obj) {
	obj.style.backgroundColor = "#FF5B5B";
}

function iscInject(aOrgFunc, aBeforeExec, aAtferExec) {
	return function() {
		if (typeof (aBeforeExec) == 'function')
			arguments = aBeforeExec.apply(this, arguments) || arguments;
		var Result, args = [].slice.call(arguments);
		args.push(aOrgFunc.apply(this, args));
		if (typeof (aAtferExec) == 'function')
			Result = aAtferExec.apply(this, args);
		return (typeof (Result) != 'undefined') ? Result : args.pop();
	}
}
function doBeforeHandleErrors(msg, f) {
	newMsg = new Array();
	newMsg[0] = msg[0];
	arguments[0] = newMsg;
	return arguments;
}

var errorObjsTOBeClear = null;
function doAfterHandleErrors(msg, f) {
	setErrBackgroundColor(f);
	if (typeof (errorObjsTOBeClear) != 'undefined'
			&& null != errorObjsTOBeClear) {
		errorObjsTOBeClear.push(f);
	} else {
		errorObjsTOBeClear = [ f ];
	}
	return true;
}
/*
 * ================================================================================
 * 功能: 清除错误消息的颜色
 * ================================================================================
 */
function clearErrorColor() {
	if (typeof (errorObjIds) != 'undefined' && null != errorObjIds) {

		for ( var i = 0; i < errorObjIds.length; i = i + 1) {
			errorObjId = errorObjIds[i].split('$');
			if (typeof (errorObjId[1]) != 'undefined' && null != errorObjId[1]) {
				eval("resetObjBackgroundColor(document.getElementsByName('"
						+ errorObjId[0] + "')[" + errorObjId[1] + "])");
			} else {
				eval("resetObjBackgroundColor(document.getElementsByName('"
						+ errorObjId + "')[0])");
			}
		}
	}
	if (typeof (errorObjsTOBeClear) != 'undefined'
			&& null != errorObjsTOBeClear) {

		for ( var i = 0; i < errorObjsTOBeClear.length; i = i + 1) {
			resetObjBackgroundColor(errorObjsTOBeClear[i]);
		}
	}

}

function injectHandleErrors() {
	if (typeof (jcv_handleErrors) != 'undefined'
			&& typeof (jcv_handleErrors) == 'function') {
		jcv_handleErrors = iscInject(jcv_handleErrors, doBeforeHandleErrors,
				doAfterHandleErrors);
	}
}
/*
 * ================================================================================
 * 功能: 焦点移动到错误的输入项
 * ================================================================================
 */
function setErrorFocus() {
	if (typeof (errorObjIds) != 'undefined' && null != errorObjIds) {

		for ( var i = 0; i < errorObjIds.length; i = i + 1) {
			errorObjId = errorObjIds[i].split('$');
			if (typeof (errorObjId[1]) != 'undefined' && null != errorObjId[1]) {
				eval("setErrBackgroundColor(document.getElementsByName('"
						+ errorObjId[0] + "')[" + errorObjId[1] + "])");
			} else {
				eval("setErrBackgroundColor(document.getElementsByName('"
						+ errorObjId + "')[0])");
			}
		}

		errorObjId = errorObjIds[0].split('$');
		if (typeof (errorObjId[1]) != 'undefined' && null != errorObjId[1]) {
			eval("document.getElementsByName('" + errorObjId[0] + "')["
					+ errorObjId[1] + "].focus()");
		} else {
			eval("document.getElementsByName('" + errorObjId + "')[0].focus()");
		}

	}
}
/*
 * ================================================================================
 * 功能: 用于提示后台传递的消息
 * ================================================================================
 */
function showAllTypeMessage() {
	if (typeof (allTypeMessage) != 'undefined' && null != allTypeMessage
			&& "" != allTypeMessage) {
		if (typeof (conFromCallBackType) != 'undefined' && null != conFromCallBackType
				&& "" != conFromCallBackType && "null" != conFromCallBackType) {
			if(confirm(allTypeMessage)){
				if (typeof (conFromCallBackYes) == 'undefined' || null == conFromCallBackYes
						|| "" == conFromCallBackYes) {
					alert("请实现JS方法: conFromCallBackYes()。");
				}else{
					if(typeof(eval(conFromCallBackYes))=="function"){
						conFromCallBackYes();
					}
				}
			}else{
				if (typeof (conFromCallBackNo) == 'undefined' || null == conFromCallBackNo
						|| "" == conFromCallBackNo) {
					alert("请实现JS方法: conFromCallBackNo()。");
				}else{
					if(typeof(eval(conFromCallBackNo))=="function"){
						conFromCallBackNo();
					}
				}
			}
		}else{
			alert(allTypeMessage);
		}
		
	}
	
}
/*
 * ================================================================================
 * 功能: 提交表单 参数: frm 表单对象,msg 提交时所要显示的消息
 * ================================================================================
 */
function submitForm(frm, msg) {
	if (typeof (submitForm.flgSubmitControl) != 'undefined'
			&& null != submitForm.flgSubmitControl) {
		if (submitForm.flgSubmitControl > 0) {
			if (typeof (msg) != 'undefined'
					&& "" != submitForm.flgSubmitControl) {
				alert(msg);
			}
			return false;
		}
	}
	submitForm.flgSubmitControl = 1;
	frm.submit();
}

/*
 * ================================================================================
 * 功能: 数字格式化  参数: number 数值,preset 小数位数
 * ================================================================================
 */
function formatNum(number, preset) {
	//保留小数位数：-1表示preset入参为undefined
	var prst = -1;
	//10的乘法变量
	var tens = 1;
	
	if (preset != undefined) {
		prst = preset;
	}
	
	//去掉逗号等其他字符
	number = number.replace(/\,/g, "");
	if (isNaN(number) || number == "")
		//不为数字返回空值
		return "";
	
	// 小数保留位数大于0时处理小数位
	if (prst > 0) {
		var i;
		for (i = 0; i < prst; i++) {
			tens = tens * 10;
		}
		number = Math.round(number * tens) / tens;
	}
	
	// 小数保留位数为0即为整数时处理小数位
	if (prst == 0) {
		number = Math.round(number);
	}
	
	if (number < 0)
		//为负数时处理
		return '-' + outputInteger(Math.floor(Math.abs(number) - 0) + '')
				+ outputCents((Math.abs(number) - 0), prst);
	else
		//为正数时处理
		return outputInteger(Math.floor(number - 0) + '')
				+ outputCents((number - 0), prst);
}

// 整数位处理，注意该函数为函数【formatNum】的私有函数
function outputInteger(number) {
	//数位小于等于3直接处理
	if (number.length <= 3)
		return (number == '' ? '0' : number);
	else {
		//数位大于3加逗号处理
		var mod = number.length % 3;
		var output = (mod == 0 ? '' : (number.substring(0, mod)));
		for (i = 0; i < Math.floor(number.length / 3); i++) {
			if ((mod == 0) && (i == 0))
				output += number.substring(mod + 3 * i, mod + 3 * i + 3);
			else
				output += ',' + number.substring(mod + 3 * i, mod + 3 * i + 3);
		}
		return (output);
	}
}

//小数位处理，注意该函数为函数【formatNum】的私有函数
function outputCents(amount, prst) {
	// 保留小数位数为0时，小数位直接返回空值
	if (prst == 0) {
		return "";
	}
	
	var str = new String(amount);
	var ic = str.indexOf('.');
	var i = 0;
	var rtd = ".";
	
	// 保留小数位数未设置时处理
	if (prst == -1) {
		//无小数返回空值
		if (ic == -1) {
			return "";
		}
		//小数存在时，返回加点小数位值
		str = str.substring(ic + 1);
		if (str.length > 0) {
			return ('.' + str);
		}
		return "";
	}
	
	//保留小数位数大于0时处理：
	// 小数位待补充部分
	for (i = 0; i < prst; i++) {
		rtd = rtd + "0";
	}
	
	// 处理补0部分
	if (prst > 0) {
		if (ic == -1)
			return rtd;
		str = str.substring(ic + 1);
		return ('.' + str + rtd.substring(str.length + 1));
	}
}

/*
 * ================================================================================
 * 功能: LTrim  参数: string 
 * ================================================================================
 */
function LTrim(str)
{
    var i;
    for(i=0;i<str.length;i++)
    {
        if(str.charAt(i)!=" "&&str.charAt(i)!=" ")break;
    }
    str=str.substring(i,str.length);
    return str;
}
/*
 * ================================================================================
 * 功能: RTrim  参数: string 
 * ================================================================================
 */
function RTrim(str)
{
    var i;
    for(i=str.length-1;i>=0;i--)
    {
        if(str.charAt(i)!=" "&&str.charAt(i)!=" ")break;
    }
    str=str.substring(0,i+1);
    return str;
}
/*
 * ================================================================================
 * 功能: Trim  参数: string 
 * ================================================================================
 */
function Trim(str)
{
    return LTrim(RTrim(str));
}

//DIV收缩
var iscObjectOpenDivStartTime;
var iscObjectOpenDivPanelObj_X;
var iscObjectOpenDivShowObj_X;
var iscObjectOpenDivPanelObj_Y;
var iscObjectOpenDivShowObj_Y;
var iscObjectOpenDivShowHeight;
var iscObjectOpenDivPanelHeight;
var iscObjectOpenDivShowWidth;
var iscObjectOpenDivPanelWidth;
var iscObjectOpenDivDuration_ms;
var iscObjectOpenDivIsExtends_X = true;
var iscObjectOpenDivIsExtends_Y = true;
/*
 * ==========================================================================================================
 * 功能: 控制DIV宽度的扩展与收缩  参数: searchDiv:扩展与收缩的DIV， showDiv：searchDiv变化时，该DIV的 大小自动改变
 * ==========================================================================================================
 */
function closeOrOpenDivByX(searchDiv,showDiv){
	iscObjectOpenDivAAAA(.5,searchDiv,showDiv,'X');
}
/*
 * ==========================================================================================================
 * 功能: 控制DIV高度的扩展与收缩  参数: searchDiv:扩展与收缩的DIV， showDiv：searchDiv变化时，该DIV的 大小自动改变
 * ==========================================================================================================
 */
function closeOrOpenDivByY(searchDiv,showDiv){
	iscObjectOpenDivAAAA(.5,searchDiv,showDiv,'Y');
}
function iscObjectOpenDivAAAA(dur,searchDiv,showDiv,flag){
    iscObjectOpenDivStartTime = new Date();
    //设置展开的速度
    iscObjectOpenDivDuration_ms = dur * 1000;
    	//纵向展开
    	if(flag=='Y'){
    		//展开的DIV
    		iscObjectOpenDivPanelObj_Y = document.getElementById(searchDiv);
    		iscObjectOpenDivShowObj_Y = document.getElementById(showDiv);
    		//如果为收缩
    		if(iscObjectOpenDivIsExtends_Y){
    		 //记录收缩DIV的高度
    		 iscObjectOpenDivPanelHeight = parseInt(iscObjectOpenDivPanelObj_Y.offsetHeight);
    		 if(iscObjectOpenDivShowObj_Y){
    			 iscObjectOpenDivShowHeight = parseInt(iscObjectOpenDivShowObj_Y.offsetHeight);
    		 }
    		 //执行收缩
    	     iscObjectOpenDivBBBB_Y();
    	    }else{
    	    	iscObjectOpenDivShowHeight = parseInt(iscObjectOpenDivShowObj_Y.offsetHeight) - iscObjectOpenDivPanelHeight;
    	    	//执行展开
    	    	iscObjectOpenDivCCCC_Y();
    	    }
    	}else{
    		//展开的DIV
    		iscObjectOpenDivPanelObj_X = document.getElementById(searchDiv);
    	    iscObjectOpenDivShowObj_X = document.getElementById(showDiv);
    	    //如果为收缩
    		if(iscObjectOpenDivIsExtends_X){
    		//记录收缩DIV的宽度
    		iscObjectOpenDivPanelWidth = parseInt(iscObjectOpenDivPanelObj_X.offsetWidth);
    		if(iscObjectOpenDivShowObj_X){
   	     		iscObjectOpenDivShowWidth = parseInt(iscObjectOpenDivShowObj_X.offsetWidth);
    		}
    		//执行收缩
   	     	iscObjectOpenDivBBBB_X();
    		}else{
    			//执行展开
    	    	iscObjectOpenDivCCCC_X();
    	    }
    	}
}

/*
 * ===============================================================================================================
 * iscObjectOpenDivH 高的相反数，iscObjectOpenDivF 时间差毫秒数，iscObjectOpenDivG总共时间毫秒数，iscObjectOpenDivE高
 * ===============================================================================================================
 */
var iscObjectOpenDivEE = function(iscObjectOpenDivF, iscObjectOpenDivE, iscObjectOpenDivH, iscObjectOpenDivG){
	return -1 * iscObjectOpenDivH * (iscObjectOpenDivF /= iscObjectOpenDivG) * (iscObjectOpenDivF - 2) + iscObjectOpenDivE;
}

var iscObjectOpenDivIndex = 0;
function iscObjectOpenDivBBBB_Y(){
    if(iscObjectOpenDivIndex < iscObjectOpenDivDuration_ms){
    	iscObjectOpenDivIndex++;
        
        var curDate = new Date();
        var diffMS = Math.abs(curDate - iscObjectOpenDivStartTime);
        var diffMS_Index = 0;
        if(diffMS < iscObjectOpenDivDuration_ms){
            diffMS_Index =  Math.round(diffMS - iscObjectOpenDivIndex);
        }else{
        	diffMS_Index =  Math.round(iscObjectOpenDivDuration_ms - (iscObjectOpenDivIndex + 1));
        }
        
        if(diffMS_Index > 0){
           iscObjectOpenDivIndex += diffMS_Index;
        }
        var curHeight = iscObjectOpenDivEE(iscObjectOpenDivIndex, iscObjectOpenDivPanelHeight, (-iscObjectOpenDivPanelHeight), iscObjectOpenDivDuration_ms);
        iscObjectOpenDivPanelObj_Y.style.height = curHeight + "px";
        if(iscObjectOpenDivShowObj_Y){
        	iscObjectOpenDivShowObj_Y.style.height = iscObjectOpenDivShowHeight + iscObjectOpenDivPanelHeight - curHeight + "px";
        }
        
        window.setTimeout(iscObjectOpenDivBBBB_Y, 0);
    }else{
    	iscObjectOpenDivPanelObj_Y.style.height = 0 + "px";
        iscObjectOpenDivIndex = 0;
        iscObjectOpenDivIsExtends_Y = false;
    }
}

function iscObjectOpenDivCCCC_Y(){
    if(iscObjectOpenDivIndex < iscObjectOpenDivDuration_ms){
        iscObjectOpenDivIndex++;
        
        var curDate = new Date();
        var diffMS = Math.abs(curDate - iscObjectOpenDivStartTime);
        var diffMS_Index = 0;
        if(diffMS < iscObjectOpenDivDuration_ms){
            diffMS_Index =  Math.round(diffMS - iscObjectOpenDivIndex);
        }else{
            diffMS_Index = iscObjectOpenDivDuration_ms - (iscObjectOpenDivIndex + 1);
        }
        
        if(diffMS_Index > 0){
           iscObjectOpenDivIndex += diffMS_Index;
        }
        
        var curHeight = iscObjectOpenDivEE(iscObjectOpenDivIndex, 0, (iscObjectOpenDivPanelHeight), iscObjectOpenDivDuration_ms);
        iscObjectOpenDivPanelObj_Y.style.height = curHeight + "px";
        if(iscObjectOpenDivShowObj_Y){
        	iscObjectOpenDivShowObj_Y.style.height = iscObjectOpenDivShowHeight + iscObjectOpenDivPanelHeight - curHeight + "px";
        }
        window.setTimeout(iscObjectOpenDivCCCC_Y, 0);
    }else{
        iscObjectOpenDivPanelObj_Y.style.height = iscObjectOpenDivPanelHeight + "px";
        iscObjectOpenDivIndex = 0;
        iscObjectOpenDivIsExtends_Y = true;
    }
}    
    function iscObjectOpenDivBBBB_X(){
        if(iscObjectOpenDivIndex < iscObjectOpenDivDuration_ms){
            iscObjectOpenDivIndex++;
            
            var curDate = new Date();
            var diffMS = Math.abs(curDate - iscObjectOpenDivStartTime);
            var diffMS_Index = 0;
            if(diffMS < iscObjectOpenDivDuration_ms){
                diffMS_Index =  Math.round(diffMS - iscObjectOpenDivIndex);
            }else{
                diffMS_Index = Math.round(iscObjectOpenDivDuration_ms - (iscObjectOpenDivIndex + 1));
            }
            
            if(diffMS_Index > 0){
               iscObjectOpenDivIndex += diffMS_Index;
            }
            var curWidth = iscObjectOpenDivEE(iscObjectOpenDivIndex, iscObjectOpenDivPanelWidth, (-iscObjectOpenDivPanelWidth), iscObjectOpenDivDuration_ms);
            iscObjectOpenDivPanelObj_X.style.width = curWidth + "px";
            if(iscObjectOpenDivShowObj_X){
            	iscObjectOpenDivShowObj_X.style.width = iscObjectOpenDivShowWidth + iscObjectOpenDivPanelWidth - curWidth + "px";
            }
            window.setTimeout(iscObjectOpenDivBBBB_X, 0);
        }else{
        	iscObjectOpenDivPanelObj_X.style.width = 0 + "px";
            iscObjectOpenDivIndex = 0;
            iscObjectOpenDivIsExtends_X = false;
        }
    }

    function iscObjectOpenDivCCCC_X(){
        if(iscObjectOpenDivIndex < iscObjectOpenDivDuration_ms){
            iscObjectOpenDivIndex++;
            
            var curDate = new Date();
            var diffMS = Math.abs(curDate - iscObjectOpenDivStartTime);
            var diffMS_Index = 0;
            if(diffMS < iscObjectOpenDivDuration_ms){
                diffMS_Index =  Math.round(diffMS - iscObjectOpenDivIndex);
            }else{
                diffMS_Index = iscObjectOpenDivDuration_ms - (iscObjectOpenDivIndex + 1);
            }
            
            if(diffMS_Index > 0){
               iscObjectOpenDivIndex += diffMS_Index;
            }
            
            var curWidth = iscObjectOpenDivEE(iscObjectOpenDivIndex, 0, (iscObjectOpenDivPanelWidth), iscObjectOpenDivDuration_ms);
            iscObjectOpenDivPanelObj_X.style.width = curWidth + "px";
            if(iscObjectOpenDivShowObj_X){
            	iscObjectOpenDivShowObj_X.style.width = iscObjectOpenDivShowWidth + iscObjectOpenDivPanelWidth - curWidth + "px";
            }
            window.setTimeout(iscObjectOpenDivCCCC_X, 0);
        }else{
            iscObjectOpenDivPanelObj_X.style.width = iscObjectOpenDivPanelWidth + "px";
            iscObjectOpenDivIndex = 0;
            iscObjectOpenDivIsExtends_X = true;
        }
    }
    /*
     * =======================================================================================================================
     * 功能: 系统自动调整DIV长宽  参数: showD:调整的DIV， searchD: 自动展开收缩DIV;没有的话:null，inum没有searchD时填入search菜单的高度
     * =======================================================================================================================
     */
    function iniHtml(showD,searchD,inum){
    	if(showD == null){
    		showD = "";
    	}
    	if(searchD == null){
    		searchD = "";
    	}
    	if(inum == null){
    		inum = 0;
    	}
    	var showDiv = document.getElementById(showD);
		var searchDiv = document.getElementById(searchD);
		if(searchDiv){
			inum = searchDiv.offsetHeight;
		}
		if(showDiv){
			showDiv.style.height = (document.body.clientHeight - 100 ) - inum +"px";
			showDiv.style.width  = (document.body.clientWidth - 10) +"px";
		}
    }
    
    /*
     * =======================================================================================
     * 这三个函数必须放在最后面
     * =======================================================================================
     */
    domReady(injectHandleErrors);
    domReady(setErrorFocus);
    domReady(showAllTypeMessage);