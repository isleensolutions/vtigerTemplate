<script type="text/javascript">
	Vtiger_Pie_Widget_Js('Vtiger_Totalrevenuepersalesperson_Widget_Js',{},{});
</script>
<section class="panel">
<header class="dashboardWidgetHeader panel-heading">
	{include file="dashboards/WidgetHeader.tpl"|@vtemplate_path:$MODULE_NAME SETTING_EXIST=true}
	<div class="row-fluid filterContainer" style="background-color: #F4F4F4;border: 1px solid #CCCCCC; border-radius: 3px;display: none;padding: 10px;position: absolute;width: 95%;z-index: 100001;">
		<div class="row-fluid ">
			<span class="col-md-6 paddingLeft">
				<span class="pull-right">
					{vtranslate('Created Time', $MODULE_NAME)} &nbsp; {vtranslate('LBL_BETWEEN', $MODULE_NAME)}
				</span>
			</span>
			<span class="col-md-4">
				<input type="text" name="createdtime" class="dateRange widgetFilter form-control" />
			</span>
		</div>
	</div>			
</header>
<div class="dashboardWidgetContent panel-body">
	{include file="dashboards/DashBoardWidgetContents.tpl"|@vtemplate_path:$MODULE_NAME}
</div>
</section>
