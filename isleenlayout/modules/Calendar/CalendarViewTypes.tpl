{strip}
<div name='calendarViewTypes'>
	<div id="calendarview-feeds" style="margin-left:10px;">
		<label class="checkbox">
			<input type="checkbox" data-calendar-sourcekey="Events" data-calendar-feed="Events" data-calendar-feed-css="fc-event-style1" > <span class="label fc-event-style1">{vtranslate('LBL_EVENTS', $MODULE)}</span>
		</label>
		<label class="checkbox">
			<input type="checkbox" data-calendar-sourcekey="Tasks" data-calendar-feed="Tasks" data-calendar-feed-css="fc-event-style2" > <span class="label fc-event-style2">{vtranslate('LBL_TODOS', $MODULE)}</span>
		</label>
		<label class="checkbox">
			<input type="checkbox" data-calendar-sourcekey="Potentials" data-calendar-feed="Potentials" data-calendar-feed-css="fc-event-style3"> <span class="label fc-event-style3">{vtranslate('Potentials', 'Potentials')}</span>
		</label>
		<label class="checkbox">
			<input type="checkbox" data-calendar-sourcekey="Contacts_Support_End_Date" data-calendar-feed="Contacts" data-calendar-feed-css="fc-event-style4" data-custom-data='{ldelim}"fieldname":"support_end_date"{rdelim}' />
			<span class="label fc-event-style4">{vtranslate('LBL_CONTACTS_SUPPORT_END_DATE', $MODULE)}</span>
		</label>
		<label class="checkbox">
			<input type="checkbox" data-calendar-sourcekey="Contacts_Birthday" data-calendar-feed="Contacts" data-calendar-feed-css="fc-event-style6" data-custom-data='{ldelim}"fieldname":"birthday"{rdelim}' />
			<span class="label fc-event-style6">{vtranslate('LBL_CONTACTS_BIRTH_DAY', $MODULE)}</span>
		</label>
		<label class="checkbox">
			<input type="checkbox" data-calendar-sourcekey="Invoice" data-calendar-feed="Invoice" data-calendar-feed-css="fc-event-style5"> <span class="label fc-event-style5">{vtranslate('SINGLE_Invoice', 'Invoice')}</span>
		</label>
		<label class="checkbox">
			<input type="checkbox" data-calendar-sourcekey="Project" data-calendar-feed="Project" data-calendar-feed-css="fc-event-style7"> <span class="label fc-event-style7">{vtranslate('SINGLE_Project', 'Project')}</span>
		</label>
		<label class="checkbox">
			<input type="checkbox" data-calendar-sourcekey="ProjectTask" data-calendar-feed="ProjectTask" data-calendar-feed-css="fc-event-style8"> <span class="label fc-event-style8">{vtranslate('SINGLE_ProjectTask', 'ProjectTask')}</span>
		</label>
	</div>
</div>
{/strip}

<script type="text/javascript">
jQuery(document).ready(function() {
	Calendar_CalendarView_Js.initiateCalendarFeeds();
});
</script>