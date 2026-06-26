function jump() {
	var tt=document.getElementById('chart_guid_report1_condition_txt_leave_type').value;
	var url='ShowReport.wx?PAGEID=chart&txt_leave_type='+tt;
	window.location.href=url;
}

function project_view_summary_jump() {
	var begin=document.getElementById('project_view_summary_guid_report1_condition_txtBeginTime').value;
	var end=document.getElementById('project_view_summary_guid_report1_condition_txtEndTime').value;
	var url='ShowReport.wx?PAGEID=project_view_summary_chart&txtBeginTime='+begin+'&txtEndTime='+end;
	var url2='ShowReport.wx?PAGEID=project_view_summary_chart2&txtBeginTime='+begin+'&txtEndTime='+end;
	var url3='ShowReport.wx?PAGEID=project_view_summary_3&txtBeginTime='+begin+'&txtEndTime='+end;
	window.frames.chartframe.location.href=url;
	window.frames.chartframe2.location.href=url2;
	window.frames.chartframe3.location.href=url3;
}
