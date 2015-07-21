<script type="text/javascript">
	Vtiger_Barchat_Widget_Js('Vtiger_Leadsbystatus_Widget_Js',{},{});
</script>

<section class="panel">
<header class="dashboardWidgetHeader panel-heading">
	{include file="dashboards/WidgetHeader.tpl"|@vtemplate_path:$MODULE_NAME SETTING_EXIST=true}
	<div class="row-fluid filterContainer hide" style="background-color: #F4F4F4;border: 1px solid #CCCCCC; border-radius: 3px;display: none;padding: 10px;position: absolute;width: 95%;z-index: 100001;">
		<div class="row-fluid 2">
			<span class="col-md-5">
				<span class="pull-right">
					{vtranslate('Created Time', $MODULE_NAME)} &nbsp; {vtranslate('LBL_BETWEEN', $MODULE_NAME)}
				</span>
			</span>
			<span class="col-md-4">
				<input type="text" name="createdtime" class="dateRange widgetFilter" />
			</span>	
			</div>
			<div class="row-fluid">	
			<span class="col-md-5">
				<span class="pull-right">
					{vtranslate('Assigned To', $MODULE_NAME)}
				</span>
			</span>
			<span class="col-md-4">
				{assign var=CURRENT_USER_ID value=$CURRENTUSER->getId()}
				<select class="widgetFilter" name="smownerid">
					<option value="">{vtranslate('LBL_ALL', $MODULE_NAME)}</option>
					{foreach key=USER_ID item=USER_NAME from=$ACCESSIBLE_USERS}
					<option value="{$USER_ID}">
						{if $USER_ID eq $CURRENTUSER->getId()}
							{vtranslate('LBL_MINE',$MODULE_NAME)}
						{else}
							{$USER_NAME}
						{/if}
					</option>
					{/foreach}
				</select>
			</span>
		</div>
	</div>
</header>
<div class="dashboardWidgetContent panel-body">
	{include file="dashboards/DashBoardWidgetContents.tpl"|@vtemplate_path:$MODULE_NAME}
</div>
</section>