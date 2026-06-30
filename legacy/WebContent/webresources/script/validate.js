Array.prototype.max = function()
{
	var i, max = this[0];
	
	for( i = 1; i < this.length; i++ )
	{
		if( max < this[i] )
		{ 
			max = this[i];
		}
	}
	return max;
};

String.prototype.trim = function()
{
    return this.replace( /(^\s*)|(\s*$)/g, "" );
};

// Wabacus-generated scripts in this legacy app expect a few helper functions
// that are missing in the current runtime bundle. Provide narrow shims that
// match the metadata/id conventions used by the generated pages.
if (typeof getInputboxIdByParentElementObj === "undefined")
{
	function getInputboxIdByParentElementObj(parentEleObj)
	{
		if(!parentEleObj) return null;
		var inputboxid = parentEleObj.getAttribute ? parentEleObj.getAttribute("inputboxid") : null;
		if(inputboxid) return inputboxid;
		var id = parentEleObj.getAttribute ? parentEleObj.getAttribute("id") : null;
		if(id)
		{
			var tdIndex = id.indexOf("__td");
			if(tdIndex > 0) return id.substring(0, tdIndex);
			return id;
		}
		var valueName = parentEleObj.getAttribute ? parentEleObj.getAttribute("value_name") : null;
		if(!valueName) return null;
		var tableObj = parentEleObj;
		while(tableObj)
		{
			if(tableObj.tagName && String(tableObj.tagName).toUpperCase() === "TABLE")
			{
				break;
			}
			tableObj = tableObj.parentNode;
		}
		if(!tableObj) return null;
		var refreshGuid = tableObj.getAttribute ? tableObj.getAttribute("refreshComponentGuid") : null;
		if(!refreshGuid && tableObj.getAttribute)
		{
			var tableId = tableObj.getAttribute("id");
			if(tableId && tableId.indexOf("_data") > 0)
			{
				refreshGuid = tableId.substring(0, tableId.indexOf("_data"));
			}
		}
		if(!refreshGuid) return null;
		return refreshGuid + "_wxcol_" + valueName;
	}
}

if (typeof getInputboxParentElementObjByTagName === "undefined")
{
	function getInputboxParentElementObjByTagName(eleObj, tagName)
	{
		if(!eleObj || !tagName) return null;
		tagName = String(tagName).toUpperCase();
		while(eleObj)
		{
			if(eleObj.tagName && String(eleObj.tagName).toUpperCase() === tagName)
			{
				return eleObj;
			}
			eleObj = eleObj.parentNode;
		}
		return null;
	}
}

if (typeof getInputboxMetadataObj === "undefined")
{
	function getInputboxMetadataObj(boxId)
	{
		if(!boxId) return null;
		var metadataObj = document.getElementById("span_" + boxId + "_span");
		if(metadataObj) return metadataObj;
		var rowIndexFlag = boxId.lastIndexOf("__");
		if(rowIndexFlag > 0)
		{
			return document.getElementById("span_" + boxId.substring(0, rowIndexFlag) + "_span");
		}
		return null;
	}
}

// Legacy editablelist2 add-row code still calls fillInputBoxToTd() with the
// older Wabacus signature. Route that call back into the generated one-arg
// renderer by attaching the intended row-scoped inputbox id to the target TD.
if (typeof fillInputBoxToTd === "function" && fillInputBoxToTd.length === 1)
{
	var legacyGeneratedFillInputBoxToTd = fillInputBoxToTd;
	fillInputBoxToTd = function(parentTdObj)
	{
		if(arguments.length > 3 && arguments[3] && arguments[3].tagName)
		{
			parentTdObj = arguments[3];
			if(parentTdObj.getAttribute && !parentTdObj.getAttribute("inputboxid") && arguments[5])
			{
				parentTdObj.setAttribute("inputboxid", arguments[5]);
			}
		}
		var result = legacyGeneratedFillInputBoxToTd(parentTdObj);
		legacyBindSelectboxChangeAsBlur(parentTdObj);
		return result;
	};
}

function legacyBindSelectboxChangeAsBlur(parentTdObj)
{
	if(!parentTdObj || !parentTdObj.getElementsByTagName) return;
	var selectObjs = parentTdObj.getElementsByTagName("SELECT");
	if(!selectObjs || selectObjs.length === 0) return;
	for(var i = 0; i < selectObjs.length; i++)
	{
		var selectObj = selectObjs[i];
		if(!selectObj || selectObj.getAttribute("legacy-change-bound") === "true") continue;
		var onblurHandler = selectObj.onblur;
		if(typeof onblurHandler === "function")
		{
			selectObj.onchange = (function(handler){
				return function()
				{
					return handler.call(this);
				};
			})(onblurHandler);
			selectObj.setAttribute("legacy-change-bound", "true");
		}
	}
}

if (typeof getUpdateColDestObj === "function")
{
	var legacyGetUpdateColDestObj = getUpdateColDestObj;
	getUpdateColDestObj = function(parentObj, reportguid, fallbackObj)
	{
		var result = legacyGetUpdateColDestObj.apply(this, arguments);
		if((result === null || typeof result === "undefined") && typeof fallbackObj !== "undefined")
		{
			return fallbackObj;
		}
		return result;
	};
}

if (typeof getPropertyValueFromHtmlProperties === "undefined")
{
	function getPropertyValueFromHtmlProperties(htmlProperties, propertyName)
	{
		if(!htmlProperties) return ["", ""];
		if(!propertyName) return [htmlProperties, ""];
		var pattern = new RegExp("(^|\\s)" + propertyName + "\\s*=\\s*(\"([^\"]*)\"|'([^']*)'|([^\\s>]+))", "i");
		var match = pattern.exec(htmlProperties);
		if(!match) return [htmlProperties, ""];
		var value = typeof match[3] !== "undefined" ? match[3] :
					(typeof match[4] !== "undefined" ? match[4] :
					(typeof match[5] !== "undefined" ? match[5] : ""));
		var remained = (htmlProperties.substring(0, match.index) + " " +
						htmlProperties.substring(match.index + match[0].length)).replace(/\s+/g, " ").trim();
		return [remained, value];
	}
}

function isAlphaNumeric( strValue,boxObj,paramsObj)
{
	return checkExp( /^\w*$/gi, strValue );
}

function isDate( strValue,boxObj,paramsObj )
{
	if( isEmpty( strValue ) ) {return true;}

	if( !checkExp( /^\d{4}-[01]?\d-[0-3]?\d$/, strValue ) ) 
	{
		return false;
	}
	
	var arr = strValue.split( "-" );
	var year = arr[0];
	var month = arr[1];
	var day = arr[2];
	
	if(year<1900||year>2060)
	{
		return false;
	}

	if( !( ( 1<= month ) && ( 12 >= month ) && ( 31 >= day ) && ( 1 <= day ) ) )
	{
		return false;
	}
		
	if( !( ( year % 4 ) == 0 ) && ( month == 2) && ( day == 29 ) )
	{
		return false;
	}
	
	if( ( month <= 7 ) && ( ( month % 2 ) == 0 ) && ( day >= 31 ) )
	{
		return false;
	}
	
	if( ( month >= 8) && ( ( month % 2 ) == 1) && ( day >= 31 ) )
	{
		return false;
	}
	
	if( ( month == 2) && ( day >=30 ) )
	{
		return false;
	}
	
	return true;
}

function isShortDate( strValue,boxObj,paramsObj )
{
	var DATETIME = strValue;
	if( isEmpty( strValue ) ) return true;
	if( !checkExp(/^\d{4}-[01]?\d/g,DATETIME) )
	{
		return false;
	}

	var arr = DATETIME.split( "-" );
	var year = arr[0];
	var month = arr[1];
	if(year<1753)
	{
		return false;
	}

	if(arr.length==3)
	{
	   return false;
	}
	if( !((1<= month ) && ( 12 >= month )))
	{
		return false;				
	}
	
	return true;
}

function isEmail( strValue,boxObj ,paramsObj)
{
	if( isEmpty( strValue ) ) return true;
	
	var pattern = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;
	return checkExp( pattern, strValue );
	
}

function isNumeric( strValue,boxObj,paramsObj )
{
	if( isEmpty( strValue ) ) return true;
	if( !checkExp( /^[+-]?\d+(\.\d+)?$/g, strValue ))
	{
		return false;
	}
	return true;
}

function isMoney( strValue,boxObj,paramsObj )
{
	if( isEmpty( strValue ) ) return true;
	
	return checkExp( /^[+-]?\d+(,\d{3})*(\.\d+)?$/g, strValue );
}

function isPhone( strValue,boxObj )
{
	if( isEmpty( strValue ) ) return true;
	
	return checkExp( /(^\(\d{3,5}\)\d{6,8}(-\d{2,8})?$)|(^\d+-\d+$)|(^(130|131|135|136|137|138|139)\d{8}$)/g, strValue );
}

function isPostalCode( strValue,boxObj,paramsObj )
{
	if( isEmpty( strValue ) ) return true;
	if(!checkExp( /(^$)|(^\d{6}$)/gi, strValue ))
	{
		return false;
	}
	return true;
}

function isURL( strValue,boxObj ,paramsObj)
{
	if( isEmpty( strValue ) ) return true;
	
	var pattern = /^(http|https|ftp):\/\/(\w+\.)+[a-z]{2,3}(\/\w+)*(\/\w+\.\w+)*(\?\w+=\w*(&\w+=\w*)*)*/gi;
	// var pattern = /^(http|https|ftp):(\/\/|\\\\)(\w+\.)+(net|com|cn|org|cc|tv|[0-9]{1,3})((\/|\\)[~]?(\w+(\.|\,)?\w\/)*([?]\w+[=])*\w+(\&\w+[=]\w+)*)*$/gi;
	// var pattern = ((http|https|ftp):(\/\/|\\\\)((\w)+[.]){1,}(net|com|cn|org|cc|tv|[0-9]{1,3})(((\/[\~]*|\\[\~]*)(\w)+)|[.](\w)+)*(((([?](\w)+){1}[=]*))*((\w)+){1}([\&](\w)+[\=](\w)+)*)*)/gi;

	return checkExp( pattern, strValue );
	
}
function trim(strValue)
{
	if(!strValue||strValue=='') return strValue;
	while(strValue.substring(0,1)==' ')
	{
		strValue=strValue.substring(1);
	}
	if(strValue=='') return strValue;
	while(strValue.substring(strValue.length-1,strValue.length)==' ')
	{
		strValue=strValue.substring(0,strValue.length-1);
	}
	return strValue;
}

function isNotEmpty( strValue,boxObj,paramsObj )
{
	
	strValue=trim(strValue);
	if( !strValue||strValue == "" )
		return false;
	else
		return true;
}

function isEmpty( strValue,boxObj,paramsObj )
{
	strValue=trim(strValue);
	if( strValue == "" )
		return true;
	else
		return false;
}
function isHanZi( strValue,boxObj,paramsObj )
{
	if( isEmpty( strValue ) ) return true;
	var pattern = /^([a-zA-Z0-9_-])+/;

	return checkExp( pattern , strValue );

}
function isHanZi2( strValue,boxObj,paramsObj )
{
	if( isEmpty( strValue ) ) return true;
	if(trim(strValue).equalsWith("免考")) return true;
	var pattern = /^([a-zA-Z0-9_-])+/;

	return checkExp( pattern , strValue );

}
//added by 王旭 正整数校验
function isPositiveInt( strValue,boxObj,paramsObj )
{
	
	if( isEmpty( strValue ) ) return true;
	
	if( strValue ==0 ) return false;
	
	if(!checkExp( /(^[0-9][0-9]*\.{0,1}\d{0,2}$)/, strValue ))  //!checkExp( /(^[0-9]*[1-9][0=9]*$)/, strValue )
			
	{
		
		return false;
	}
	return true;
}



//added by wangxu ChangeRatio校验认领比例填写的数字是否符合条件
function ChangeRatio(strValue)
{   
	
	//获取页面输入的认领比例
	var datasObj=getEditableReportColValues('claimed_change','dtl',{RATIO:true,RATIO_OLD:true},{name:'SELECTEDROW',value:true});
    var tmp=0;
    var sum=0;
	var dataObjTmp;
	for(var i=0;i<datasObj.length;i++)
	{
		dataObjTmp=datasObj[i];
		for(var key in dataObjTmp)
		{
			if(dataObjTmp [key].name=='RATIO')
				{
					tmp=Number(dataObjTmp [key].value);
				}
		}
	}
	
	
	//获取可以认领的调整比例
	var datasObj1=getEditableReportColValues('claimed_change','select',{SUM:true},{name:'SELECTEDROW',value:true});
	for(var j=0;j<datasObj1.length;j++)
	{ 
		var dataObj1Tmp=datasObj1[j];
		for(var keyj in dataObj1Tmp)
		{
			if(dataObj1Tmp [keyj].name=='SUM')
			{
				sum=Number(dataObj1Tmp [keyj].value);
			}
		}
	}
	
	if(Number(tmp)>Number(sum) )
	{
		wx_alert("请重新核对调整的认领比例，再提交！");
		return WX_SAVE_TERMINAT;
	}
	
	return true;
	


}




