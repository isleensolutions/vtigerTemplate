<section class="panel">
	<div class="dashboardWidgetHeader panel-heading">
		{include file="dashboards/WidgetHeader.tpl"|@vtemplate_path:$MODULE_NAME}
	</div>

	<div class="dashboardWidgetContent panel-body" style='padding:5px'>
		{include file="dashboards/NotebookContents.tpl"|@vtemplate_path:$MODULE_NAME}
	</div>
</section>