/**
 * 报表list行选中执行的回调函数
 */
function reportListSelectCallback(pageid,reportid,selectedTrObjArr,deselectedTrObjArr)
{
	var str=getTrObjsValue(selectedTrObjArr);
	if(str!=null&&str!='')
	{
		var tempurl="ShowReport.wx?PAGEID="+str;
		window.frames.reportframe.location.href=tempurl;
	}
}

function InvokeCallbackMethod_refreshTitle(xmlHttpObj, datasObj) {
	if (datasObj == null)
		return;
	refreshComponentDisplay(getQueryString('PAGEID'),'title');
}

/**正则分析法 获取url参数*/
function getQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    if (r != null) return unescape(r[2]); return null;
    }


function InvokeCallbackMethod_refreshHome_report1(xmlHttpObj, datasObj) {
	if (datasObj == null)
		return;
	refreshComponentDisplay('home','report1');
}
function InvokeCallbackMethod_refreshHome_report2(xmlHttpObj, datasObj) {
	if (datasObj == null)
		return;
	refreshComponentDisplay('home','report2');
}

function refreshProjectDefine(xmlHttpObj){
	refreshComponentDisplay('project_define',null,false);
}

function refreshPersonal_task_details(xmlHttpObj){
	refreshComponentDisplay('personal_task_details',null,true);
}
function winOpenFullScreen(strURL)
{
    var sheight = screen.height-70;
    var swidth = screen.width-10;
    var winoption    ="left=0,top=0,height="+sheight+",width="+swidth+",toolbar=yes,menubar=yes,location=yes,status=yes,scrollbars=yes,resizable=yes";
    var tmp=window.parent.showModalDialog(strURL,'',winoption);
    return tmp;
}

function winModalFullScreen(strURL)
{
    var sheight = screen.height-120;
    var swidth = screen.width-60;
    var winoption ="dialogHeight:"+sheight+"px;dialogWidth:"+ swidth +"px;status:yes;scroll:yes;resizable:yes;center:yes";
    var tmp=window.showModalDialog(strURL,window,winoption);
    return tmp;
}
function winModalFullScreen2(strURL,width,height)
{
    var sheight = height;
    var swidth = width;
    var winoption ="dialogHeight:"+sheight+"px;dialogWidth:"+ swidth +"px;status:yes;scroll:yes;resizable:yes;center:yes";
    var tmp=window.showModalDialog(strURL,window,winoption);
    return tmp;
}

/**
 * 测试行选中执行的回调函数 项目甘特图
 */
function project_selectCallback(pageid,reportid,selectedTrObjArr,deselectedTrObjArr)
{
	var str=getTrObjsValue(selectedTrObjArr);
	if(str!=null&&str!='')
	{
		winModalFullScreen('ShowReport.wx?PAGEID=project_chart&txt_project_id='+str);
	}
}

function getTrObjsValue(trObjsArr)
{
	if(trObjsArr==null||trObjsArr.length==0) return '';
	var str='';
	for(var i=0;i<trObjsArr.length;i++)
	{
		var tdChilds=trObjsArr[i].getElementsByTagName('TD');
		for(var j=0;j<tdChilds.length;j++)
		{
			var name=tdChilds[j].getAttribute('name');//获取当前列对应的<col/>的列名
			var value=tdChilds[j].getAttribute('value');//获取选中行的当前列的数据
			if(name&&name!='')
			{
				str=value;
			}
		}
	}
	return str;
}

function testTypePromptCallBack(textObj)
{
	if(textObj==null) return;
	wx_alert('选中的选项值：'+textObj.value);
	//执行此报表的搜索操作
	searchReportData('typepromptpage4','report1');
	/**
	 * 如果不想象上面一样写死要搜索的报表所在页面ID和报表本身ID（即这里的typepromptpage4和report1），可以从textObj.id中取到这两个值，因为框架为输入框分配的id中自动包括它所在的报表ID和报表所在的页面ID。
	 * 这对想写一个统一的功能非常有用，不需每个报表去写一个这种方法进行自动搜索。
	 */
}

function otherdata_clientpage1_beforesave(pageid,reportid,updatetype,dataObjArr)
{
	if(dataObjArr!=null)
	{
		var currentdate='2011-10-22 11:11:11';
		var mess='';
		var dataObjTmp;
		for(var i=0;i<dataObjArr.length;i++)
		{//遍历每条本次操作的记录
			dataObjTmp=dataObjArr[i];
			var myupdatetype=dataObjTmp['WX_TYPE'];//本条记录的更新类型，包括add、update、delete三种取值
			//alert(myupdatetype);
			if(myupdatetype=='delete')
			{//对本记录做删除操作
				mess=mess+'删除的部门编号：'+dataObjTmp['deptno_old'];
				mess=mess+';;;删除的部门名：'+dataObjTmp['deptname_old'];
			}else if(myupdatetype=='update')
			{//对本记录做修改操作
				mess=mess+'修改的旧部门编号：'+dataObjTmp['deptno_old']+';;;新部门编号：'+dataObjTmp['deptno'];
				mess=mess+';;;修改的旧部门名：'+dataObjTmp['deptname_old']+';;;新部门名：'+dataObjTmp['deptname'];
			}else if(myupdatetype=='add')
			{//对本记录做添加操作
				mess=mess+'添加的部门编号：'+dataObjTmp['deptno'];
				mess=mess+';;;添加的部门名：'+dataObjTmp['deptname'];
			}
		}
		//调用框架添加自定义数据的方法传入后台保存时使用
		setCustomizeParamValue(pageid,reportid,'testdate',currentdate);
		setCustomizeParamValue(pageid,reportid,'logcontent',mess);
	}	
}

function refreshreportapipage1Onload(pageid,componentid)
{
	if(pageid!='refreshreportapipage1') return;
	if(componentid==null||componentid=='refreshreportapipage1')
	{
		alert('加载完整个页面');
	}else if(componentid=='report1')
	{
		alert('加载完报表一');
	}else if(componentid=='report2')
	{
		alert('加载完报表二');
	}
}

function testGetReportColData(pageid,reportid,reporttype,columns,conditions)
{
	var datasObj=getEditableReportColValues(pageid,reportid,reporttype,columns,conditions);
	if(datasObj==null)
	{
		wx_alert('没有获取到数据');
	}else if(isArray(datasObj))
	{
		var dataObjTmp;
		for(var i=0;i<datasObj.length;i=i+1)
		{
			dataObjTmp=datasObj[i];
			var str='';
			for(var key in dataObjTmp)
			{
				str=str+' name:'+dataObjTmp[key].name+';value:'+dataObjTmp[key].value+';oldname:'+dataObjTmp[key].oldname+';oldvalue:'+dataObjTmp[key].oldvalue+'\n';
			}
			alert(str);
		}
	}else
	{
		var str='';
		for(var key in datasObj)
		{
			str=str+' name:'+datasObj[key].name+';value:'+datasObj[key].value+';oldname:'+datasObj[key].oldname+';oldvalue:'+datasObj[key].oldvalue+'\n';
		}
		alert(str);
	}
}

function testInvokeCallbackMethod1(datasObj)
{
	var componentguid=getComponentGuidById(datasObj.pageid, datasObj.componentid);//先取到组件GUID
	var datasArr=null;
	if(WX_ALL_SAVEING_DATA!=null) datasArr =WX_ALL_SAVEING_DATA[componentguid];
	if(datasArr!=null&&datasArr.length>0)
	{
	}else
	{
		alert('无参数');
	}
	refreshComponentDisplay(datasObj.pageid,null,true);//刷新整个页面
}

function testInvokeCallbackMethod2(xmlHttpObj,datasObj)
{
	alert(xmlHttpObj.responseText);//打印服务器端方法返回的字符串
	if(datasObj==null) return;
	var datasObjArr=convertToArray(datasObj);
	printInvokeParamsData(datasObjArr);
	refreshComponentDisplay('invokeservermethod_alonepage1',null,true);
	//window.location.href='/WabacusDemo/ShowReport.wx?PAGEID=invokeservermethod_alonepage1';//刷新一下此页面，将新插入的记录显示出来
}

function testBeforeInokeCallBackMethod1(datasArray)
{
	if(datasArray==null||datasArray.length==0) 
	{
		alert('没有取到报表数据，取消调用操作');
		return false;//没有取到报表数据，则不调用后台操作
	}
	alert('批量审核通过，数据处理中...');
	//printInvokeParamsData(datasArray);
	return true;
}

function printInvokeParamsData(datasObjArr)
{
	if(datasObjArr==null||datasObjArr.length==0) return;
	for(var i=0;i<datasObjArr.length;i++)
	{
		var str='';
		for(key in datasObjArr[i])
		{
			str=str+'参数名：'+key+'，参数值：'+datasObjArr[i][key]+'；';
		}
		if(str!='') alert(str);
	}
}

function testInvokeCallbackMethod3(datasObj)
{
	refreshComponentDisplay('invokeservermethod_sqlpage1',null,false);//刷新整个页面
}

function testInvokeCallbackMethod_autodbpage11(datasObj)
{
	alert('针对组件'+datasObj.componentid+'调用服务器端操作');
	if(datasObj.returnValue!=null&&datasObj.returnValue!='')
	{
		alert('服务器端返回值：'+datasObj.returnValue);
	}
	var componentguid=getComponentGuidById(datasObj.pageid, datasObj.componentid);//先取到组件GUID
	var datasArr=null;
	if(WX_ALL_SAVEING_DATA!=null) datasArr =WX_ALL_SAVEING_DATA[componentguid];
	if(datasArr!=null&&datasArr.length>0)
	{
		printInvokeParamsData(datasArr);
	}else
	{
		alert('无参数');
	}
	refreshComponentDisplay(datasObj.pageid,'vp1',true);//刷新vp1容器
}
function testInvokeCallbackMethod_autodbpage12(datasObj)
{
	alert('针对组件'+datasObj.componentid+'调用服务器端操作');
	if(datasObj.returnValue!=null&&datasObj.returnValue!='')
	{
		alert('服务器端返回值：'+datasObj.returnValue);
	}
	var componentguid=getComponentGuidById(datasObj.pageid, datasObj.componentid);//先取到组件GUID
	var datasArr=null;
	if(WX_ALL_SAVEING_DATA!=null) datasArr =WX_ALL_SAVEING_DATA[componentguid];
	if(datasArr!=null&&datasArr.length>0)
	{
		printInvokeParamsData(datasArr);
	}else
	{
		alert('无参数');
	}
	refreshComponentDisplay(datasObj.pageid,'vp2',true);//刷新vp2容器
}

function testInvokeCallbackMethod_autodbpage13(datasObj)
{
	alert('针对组件'+datasObj.componentid+'调用服务器端操作');
	if(datasObj.returnValue!=null&&datasObj.returnValue!='')
	{
		alert('服务器端返回值：'+datasObj.returnValue);
	}
	var componentguid=getComponentGuidById(datasObj.pageid, datasObj.componentid);//先取到组件GUID
	var datasArr=null;
	if(WX_ALL_SAVEING_DATA!=null) datasArr =WX_ALL_SAVEING_DATA[componentguid];
	if(datasArr!=null&&datasArr.length>0)
	{
		printInvokeParamsData(datasArr);
	}else
	{
		alert('无参数');
	}
	refreshComponentDisplay(datasObj.pageid,'vp3',true);//刷新vp3容器
}

/*保存后刷新页面*/
function saveUpdate(pageid,reportid,datasObj)
{
	parent.location.reload();
	//artDialog.open.origin.refreshComponetDisplay();
	//art.dialog.close();

}

/**
 * 测试行选中执行的回调函数
 */
function testcallbacufunc(pageid,reportid,selectedTrObjArr,deselectedTrObjArr)
{
//	var paid=pageid;
//	var reid=reportid;
	alert('pageid:'+pageid+'  reportid:'+reportid+'  selectedTrObjArr:'+selectedTrObjArr+'  deselectedTrObjArr:'+deselectedTrObjArr);
//	var str=getTrObjsValue(deselectedTrObjArr);
//	alert('A'+str);
//	if(str!=null&&str!='')
//	{
//		alert('本次被取消选中的行：'+str);
//	}
	var str=getTrObjsValue(selectedTrObjArr);
//	alert('B');
	if(str!=null&&str!='')
	{
		alert('本次选中的行：'+str);
	}
//	var allSelectedTrObjsArr=getListReportSelectedTrObjs(pageid,reportid);//取到所有选中的行对象
//	str=getTrObjsValue(allSelectedTrObjsArr);
////	alert('C');
//	if(str!=null&&str!='')
//	{
//		alert('被选中的所有行：'+str);
//	}
}

function getTrObjsValue(trObjsArr)
{	alert('trObjsArr='+trObjsArr+'      trObjsArr.length='+trObjsArr.length);
	if(trObjsArr==null||trObjsArr.length==0) return '';
	var str='';
	for(var i=0;i<trObjsArr.length;i++)
	{
		var tdChilds=trObjsArr[i].getElementsByTagName('TD');
		for(var j=0;j<tdChilds.length;j++)
		{
			var name=tdChilds[j].getAttribute('name');//获取当前列对应的<col/>的列名
			var value=tdChilds[j].getAttribute('value');//获取选中行的当前列的数据
//			alert('name'+name);
			if(name&&name!='')
			{
				str=str+'[列名：'+name+'；列值：'+value+']';
				
			}
		}
	}
	wx_warn('str='+str);
	return str;
}
function testDynamicOnload(paramsObj)
{
	paramsObj.width='850px';
	paramsObj.height='200px';
	paramsObj.time=30;
//	div style='font-size:14px';
	//paramsObj.style.color='#699'
//	paramsObj.lock=true;
	//paramsObj.message.style='font-size:14px;'
	//paramsObj.style.fontSize='20px';
//	wx_alert("<div style='font-size:30px; color:red';>"+paramsObj.message+"</div>",paramsObj);
	//ymPrompt.win(paramsObj);
	alert('提示信息：'+paramsObj.message);
}

function doPostSave(){
	//alert('保存成功！');
	
}

function testInvokeCallbackMethodRpt(datasObj)
{
	var componentguid=getComponentGuidById(datasObj.pageid, datasObj.componentid);//先取到组件GUID
	var datasArr=null;
	if(WX_ALL_SAVEING_DATA!=null) datasArr =WX_ALL_SAVEING_DATA[componentguid];
	if(datasArr!=null&&datasArr.length>0)
	{
	}else
	{
		alert('无参数');
	}
	refreshComponentDisplay(datasObj.pageid,"select",true);//刷新整个页面
}

function setReportInputBoxValue(pageid,reportid,isConditionbox,newvaluesObj,conditionsObj)
{
	alert("");
	var reportguid=getComponentGuidById(pageid,reportid);
	if(isConditionbox)
	{//当前是设置查询条件输入框的值
		setConditionInputBoxValue(reportguid,newvaluesObj);
	}else
	{//编辑输入框
		var metadataObj=getReportMetadataObj(reportguid);
		if(metadataObj.reportfamily==ReportFamily.EDITABLELIST2||metadataObj.reportfamily==ReportFamily.LISTFORM)
		{
			setEditableListReportColValue(reportguid,newvaluesObj,conditionsObj,false);
		}else if(metadataObj.reportfamily==ReportFamily.EDITABLEDETAIL2)
		{
			setEditableDetail2ReportColValue(reportguid,newvaluesObj,false);
		}else if(metadataObj.reportfamily==ReportFamily.EDITABLEDETAIL||metadataObj.reportfamily==ReportFamily.FORM)
		{
			setEditableDetailReportColValue(reportguid,newvaluesObj,false);
		}
	}
}
