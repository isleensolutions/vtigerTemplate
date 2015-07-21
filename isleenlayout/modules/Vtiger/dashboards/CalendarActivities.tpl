<section class="panel">
<div class="dashboardWidgetHeader">
    <table width="100%" cellspacing="0" cellpadding="0">
    <thead>
        <tr>
            <th class="span4">
                <div class="dashboardTitle" title="{vtranslate($WIDGET->getTitle(), $MODULE_NAME)}"><b>&nbsp;&nbsp;{vtranslate($WIDGET->getTitle())}</b></div>
            </th>
            <th class="span2">
                <div>
                    <select class="widgetFilter" name="type" style='width:100px;margin-bottom:0px'>
                        <option value="{$CURRENTUSER->getId()}">{vtranslate('LBL_MINE')}</option>
                        <option value="all">{vtranslate('LBL_ALL')}</option>
                    </select>
                </div>
            </th>
            <th class="refresh span1" align="right">
                <span style="position:relative;"></span>
            </th>
            <th class="widgeticons span5" align="right">
                {include file="dashboards/DashboardHeaderIcons.tpl"|@vtemplate_path:$MODULE_NAME}
            </th>
        </tr>
    </thead>
    </table>
</div>
<div name="history" class="dashboardWidgetContent">
    {include file="dashboards/CalendarActivitiesContents.tpl"|@vtemplate_path:$MODULE_NAME WIDGET=$WIDGET}
</div>
  </section>


<script type='text/javascript'>
    $(document).ready(function(){
        jQuery('.dashboardWidgetContent').off('click', 'a[name="history_more"]');
        jQuery('.dashboardWidgetContent').on('click', 'a[name="history_more"]', function(e) {
                var element = jQuery(e.currentTarget);
                var parent = jQuery(e.delegateTarget).closest('.dashboardWidget');
                jQuery(parent).find('.slimScrollDiv').css('overflow','visible');
                var type = parent.find("[name='type']").val();
                var url = element.data('url')+'&content=true&type='+type;
                AppConnector.request(url).then(function(data) {
                    jQuery(parent).find('.dashboardWidgetContent').append(data);
                    element.parent().remove();
                });
        });
    });
</script>




{*<section class="panel">
<header class="dashboardWidgetHeader panel-heading">
	<table width="100%" cellspacing="0" cellpadding="0">
	<thead>
		<tr>
			<th class="">
				<div class="dashboardTitle" title="{vtranslate($WIDGET->getTitle(), $MODULE_NAME)}"><h4>{vtranslate($WIDGET->getTitle())}</h4></div>
			</th>
			<th class="col-md-2">
				<div>
					<select class="widgetFilter form-control" name="type" style='width:100px;margin-bottom:0px;padding: 6px;'>
						<option value="{$CURRENTUSER->getId()}">{vtranslate('LBL_MINE')}</option>
						<option value="all">{vtranslate('LBL_ALL')}</option>
					</select>
				</div>
			</th>
			<th class="refresh col-md-1" align="right">
				<span style="position:relative;"></span>
			</th>
			<th class="widgeticons" align="right">
				{include file="dashboards/DashboardHeaderIcons.tpl"|@vtemplate_path:$MODULE_NAME}
			</th>
		</tr>
	</thead>
	</table>
</header>
<div name="history" class="dashboardWidgetContent panel-body">
	{include file="dashboards/CalendarActivitiesContents.tpl"|@vtemplate_path:$MODULE_NAME WIDGET=$WIDGET}
</div>

</section>

<script type='text/javascript'>
	$(document).ready(function(){
		jQuery('.dashboardWidgetContent').on('click', 'a[name="history_more"]', function(e) {
			var element = jQuery(e.currentTarget);
			var url = element.data('url')+'&content=true';
			AppConnector.request(url).then(function(data) {
				jQuery(element.parent().parent()).append(data);
				element.parent().remove();
			});
		});
	});
</script>  
*} 