/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/


jQuery.Class("Calendar_CalendarView_Js",{

	currentInstance : false,

	getInstanceByView : function(){
	    var view = jQuery('#currentView').val();
		var jsFileName = view+'View';
	    var moduleClassName = view+"_"+jsFileName+"_Js";
	    if(typeof window[moduleClassName] != 'undefined'){
			var instance = new window[moduleClassName]();
		} else {
			instance = new Calendar_CalendarView_Js();
		}
	    return instance;
	},

	initiateCalendarFeeds : function() {
		Calendar_CalendarView_Js.currentInstance.performCalendarFeedIntiate();
	}
},{

	calendarView : false,
	calendarCreateView : false,
	//Hold the conditions for a hour format
	hourFormatConditionMapping : false,

	//Hold the saved values of calendar settings
	calendarSavedSettings : false,

	CalendarSettingsContainer : false,

	weekDaysArray : {Sunday : 0,Monday : 1, Tuesday : 2, Wednesday : 3,Thursday : 4, Friday : 5, Saturday : 6},

	calendarfeedDS : {},

	getCalendarView : function() {
		if(this.calendarView == false) {
			this.calendarView = jQuery('#calendarview');
		}
		return this.calendarView;
	},
	
	droppable: true, // this allows things to be dropped onto the calendar !!!
	
	 drop: function(date, allDay) { // this function is called when something is dropped

         // retrieve the dropped element's stored Event Object
         var originalEventObject = $(this).data('eventObject');

         // we need to copy it, so that multiple events don't have a reference to the same object
         var copiedEventObject = $.extend({}, originalEventObject);

         // assign it the date that was reported
         copiedEventObject.start = date;
         copiedEventObject.allDay = allDay;

         // render the event on the calendar
         // the last `true` argument determines if the event "sticks" (http://arshaw.com/fullcalendar/docs/event_rendering/renderEvent/)
         $('#calendar').fullCalendar('renderEvent', copiedEventObject, true);

         // is the "remove after drop" checkbox checked?
         if ($('#drop-remove').is(':checked')) {
             // if so, remove the element from the "Draggable Events" list
             $(this).remove();
         }

     },

	getCalendarSettingsForm : function() {
		return this.CalendarSettingsContainer;
	},

	getCalendarCreateView : function() {
		var thisInstance = this;
		var aDeferred = jQuery.Deferred();

		if(this.calendarCreateView !== false) {
			aDeferred.resolve(this.calendarCreateView.clone(true,true));
			return aDeferred.promise();
		}
		var progressInstance = jQuery.progressIndicator();
		this.loadCalendarCreateView().then(
			function(data){
				progressInstance.hide();
				thisInstance.calendarCreateView = data;
				aDeferred.resolve(data.clone(true,true));
			},
			function(){
				progressInstance.hide();
			}
		);
		return aDeferred.promise();
	},

	loadCalendarCreateView : function() {
		var aDeferred  = jQuery.Deferred();
		var quickCreateCalendarElement = jQuery('#quickCreateModules').find('[data-name="Calendar"]');
		var url = quickCreateCalendarElement.data('url');
		var name = quickCreateCalendarElement.data('name');

		var headerInstance = new Vtiger_Header_Js();
		headerInstance.getQuickCreateForm(url,name).then(
			function(data){
				aDeferred.resolve(jQuery(data));
			},
			function(){
				aDeferred.reject();
			}
		);
		return aDeferred.promise();
	},

	fetchCalendarFeed : function(feedcheckbox) {
		function toDateString(date) {
			var d = date.getDate();
			var m = date.getMonth() +1;
			var y = date.getFullYear();

			d = (d <= 9)? ("0"+d) : d;
			m = (m <= 9)? ("0"+m) : m;
			return y + "-" + m + "-" + d;
		}

		var type = feedcheckbox.data('calendar-sourcekey');
		this.calendarfeedDS[type] = function(start, end, callback) {
			if(feedcheckbox.not(':checked').length > 0) {
				callback([]);
				return;
			}
			feedcheckbox.attr('disabled', true);
			var params = {
				module: 'Calendar',
				action: 'Feed',
				start: toDateString(start),
				end: toDateString(end),
				type: feedcheckbox.data('calendar-feed'),
				userid : feedcheckbox.data('calendar-userid'),
				cssClass: feedcheckbox.data('calendar-feed-css')
			}
			var customData = feedcheckbox.data('customData');
			if( customData != undefined) {
				params = jQuery.extend(params, customData);
			}

			AppConnector.request(params).then(function(events){
				callback(events);
				feedcheckbox.attr('disabled', false).attr('checked', true);
			},
            function(error){
                //To send empty events if error occurs
                callback([]);
            });
		}

		this.getCalendarView().fullCalendar('addEventSource', this.calendarfeedDS[type]);
	},

	fetchAllCalendarFeeds : function(calendarfeedidx) {
		var thisInstance = this;
		var calendarfeeds = jQuery('[data-calendar-feed]');

		//TODO : see if you get all the feeds in one request
		calendarfeeds.each(function(index,element){
			var feedcheckbox = jQuery(element);
			var	disabledOnes = app.cacheGet('calendar.feeds.disabled',[]);
			if (disabledOnes.indexOf(feedcheckbox.data('calendar-sourcekey')) == -1) {
				feedcheckbox.attr('checked',true);
			}
			thisInstance.fetchCalendarFeed(feedcheckbox);
		});
	},

	performCalendarFeedIntiate : function() {
		this.registerCalendarFeedChange();
		this.fetchAllCalendarFeeds();
	},

	registerCalendarFeedChange : function() {
		var thisInstance = this;
		var calendarfeeds = jQuery('[data-calendar-feed]');

		calendarfeeds.bind('change', function(){
			var type = $(this).data('calendar-sourcekey');
			if($(this).is(':checked')) {
				// NOTE: We are getting cache data fresh - as it shared between browser tabs
				var disabledOnes = app.cacheGet('calendar.feeds.disabled',[]);
				// http://stackoverflow.com/a/3596096
				disabledOnes = jQuery.grep(disabledOnes, function(value){return value != type;});
				app.cacheSet('calendar.feeds.disabled', disabledOnes);

				thisInstance.getCalendarView().fullCalendar('addEventSource', thisInstance.calendarfeedDS[type]);
			} else {
				// NOTE: We are getting cache data fresh - as it shared between browser tabs
				var disabledOnes = app.cacheGet('calendar.feeds.disabled',[]);
				if (disabledOnes.indexOf(type) == -1) disabledOnes.push(type);
				app.cacheSet('calendar.feeds.disabled', disabledOnes);

				thisInstance.getCalendarView().fullCalendar('removeEventSource', thisInstance.calendarfeedDS[type]);
			}
		});
	},

	dayClick : function(date, allDay, jsEvent, view){
		var thisInstance = this;
		this.getCalendarCreateView().then(function(data){
			if(data.length <= 0) {
				return;
			}
			var dateFormat = data.find('[name="date_start"]').data('dateFormat');

			var startDateInstance = Date.parse(date);
			var startDateString = app.getDateInVtigerFormat(dateFormat,startDateInstance);
			var startTimeString = startDateInstance.toString('hh:mm tt');

			var endDateInstance = Date.parse(date);
			if(data.find('[name="activitytype"]').val() == 'Call'){
				var defaulCallDuration = data.find('[name="defaultCallDuration"]').val();
				endDateInstance.addMinutes(defaulCallDuration);
			} else {
				var defaultOtherEventDuration = data.find('[name="defaultOtherEventDuration"]').val();
				endDateInstance.addMinutes(defaultOtherEventDuration);
			}
			var endDateString = app.getDateInVtigerFormat(dateFormat,endDateInstance);
			var endTimeString = endDateInstance.toString('hh:mm tt');

			data.find('[name="date_start"]').val(startDateString);
			data.find('[name="due_date"]').val(endDateString);

			data.find('[name="time_start"]').val(startTimeString);
			data.find('[name="time_end"]').val(endTimeString);

			var headerInstance = new Vtiger_Header_Js();
			headerInstance.handleQuickCreateData(data, {callbackFunction:function(data){
					thisInstance.addCalendarEvent(data.result);
			}});
		});

	},

	registerCalendar : function(customConfig) {
		var thisInstance = this;
		var calendarview = this.getCalendarView();

		//User preferred default view
		var userDefaultActivityView = jQuery('#activity_view').val();
		if(userDefaultActivityView == 'Today'){
			userDefaultActivityView ='agendaDay';
		}else if(userDefaultActivityView == 'This Week'){
			userDefaultActivityView ='agendaWeek';
		}else{
			userDefaultActivityView ='month';
		}

		//Default time format
		var userDefaultTimeFormat = jQuery('#time_format').val();
		if(userDefaultTimeFormat == 24){
			userDefaultTimeFormat = 'H(:mm)';
		} else {
			userDefaultTimeFormat = 'h(:mm)tt';
		}

		//Default first day of the week
		var defaultFirstDay = jQuery('#start_day').val();
		var convertedFirstDay = thisInstance.weekDaysArray[defaultFirstDay];

		//Default first hour of the day
		var defaultFirstHour = jQuery('#start_hour').val();
		var explodedTime = defaultFirstHour.split(':');
		defaultFirstHour = explodedTime['0'];

		var config = {
			header: {
				left: 'month,agendaWeek,agendaDay',
				center: 'title today',
				right: 'prev,next'
			},
			height: 600,
			axisFormat: userDefaultTimeFormat,
			firstHour : defaultFirstHour,
			firstDay : convertedFirstDay,
			defaultView: userDefaultActivityView,
			
			monthNames: [app.vtranslate('LBL_JANUARY'),app.vtranslate('LBL_FEBRUARY'),app.vtranslate('LBL_MARCH'),
				app.vtranslate('LBL_APRIL'),app.vtranslate('LBL_MAY'),app.vtranslate('LBL_JUNE'),app.vtranslate('LBL_JULY'),
				app.vtranslate('LBL_AUGUST'),app.vtranslate('LBL_SEPTEMBER'), app.vtranslate('LBL_OCTOBER'),
				app.vtranslate('LBL_NOVEMBER'), app.vtranslate('LBL_DECEMBER') ], 
			
			monthNamesShort: [app.vtranslate('LBL_JAN'),app.vtranslate('LBL_FEB'),app.vtranslate('LBL_MAR'),
				app.vtranslate('LBL_APR'),app.vtranslate('LBL_MAY'),app.vtranslate('LBL_JUN'),app.vtranslate('LBL_JUL'),
				app.vtranslate('LBL_AUG'),app.vtranslate('LBL_SEP'),app.vtranslate('LBL_OCT'),app.vtranslate('LBL_NOV'),
				app.vtranslate('LBL_DEC')],
			
			dayNames: [ app.vtranslate('LBL_SUNDAY'), app.vtranslate('LBL_MONDAY'), app.vtranslate('LBL_TUESDAY'),
				app.vtranslate('LBL_WEDNESDAY'), app.vtranslate('LBL_THURSDAY'), app.vtranslate('LBL_FRIDAY'),
				app.vtranslate('LBL_SATURDAY')],
			
			dayNamesShort: [ app.vtranslate('LBL_SUN'), app.vtranslate('LBL_MON'), app.vtranslate('LBL_TUE'),
				app.vtranslate('LBL_WED'), app.vtranslate('LBL_THU'), app.vtranslate('LBL_FRI'),
				app.vtranslate('LBL_SAT')],
			
			buttonText: {
				today: app.vtranslate('LBL_TODAY'),
				month: app.vtranslate('LBL_MONTH'),
				week: app.vtranslate('LBL_WEEK'),
				day: app.vtranslate('LBL_DAY')
			},
			allDayText : app.vtranslate('LBL_ALL_DAY'),
			
			dayClick : function(date, allDay, jsEvent, view){thisInstance.dayClick(date, allDay, jsEvent, view);}
		}
		if(typeof customConfig != 'undefined'){
			config = jQuery.extend(config,customConfig);
		}
		calendarview.fullCalendar(config);

		//To create custom button to create event or task
		jQuery('<span class="pull-left"><button class="btn addButton">'+ app.vtranslate('LBL_ADD_EVENT_TASK') +'</button></span>')
				.prependTo(calendarview.find('.fc-header .fc-header-right')).on('click', 'button', function(e){
					thisInstance.getCalendarCreateView().then(function(data){
						var headerInstance = new Vtiger_Header_Js();
						headerInstance.handleQuickCreateData(data,{callbackFunction:function(data){
								thisInstance.addCalendarEvent(data.result);
						}});
					});

				})
		jQuery('<span class="pull-right marginLeft5px"><button class="btn"><i id="calendarSettings" class="fa fa-cog"></i></button></span>')
		.prependTo(calendarview.find('.fc-header .fc-header-right')).on('click', 'button', function(e){
			var params = {
				module : 'Calendar',
				view : 'Calendar',
				mode : 'Settings'
			}
			var progressIndicatorInstance = jQuery.progressIndicator({
				});
			AppConnector.request(params).then(function(data){
				var callBack = function(data){
					thisInstance.CalendarSettingsContainer = jQuery(data);
					app.showScrollBar(jQuery('div[name="contents"]',data), {'height':'400px'});
					//register all select2 Elements
					app.showSelect2ElementView(jQuery(data).find('select.select2'));

					progressIndicatorInstance.hide();
					thisInstance.hourFormatConditionMapping = jQuery('input[name="timeFormatOptions"]',data).data('value');
					thisInstance.changeStartHourValuesEvent();
					thisInstance.changeCalendarSharingType(data);
				}
				app.showModalWindow({'data':data,'cb':callBack});
			});

		})

	},

	changeCalendarSharingType : function(data) {
		jQuery('[name="sharedtype"]').on('change',function(e) {
			var sharingType = jQuery(e.currentTarget).data('sharingtype');
			var selectedUsersContainer = app.getSelect2ElementFromSelect(jQuery('#selectedUsers',data));

			if(sharingType == 'selectedusers') {
				selectedUsersContainer.show();
			} else {
				selectedUsersContainer.hide();
			}
		});
	},

	changeStartHourValuesEvent : function(e){
		var form = this.getCalendarSettingsForm();
		var thisInstance = this;
		form.on('click','input[name="hour_format"]',function(e){
			var hourFormatVal = jQuery(e.currentTarget).val();
			var startHourElement = jQuery('select[name="start_hour"]',form);
			var conditionSelected = startHourElement.val();
			var list = thisInstance.hourFormatConditionMapping['hour_format'][hourFormatVal]['start_hour'];
			var options = '';
			for(var key in list) {
				//IE Browser consider the prototype properties also, it should consider has own properties only.
				if(list.hasOwnProperty(key)) {
					var conditionValue = list[key];
					options += '<option value="'+key+'"';
					if(key == conditionSelected){
						options += ' selected="selected" ';
					}
					options += '>'+conditionValue+'</option>';
				}
			}
			startHourElement.html(options).trigger("change");
		});


	},

	isAllowedToAddCalendarEvent : function (calendarDetails) {
		var activityType = calendarDetails.activitytype.value;
		if(activityType == 'Tasks'  && jQuery('[data-calendar-feed="Tasks"]').is(':checked')) {
			return true;
		} else if(jQuery('[data-calendar-feed="Events"]').is(':checked')){
			return true;
		} else {
			return false;
		}
	},
	addCalendarEvent : function(calendarDetails) {
		//If type is not shown then dont render the created event
		var isAllowed = this.isAllowedToAddCalendarEvent(calendarDetails);
		if(isAllowed == false) return;

		var eventObject = {};
		eventObject.id = calendarDetails._recordId;
		eventObject.title = calendarDetails.subject.display_value;
		var startDate = Date.parse(calendarDetails.date_start.calendar_display_value);
		eventObject.start = startDate.toString();
		var endDate = Date.parse(calendarDetails.due_date.calendar_display_value);
		var assignedUserId = calendarDetails.assigned_user_id.value;
		eventObject.end = endDate.toString();
		eventObject.url = 'index.php?module=Calendar&view=Detail&record='+calendarDetails._recordId;
		if(calendarDetails.activitytype.value == 'Task'){
			var cssClass = jQuery('[data-calendar-feed="Tasks"]').data('calendarFeedCss');
			eventObject.allDay = true;
		}else{
			var cssClass = jQuery('[data-calendar-feed="Events"]').data('calendarFeedCss');
			var color = jQuery('[data-calendar-userid='+assignedUserId+']').data('calendar-feed-color');
			var textColor = jQuery('[data-calendar-userid='+assignedUserId+']').data('calendar-feed-textcolor');
			eventObject.allDay = false;
		}

		eventObject.className = cssClass;
		eventObject.color = color;
		eventObject.textColor = textColor;
		this.getCalendarView().fullCalendar('renderEvent',eventObject);
	},

	registerEvents : function() {
		this.registerCalendar();
		jQuery('[data-widget-url="module=Calendar&view=ViewTypes&mode=getViewTypes"]').trigger('click');
		jQuery('.widgetContainer').trigger('shown');
		return this;
	}
});

jQuery(document).ready(function() {
	var instance = Calendar_CalendarView_Js.getInstanceByView();
	instance.registerEvents()
	Calendar_CalendarView_Js.currentInstance = instance;
})