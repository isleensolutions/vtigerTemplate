/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

jQuery.Class('Settings_MailConverter_List_Js',{
    
	checkMailBoxMaxLimit : function(url) {
		AppConnector.request(url).then(
            function(response) {
				if(typeof response.result != 'undefined'){
					var url = {
						module : app.getModuleName(),
						parent : app.getParentModuleName(),
						view : 'Edit'
					}
					Settings_MailConverter_List_Js.triggerEdit(url);
				} else {
					var params = {
						title : app.vtranslate('JS_MESSAGE'),
						text: response.error.message,
						animation: 'show',
						type: 'info'
					};
					Vtiger_Helper_Js.showPnotify(params);
				}
			}
		)	
		//alert("module=MailConverter&parent='.$this->getParentName().'&view=Edit'");
		
	},
	
	triggerScan : function(url) {
		var progressIndicatorElement = jQuery.progressIndicator({
			'position' : 'html',
			'blockInfo' : {
				'enabled' : true
			}
		});
		AppConnector.request(url).then(
            function(response) {
				if(typeof response.result != 'undefined'){
					var params = {};
					params.record = response.result.id;
					Settings_MailConverter_List_Js.loadMailBox(params);
				} else {
					var params = {
						title : app.vtranslate('JS_MESSAGE'),
						text: response.error.message,
						animation: 'show',
						type: 'error'
					};
					Vtiger_Helper_Js.showPnotify(params);
				}
				 progressIndicatorElement.progressIndicator({
                    'mode' : 'hide'
                });
			}
		);	
	},
	
    triggerEdit : function(url){
        AppConnector.request(url).then(
            function(data) {
                app.showModalWindow(
                    {
                        'data' : data,
                        'cb' : function(container) {
                            //app.showScrollBar(container.find('.modal-body'));

                            // Added for mailconverter popup scroll
                            $(container.find('#mailBoxEditView')).niceScroll({styler:"fb",cursorcolor:"#e8403f", cursorwidth: '6', cursorborderradius: '10px', background: '#404040', spacebarenabled:false, cursorborder: ''});

                            var validationEngineOptions = app.validationEngineOptions;
                            validationEngineOptions['promptPosition'] = 'bottomRight'
                            validationEngineOptions['onValidationComplete'] = function(form, isValid) {
                                if(isValid){
                                    Settings_MailConverter_List_Js.saveMailBox(form.serializeFormData());
                                }
                                return false;
                            }
                            container.find('form').validationEngine('attach',validationEngineOptions);
                        }
                    }
                );
                
            },
            function(error) {
                
            }
        )
    },
    
    triggerDelete : function(url) {
        
        Vtiger_Helper_Js.showConfirmationBox({'message':app.vtranslate('LBL_DELETE_CONFIRMATION')}).then(function(){
            var progressIndicatorElement = jQuery.progressIndicator({
                'position' : 'html',
                'blockInfo' : {
                    'enabled' : true
                }
            });
            AppConnector.request(url).then(function(data){
                progressIndicatorElement.progressIndicator({
                    'mode' : 'hide'
                });
                var deletedRecordId = data.result.id;
                var deletedRecordContainerId = 'SCANNER_'+deletedRecordId;
                jQuery('#'+deletedRecordContainerId).remove();
				var params = {
					title : app.vtranslate('JS_MESSAGE'),
					text: app.vtranslate('JS_MAILBOX_DELETED_SUCCESSFULLY'),
					animation: 'show',
					type: 'success'
				};
				Vtiger_Helper_Js.showPnotify(params);
            });
        });
    },
    
    saveMailBox : function(data) {
		var progressInstance = jQuery.progressIndicator();
		var saveButton = jQuery('#mailBoxEditView').find('[name="saveButton"]');
		saveButton.attr('disabled','disabled');
        var thisInstance = this;
        data.module = app.getModuleName();
        data.parent = app.getParentModuleName();
        data.action = "SaveMailBox";
        AppConnector.request(data).then(
            function(response){
                progressInstance.progressIndicator({
                    'mode' : 'hide'
                });
				if(typeof response.result != 'undefined'){
					var params = {};
					params.record = response.result.id;
					thisInstance.loadMailBox(params);
					app.hideModalWindow();
				} else {
					saveButton.removeAttr('disabled');
					var params = {
						title : app.vtranslate('JS_MESSAGE'),
						text: response.error.message,
						animation: 'show',
						type: 'error'
					};
					Vtiger_Helper_Js.showPnotify(params);
				}
            }
        );  
    },
    
    loadMailBox : function(data) {
        var progressIndicatorElement = jQuery.progressIndicator({
			'position' : 'html',
			'blockInfo' : {
				'enabled' : true
			}
		});
        data.module = app.getModuleName();
        data.parent = app.getParentModuleName();
        data.view = "ListAjax";
        data.mode = 'getMailBoxContentView'
        AppConnector.request(data).then(
            function(html) {
                var scannerContentdId = "SCANNER_"+data.record;
                if(jQuery('#'+scannerContentdId).length > 0) {
                    jQuery('#'+scannerContentdId).html(html)
                }else{
                    jQuery('#listViewContents').append('<br>'+html);
                }
                progressIndicatorElement.progressIndicator({
                    'mode' : 'hide'
                });
				var params = {
					title : app.vtranslate('JS_MESSAGE'),
					text: app.vtranslate('JS_MAILBOX_LOADED_SUCCESSFULLY'),
					animation: 'show',
					type: 'success'
				};
				Vtiger_Helper_Js.showPnotify(params);
            }
        );
    }
},{
	registerEvents : function(){
		
	}
})
