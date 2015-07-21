/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

Settings_Vtiger_Detail_Js('Settings_Webforms_Detail_Js', {
	
	/*
	 * function to trigger delete record action
	 * @params: delete record url.
	 */
    deleteRecord : function(deleteRecordActionUrl) {
		var message = app.vtranslate('LBL_DELETE_CONFIRMATION');
		Vtiger_Helper_Js.showConfirmationBox({'message' : message}).then(function(data) {
				AppConnector.request(deleteRecordActionUrl).then(
				function(data){
					if(data.success == true){
						window.location.href = data.result;
					}else{
						Vtiger_Helper_Js.showPnotify(data.error.message);
					}
				});
			},
			function(error, err){
			}
		);
	},
	
	/** 
	 * Function to trigger show webform record action
	 * @params: show webform record url
	 */
	showForm : function(showFormRecordActionUrl){
		AppConnector.request(showFormRecordActionUrl).then(
			function(data){
				var callback = function(container){
					//Form should be aas html without rendering
					var showFormContents = container.find('pre').html();
					//Html contents should be placed inside textarea element
					container.find('#showFormContent').text(showFormContents);
					//Rendering content has been removed from container
					container.find('pre').remove();
					app.showScrollBar(container.find('#showFormContent'), {'height':'400px'});
				}
				app.showModalWindow(data,callback);
			},
			function(error){
			}
		)
	}
}, {})
