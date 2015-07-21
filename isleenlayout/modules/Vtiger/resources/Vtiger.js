/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

var Vtiger_Index_Js = {

	/**
	 * Function to show email preview in popup
	 */
	showEmailPreview : function(recordId, parentId) {
		var popupInstance = Vtiger_Popup_Js.getInstance();
		var params = {};
		params['module'] = "Emails";
		params['view'] = "ComposeEmail";
		params['mode'] = "emailPreview";
		params['record'] = recordId;
		params['parentId'] = parentId;
		params['relatedLoad'] = true;
		popupInstance.show(params);
	},
    
    registerWidgetsEvents : function() {
  var widgets = jQuery('div.widgetContainer');   
        
        $('.quickWidget').click(function(e){
         var icon = jQuery(e.currentTarget).find('.imageElement');
         
         var container =  jQuery(e.currentTarget).find('.widgetContainer');
            var widgetContainer = jQuery(container);  
                    Vtiger_Index_Js.loadWidgets(widgetContainer);
                    var key = widgetContainer.attr('id');
                    app.cacheSet(key, 1);             
                    icon.toggleClass('fa-angle-right');
                    icon.toggleClass('fa-angle-down');
           //newicon.css("display","block")
        })  ;  
     }, 
	
  /*  registerWidgetsEvents : function() {
        var widgets = jQuery('div.widgetContainer');
        widgets.on({
                shown: function(e) {
                    var widgetContainer = jQuery(e.currentTarget);
                    Vtiger_Index_Js.loadWidgets(widgetContainer);
                    var key = widgetContainer.attr('id');
                    app.cacheSet(key, 1);
            },
                hidden: function(e) {
                    var widgetContainer = jQuery(e.currentTarget);
                    var imageEle = widgetContainer.parent().find('.imageElement');
                    var imagePath = imageEle.data('rightimage');
                    imageEle.attr('src',imagePath);
                    var key = widgetContainer.attr('id');
                    app.cacheSet(key, 0);
            }
        });
    },    */
    

	loadWidgets : function(widgetContainer) {
		var message = jQuery('.loadingWidgetMsg').html();

		if(widgetContainer.html() != '') {
			var imageEle = widgetContainer.parent().find('.imageElement');
			var imagePath = imageEle.data('downimage');
			imageEle.attr('src',imagePath);
			widgetContainer.css('height', 'auto');
			return;
		}

		widgetContainer.progressIndicator({'message' : message});
		var url = widgetContainer.data('url');

		var listViewWidgetParams = {
			"type":"GET", "url":"index.php",
			"dataType":"html", "data":url
		}
		AppConnector.request(listViewWidgetParams).then(
			function(data){
				widgetContainer.progressIndicator({'mode':'hide'});
				var imageEle = widgetContainer.parent().find('.imageElement');
				var imagePath = imageEle.data('downimage');
				imageEle.attr('src',imagePath);
				widgetContainer.css('height', 'auto');
				widgetContainer.html(data);
				var label = widgetContainer.closest('.quickWidget').find('.quickWidgetHeader').data('label');
				jQuery('.main-content').trigger('Vtiger.Widget.Load.'+label,jQuery(widgetContainer));
			}
		);
	},

	loadWidgetsOnLoad : function(){
		var widgets = jQuery('div.widgetContainer');
		widgets.each(function(index,element){
			var widgetContainer = jQuery(element);
			var key = widgetContainer.attr('id');
			var value = app.cacheGet(key);
			if(value != null){
				if(value == 1) {
					Vtiger_Index_Js.loadWidgets(widgetContainer);
					widgetContainer.addClass('in');
				} else {
					var imageEle = widgetContainer.parent().find('.imageElement');
					var imagePath = imageEle.data('rightimage');
					imageEle.attr('src',imagePath);
				}
			}

		});

	},

	/**
	 * Function to show compose email popup based on number of
	 * email fields in given module,if email fields are more than
	 * one given option for user to select email for whom mail should
	 * be sent,or else straight away open compose email popup
	 * @params : accepts params object
	 *
	 * @cb: callback function to recieve the child window reference.
	 */

	showComposeEmailPopup : function(params, cb){
		var currentModule = "Emails";
		Vtiger_Helper_Js.checkServerConfig(currentModule).then(function(data){
			if(data == true){
				var css = jQuery.extend({'text-align' : 'left'},css);
				AppConnector.request(params).then(
					function(data) {
						var cbargs = [];
						if(data) {
							data = jQuery(data);
							var form = data.find('#SendEmailFormStep1');
							var emailFields = form.find('.emailField');
							var length = emailFields.length;
							var emailEditInstance = new Emails_MassEdit_Js();
							if(length > 1) {
								app.showModalWindow(data,function(data){
									emailEditInstance.registerEmailFieldSelectionEvent();
									if( jQuery('#multiEmailContainer').height() > 300 ){
										jQuery('#multiEmailContainer').slimScroll({
											height: '300px',
											railVisible: true,
											alwaysVisible: true,
											size: '6px',
										});
									}
								},css);
							} else {
								emailFields.attr('checked','checked');
								var params = form.serializeFormData();
								// http://stackoverflow.com/questions/13953321/how-can-i-call-a-window-child-function-in-javascript
								// This could be useful for the caller to invoke child window methods post load.
								var win = emailEditInstance.showComposeEmailForm(params);
								cbargs.push(win);
							}
						}
						if (typeof cb == 'function') cb.apply(null, cbargs);
					},
					function(error,err){

					}
				);
			} else {
				Vtiger_Helper_Js.showPnotify(app.vtranslate('JS_EMAIL_SERVER_CONFIGURATION'));
			}
		})

	},

	/**
	 * Function registers event for Calendar Reminder popups
	 */
	registerActivityReminder : function() {
		var activityReminder = jQuery('#activityReminder').val();
		activityReminder = activityReminder * 1000;
		if(activityReminder != '') {
			var currentTime = new Date().getTime()/1000;
			var nextActivityReminderCheck = app.cacheGet('nextActivityReminderCheckTime', 0);
			if((currentTime + activityReminder) > nextActivityReminderCheck) {
				Vtiger_Index_Js.requestReminder();
				setTimeout('Vtiger_Index_Js.requestReminder()', activityReminder);
				app.cacheSet('nextActivityReminderCheckTime', currentTime + parseInt(activityReminder));
			}
		}
	},

	/**
	 * Function request for reminder popups
	 */
	requestReminder : function() {
		var url = 'index.php?module=Calendar&action=ActivityReminder&mode=getReminders';
		AppConnector.request(url).then(function(data){
			if(data.success && data.result) {
				for(i=0; i< data.result.length; i++) {
					var record  = data.result[i];
					Vtiger_Index_Js.showReminderPopup(record);
				}
			}
		});
	},

	/**
	 * Function display the Reminder popup
	 */
	showReminderPopup : function(record) {
		var params = {
			title: '&nbsp;&nbsp;<span style="position: relative; top: 8px;">'+record.activitytype+' - '+
					'<a target="_blank" href="index.php?module=Calendar&view=Detail&record='+record.id+'">'+record.subject+'</a></span>',
			text: '<div class="row-fluid" style="color:black">\n\
							<span class="col-md-12">'+app.vtranslate('JS_START_DATE_TIME')+' : '+record.date_start+'</span>\n\
							<span class="col-md-8">'+app.vtranslate('JS_END_DATE_TIME')+' : '+record.due_date+'</span>'+
							'<span class="col-md-3 right"><h4><a id="reminder_'+record.id+'" class="pull-right" href=#>'
								+app.vtranslate('JS_POSTPONE')+'</a></h4></span></div>',
			width: '30%',
			min_height: '75px',
			addclass:'vtReminder',
			icon: 'vtReminder-icon',
			hide:false,
			closer:true,
			type:'info',
			after_open:function(p) {
				jQuery(p).data('info', record);
			}
		};
		var notify = Vtiger_Helper_Js.showPnotify(params);

		jQuery('#reminder_'+record.id).bind('click', function() {
			notify.remove();
			var url = 'index.php?module=Calendar&action=ActivityReminder&mode=postpone&record='+record.id;
			AppConnector.request(url);
		});
	},

	/**
	 * Function to make top-bar menu responsive.
	 */
	adjustTopMenuBarItems: function() {
		var TOLERANT_MAX_GAP = 40; // px
		var menuBarWrapper = jQuery('.nav.modulesList');
		var topMenuBarWidth = menuBarWrapper.parent().outerWidth();
		var optionalBarItems = jQuery('.opttabs', menuBarWrapper), optionalBarItemsCount = optionalBarItems.length;
		var optionalBarItemIndex = optionalBarItemsCount;
		function enableOptionalTopMenuItem() {
			var opttab  = (optionalBarItemIndex > 0) ? optionalBarItems[optionalBarItemIndex-1] : null;
			if (opttab) { opttab = jQuery(opttab); opttab.hide(); optionalBarItemIndex--; }
			return opttab;
		}
		// Loop and enable hidden menu item until the tolerant width is reached.
		var stopLoop = false;
		do {
			var lastOptTab = enableOptionalTopMenuItem();
			if (lastOptTab == null || (topMenuBarWidth - menuBarWrapper.outerWidth()) > TOLERANT_MAX_GAP) {
				if(lastOptTab) lastOptTab.hide();
				stopLoop = true; break;
			}
		} while (!stopLoop);

		// Required to get the functionality of All drop-down working.
		menuBarWrapper.parent().css({'overflow':'visible'});
	},

	/**
     * Function to trigger tooltip feature.
     */
    registerTooltipEvents: function() {
        var references = jQuery.merge(jQuery('[data-field-type="reference"] > a'), jQuery('[data-field-type="multireference"] > a'));
        var lastPopovers = [];

        // Fetching reference fields often is not a good idea on a given page.
        // The caching is done based on the URL so we can reuse.
        var CACHE_ENABLED = true; // TODO - add cache timeout support.

        function prepareAndShowTooltipView() {
            hideAllTooltipViews();

            var el = jQuery(this);
            var url = el.attr('href')? el.attr('href') : '';
            if (url == '') {
                return;
            }

            // Rewrite URL to retrieve Tooltip view.
            url = url.replace('view=', 'xview=') + '&view=TooltipAjax';

            var cachedView = CACHE_ENABLED ? jQuery('[data-url-cached="'+url+'"]') : null;
            if (cachedView && cachedView.length) {
                showTooltip(el, cachedView.html());
            } else {
                AppConnector.request(url).then(function(data){
                    cachedView = jQuery('<div>').css({display:'none'}).attr('data-url-cached', url);
                    cachedView.html(data);
                    jQuery('body').append(cachedView);
                    showTooltip(el, data);
                });
            }
        }

        function showTooltip(el, data) {
            el.popover({
                //title: '', - Is derived from the Anchor Element (el).
                trigger: 'manual',
                content: data,
                container: 'body',//Added this for popover in listview
                html: 'text',//Added this for popover in listview
                placement: 'right',//Added this for popover in listview
                animation: false,
                template: '<div class="popover popover-tooltip"><div class="arrow"></div><div class="popover-inner"><button name="vtTooltipClose" class="close" style="color:white;opacity:1;font-weight:lighter;position:relative;top:3px;right:3px;">x</button><h3 class="popover-title"></h3><div class="popover-content"><div></div></div></div></div>'
            });
            lastPopovers.push(el.popover('show'));
            registerToolTipDestroy();
        }

        function hideAllTooltipViews() {
            // Hide all previous popover
            var lastPopover = null;
            while (lastPopover = lastPopovers.pop()) {
                lastPopover.popover('hide');
            }
        }

        references.each(function(index, el){
            jQuery(el).hoverIntent({
                interval: 100,
                sensitivity: 7,
                timeout: 10,
                over: prepareAndShowTooltipView,
                out: hideAllTooltipViews
            });
        });

        function registerToolTipDestroy() {
            jQuery('button[name="vtTooltipClose"]').on('click', function(e){
                var lastPopover = lastPopovers.pop();
                lastPopover.popover('hide');
            });
        }
    },

	registerShowHideLeftPanelEvent : function() {
		jQuery('#toggleButton').click(function(e){
            e.preventDefault();
			var leftPanel = jQuery('#leftPanel');
			var rightPanel = jQuery('#rightPanel');
			var tButtonImage = jQuery('#tButtonImage');
			if (leftPanel.attr('class').indexOf(' hide') == -1) {
                var leftPanelshow = 1;
				leftPanel.addClass('hide');
				rightPanel.removeClass('col-md-10').addClass('col-md-12');
				tButtonImage.removeClass('icon-chevron-left').addClass("icon-chevron-right");
			} else {
                var leftPanelshow = 0;
				leftPanel.removeClass('hide');
				rightPanel.removeClass('col-md-12').addClass('col-md-10');
				tButtonImage.removeClass('icon-chevron-right').addClass("icon-chevron-left");
			}
            var params = {
                'module' : 'Users',
                'action' : 'IndexAjax',
                'mode' : 'toggleLeftPanel',
                'showPanel' : leftPanelshow
            }
            AppConnector.request(params);
		});
	},  
	
	//functions to get the notifications, todo lists and messages
	
	getNotifications : function(){
		var url = 'index.php?module=Home&view=IndexAjax&mode=getNotifications';
		var params = {
                'module' : 'Ajax',
                'view' : 'IndexAjax',
                'mode' : 'getNotifications'
            }
		jQuery.ajax({
			type:'POST',
			url:url
		}).done(function(html){
			jQuery("#header_notification_bar").html(html);
			Vtiger_Index_Js.registerNofication();
			$(".notification").niceScroll({styler:"fb",cursorcolor:"#e8403f", cursorwidth: '6', cursorborderradius: '10px', background: '#404040', spacebarenabled:false, cursorborder: ''});
		})
	},
	
	getTasks : function(){
		var url = 'index.php?module=Home&view=IndexAjax&mode=getTasks';
		jQuery.ajax({
			type: 'GET',
			url:url
		}).done(function(html){
			jQuery("#header_task_notification").html(html);
		})
	},

	registerEvents : function(){
		Vtiger_Index_Js.registerWidgetsEvents();
		Vtiger_Index_Js.loadWidgetsOnLoad();
		Vtiger_Index_Js.registerActivityReminder();
		Vtiger_Index_Js.adjustTopMenuBarItems();
		Vtiger_Index_Js.registerPostAjaxEvents();
		Vtiger_Index_Js.registerShowHideLeftPanelEvent();
	},

	registerPostAjaxEvents: function() {
		Vtiger_Index_Js.registerTooltipEvents();
	},
	
	registerNofication : function(){
		if(jQuery("#notification-read").attr("ids") != 0){
		jQuery('#notification-read').on('click',function(){
			var ids = jQuery(this).attr('ids');
			var url = 'index.php?module=ModTracker&view=IndexAjax&mode=setRead';
			jQuery.ajax({
				type:'POST',
				url:url,
				data: {ids:ids}
			}).done(function(){
				jQuery("#notify_count").hide();
			})
		});
		}
	}
}


//On Page Load
jQuery(document).ready(function() {
	Vtiger_Index_Js.registerEvents();
	app.listenPostAjaxReady(function() {
		Vtiger_Index_Js.registerPostAjaxEvents();
	});
	Vtiger_Index_Js.getNotifications();
	Vtiger_Index_Js.getTasks();
});