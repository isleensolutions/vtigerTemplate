<script type="text/javascript">
	Vtiger_Funnel_Widget_Js('Vtiger_Groupedbysalesstage_Widget_Js',{},{});
</script>
{foreach key=index item=cssModel from=$STYLES}
	<link rel="{$cssModel->getRel()}" href="{$cssModel->getHref()}" type="{$cssModel->getType()}" media="{$cssModel->getMedia()}" />
{/foreach}
{foreach key=index item=jsModel from=$SCRIPTS}
	<script type="{$jsModel->getType()}" src="{$jsModel->getSrc()}"></script>
{/foreach}
<section class="panel">
<header class="dashboardWidgetHeader panel-heading">
	<table width="100%" cellspacing="0" cellpadding="0">
	<tbody>
		<tr>
			<td class="col-md-5">
				<div class="dashboardTitle" title="{vtranslate($WIDGET->getTitle(), $MODULE_NAME)}"><h4>{vtranslate($WIDGET->getTitle(), $MODULE_NAME)}</h4></div>
			</td>
			<td class="col-md-4">
				<div>
					<select class="widgetFilter form-control" id="owner" name="owner" style='width:100%;margin-bottom:0px';padding:6px;>
						<option value="{$CURRENTUSER->getId()}" >{vtranslate('LBL_MINE')}</option>
						<option value="all">{vtranslate('LBL_ALL')}</option>
					</select>
				</div>
			</td>
			<td class="refresh col-md-1" align="right">
				<span style="position:relative;"></span>
			</td>
			<td class="widgeticons " align="right">
				{include file="dashboards/DashboardHeaderIcons.tpl"|@vtemplate_path:$MODULE_NAME SETTING_EXIST=true}
			</td>
		</tr>
	</tbody>
	</table>
	<div class="row-fluid filterContainer" style="background-color: #F4F4F4;border: 1px solid #CCCCCC; border-radius: 3px;display: none;padding: 10px;position: absolute;width: 95%;z-index: 100001;">
		<div class="row">
			<span class="col-md-5">
				<span class="pull-right">
					{vtranslate('Expected Close Date', $MODULE_NAME)} &nbsp; {vtranslate('LBL_BETWEEN', $MODULE_NAME)}
				</span>
			</span>
			<span class="col-md-4">
				<input type="text" name="expectedclosedate" class="dateRange widgetFilter form-control" />
			</span>
		</div>
	</div>
</header>
<div class="dashboardWidgetContent panel-body">
	{include file="dashboards/DashBoardWidgetContents.tpl"|@vtemplate_path:$MODULE_NAME}
</div>
</section>
