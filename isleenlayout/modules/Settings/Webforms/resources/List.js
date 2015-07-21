/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

Settings_Vtiger_List_Js("Settings_Webforms_List_Js",{
	
	/**
	 * Function to hadle showform
	 * @params: show form url
	 */
	showForm : function(event,showFormUrl){
		event.stopPropagation();
		AppConnector.request(showFormUrl).then(
			function(data){
				var callback = function(container){
					var showFormContents = container.find('pre').html();
					container.find('#showFormContent').text(showFormContents);
					container.find('pre').remove();
					app.showScrollBar(container.find('#showFormContent'), {'height':'400px'});
				}
				app.showModalWindow(data,callback);
			},
			function(error){
			}
		)
	}
},{
	
	/*
	 * function to trigger delete record action
	 * @params: delete record url.
	 */
    DeleteRecord : function(deleteRecordActionUrl) {
		var thisInstance = this;
		var message = app.vtranslate('LBL_DELETE_CONFIRMATION');
		Vtiger_Helper_Js.showConfirmationBox({'message' : message}).then(function(data) {
				AppConnector.request(deleteRecordActionUrl+'&ajaxDelete=true').then(
				function(data){
					if(data.success == true){
						var params = {
						text: app.vtranslate('JS_WEBFORM_DELETED_SUCCESSFULLY')
					};
					Settings_Vtiger_Index_Js.showMessage(params);
					jQuery('#recordsCount').val('');
					jQuery('#totalPageCount').text('');
					thisInstance.getListViewRecords().then(function(){
						thisInstance.updatePagination();
					});
					}else{
						Vtiger_Helper_Js.showPnotify(data.error.message);
					}
				});
			},
			function(error, err){
			}
		);
	},
	
	/*
	 * function to load the contents from the url through pjax
	 */
	loadContents : function(url) {
		var aDeferred = jQuery.Deferred();
		AppConnector.requestPjax(url).then(
			function(data){
				jQuery('.contentsDiv').html(data);
				aDeferred.resolve(data);
			},
			function(error, err){
				aDeferred.reject();
			}
		);
		return aDeferred.promise();
	},
	
	/**
	 * Function to register events
	 */
	registerEvents : function(){
		this._super();
	}
})
