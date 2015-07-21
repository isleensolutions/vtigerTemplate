{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
*
 ********************************************************************************/
-->*}
{strip}
<div class="row-fliud">	
	<div class="SummaryCustomMargin">
{if !empty($MODULE_SUMMARY)}
		<div class="col-lg-7 paddingLeftRight">
			<div class="summaryView">
			<section class="panel">
				<div class="panel-body">
					{$MODULE_SUMMARY}
				</div>
			</section>
			</div>
{/if}
			{foreach item=DETAIL_VIEW_WIDGET from=$DETAILVIEW_LINKS['DETAILVIEWWIDGET'] name=count}
				{if $smarty.foreach.count.index % 2 == 0}
					<div class="summaryWidgetContainer">
						<div class="widgetContainer_{$smarty.foreach.count.index}" data-url="{$DETAIL_VIEW_WIDGET->getUrl()}" data-name="{$DETAIL_VIEW_WIDGET->getLabel()}">
							<div class="widget_header row-fluid">
								<span class="col-md-8 margin0px"><h4>{vtranslate($DETAIL_VIEW_WIDGET->getLabel(),$MODULE_NAME)}</h4></span>
							</div>
							<div class="widget_contents">
							</div>
						</div>
					</div>
				{/if}
			{/foreach}
		</div>
		<div class="col-lg-5 paddingRight" style="overflow: hidden">
			<div id="relatedActivities">
				{$RELATED_ACTIVITIES}
			</div>
			{foreach item=DETAIL_VIEW_WIDGET from=$DETAILVIEW_LINKS['DETAILVIEWWIDGET'] name=count}
				{if $smarty.foreach.count.index % 2 != 0}
					<div class="summaryWidgetContainer">
						<div class="widgetContainer_{$smarty.foreach.count.index}" data-url="{$DETAIL_VIEW_WIDGET->getUrl()}" data-name="{$DETAIL_VIEW_WIDGET->getLabel()}">
							<div class="widget_header row-fluid">
								<span class="col-md-8 margin0px"><h4>{vtranslate($DETAIL_VIEW_WIDGET->getLabel(),$MODULE_NAME)}</h4></span>
							</div>
							<div class="widget_contents">
							</div>
						</div>
					</div>
				{/if}
			{/foreach}
		</div>
	</div>
</div>
{/strip}
