

/**2013-6-17 单选列,单个值的获取方法*/
function getTrObjsValueForSingleValue(trObjsArr)
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
				str=str+value;
			}
		}
	}
	return str;
}

/**2013-6-20 刷新page*/
function refreshPage(datasObj)
{
	refreshComponentDisplay(datasObj.pageid,null,true);//刷新整个page
}

function refreshPage_claim(paramsObj){
	
	//alert(paramsObj.pageid);
	refreshComponentDisplay('claim_verify_acc',null,true);//刷新整个page
}

/**
* url 目标url(http://www.baidu.com/)
* arg 需要替换的参数名称
* arg_val 替换后的参数的值
* return url 参数替换后的url
*/
function changeURLArg(url,arg,arg_val){
	var pattern=arg+'=([^&]*)';
	var replaceText=arg+'='+arg_val;
	if(url.match(pattern)){
		var tmp='/('+ arg+'=)([^&]*)/gi';
		tmp=url.replace(eval(tmp),replaceText);
		return tmp;
	}else{
		if(url.match('[\?]')){
			return url+'&'+replaceText;
		}else{
			return url+'?'+replaceText;
		}
	}
	return url+'\n'+arg+'\n'+arg_val;
}
/**正则分析法 获取字符串中参数*/
function getSubString(str,key) {
	//string="&name=123&no=456"
    var reg = new RegExp("(^|&)" + key + "=([^&]*)(&|$)", "i");
    var r=str.match(reg);
    if (r != null) return unescape(r[2]); return null;
    }

function getTrObjsValueForPopupbox(trObjsArr)
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
				str=str+'&'+name+'='+value;
			}
		}
	}
	return str;
}

/**失去焦点事件*/
function blurEventGdq(){
	alert("blurEvent");
	var datasObj=getEditableReportColValues('emp_gdq_mod','select'
	,{GDQ_STDT:true,GDQ_ENDDT:true}
	,{name:'SELECTEDROW',value:true});
	
	
	var dataObjTmp;
	var gdqDt;
	if(datasObj==null){
		//wx_alert('没有获取到数据');
		return false;
	}else{
		//alert(datasObj);
		var gdqStDt
		for(var i=0;i<datasObj.length;i=i+1)
		{//循环获取到的每个记录行数据
		    dataObjTmp= datasObj[i]
			for(var key in dataObjTmp)
			{//循环获取到的每行中的每列数据
				//wx_alert(dataObjTmp[key].name+"="+dataObjTmp [key].value);
				if(dataObjTmp[key].name=='GDQ_STDT'){
					gdqStDt=dataObjTmp [key].value;
				}
				if(dataObjTmp[key].name=='GDQ_ENDDT'){
					gdqDt=dataObjTmp [key].value;
				}
				if(gdqStDt!=""){
					gdqDt=gdqStDt;
				}					
			}
		}
	var pageid="emp_gdq_mod";
	var reportid="select";
	var newvaluesObj={'GDQ_ENDDT':gdqDt};
	var conditionsObj={name:'SELECTEDROW',value:true};
	setEditableReportColValue(pageid,reportid,newvaluesObj,conditionsObj);
	}
}




