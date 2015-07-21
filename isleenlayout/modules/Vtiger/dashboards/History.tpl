<section class="panel">
<header class="panel-heading dashboardWidgetHeader">
	<div class="col-lg-4">
		<h4>{vtranslate($WIDGET->getTitle())}</h4>
	</div>
	<div class="col-lg-4">
		<select class="widgetFilter form-control" id="historyType" name="type" style='width:100%;margin-bottom:0px;padding: 6px;'>
			<option value="all" >{vtranslate('LBL_ALL')}</option>
			<option value="comments" >{vtranslate('LBL_COMMENTS')}</option>
			<option value="updates" >{vtranslate('LBL_UPDATES')}</option>
		</select>
	</div>
	<div class="widgeticons col-lg-4">
		<span class="box pull-right">
		    {include file="dashboards/DashboardHeaderIcons.tpl"|@vtemplate_path:$MODULE_NAME}
	    </span>
    </div>

</header>
<div class="dashboardWidgetContent panel-body profile-activity" style="height: 550px;">
	{include file="dashboards/HistoryContents.tpl"|@vtemplate_path:$MODULE_NAME}
</div>
</section>