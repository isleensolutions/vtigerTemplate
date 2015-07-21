{strip}
<div name='calendarViewTypes'>
	<div id="calendarview-feeds" style="margin-left:10px;">
		<label class="checkbox" style="text-shadow: none">
			<input type="checkbox" data-calendar-sourcekey="Events33_{$CURRENTUSER_MODEL->getId()}" data-calendar-feed="Events" data-calendar-userid="{$CURRENTUSER_MODEL->getId()}" > <span class="label" style="text-shadow: none">{vtranslate('LBL_MINE',$MODULE)}</span>
		</label>	
		{foreach key=ID item=USER from=$SHAREDUSERS}
			<label class="checkbox">
				<input type="checkbox" data-calendar-sourcekey="Events33_{$ID}" data-calendar-feed="Events" data-calendar-userid="{$ID}" > <span class="label" style="text-shadow: none">{$USER}</span>
			</label>
		{/foreach}
	</div>
</div>
{/strip}
<script type="text/javascript">
jQuery(document).ready(function() {
	SharedCalendar_SharedCalendarView_Js.initiateCalendarFeeds();
});
</script>