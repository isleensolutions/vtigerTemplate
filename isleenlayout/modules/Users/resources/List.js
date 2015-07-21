/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

Settings_Vtiger_List_Js("Settings_Users_List_Js",{

	/*
	 * function to trigger delete record action
	 * @params: delete record url.
	 */
    deleteRecord : function(deleteRecordActionUrl) {
		var message = app.vtranslate('LBL_DELETE_USER_CONFIRMATION');
		Vtiger_Helper_Js.showConfirmationBox({'message' : message}).then(function(data) {
				AppConnector.request(deleteRecordActionUrl).then(
				function(data){
					if(data){
						var callback = function(data) {
						var params = app.validationEngineOptions;
						params.onValidationComplete = function(form, valid){
							if(valid){
								Settings_Users_List_Js.deleteUser(form)
							}
							return false;
						}
						jQuery('#deleteUser').validationEngine(app.validationEngineOptions);
					}
					app.showModalWindow(data, function(data){
						if(typeof callback == 'function'){
							callback(data);
						}
					});
					}
				});
			},
			function(error, err){
			}
		);
	},
	
	deleteUser: function (form){
		var userid = form.find('[name="userid"]').val();
		var transferUserId = form.find('[name="tranfer_owner_id"]').val();
		var params = {
			'module': app.getModuleName(),
			'action' : "DeleteAjax",
			'transfer_user_id' : transferUserId,
			'userid' : userid
		}		
		AppConnector.request(params).then(
			function(data) {
				if(data.success){
					app.hideModalWindow();
					Vtiger_Helper_Js.showPnotify(data.result.message);
					var url = data.result.listViewUrl;
					window.location.href=url;
				}
			}
		);
	}
	
},{

	
	/*
	 * Function to get Page Jump Params
	 */
	getPageJumpParams : function(){
		var module = app.getModuleName();
		var cvId = this.getCurrentCvId();
		var pageCountParams = {
			'module' : module,
			'view' : "ListAjax",
			'mode' : "getPageCount",
			"viewname": cvId
		}
		return pageCountParams;
	},
	/*
	 * Function to register the list view delete record click event
	 */
	registerDeleteRecordClickEvent: function(){
		var listViewContentDiv = this.getListViewContentContainer();
		listViewContentDiv.on('click','.deleteRecordButton',function(e){
			var elem = jQuery(e.currentTarget);
			var rowElement = elem.closest('tr');
			var deleteActionUrl = jQuery('[name="deleteActionUrl"]',rowElement).val();
			Settings_Users_List_Js.deleteRecord(deleteActionUrl);
			e.stopPropagation();
		});
	},
	
	registerEvents : function() {
		this._super();
		this.registerEventForAlphabetSearch();
        this.registerEmailFieldClickEvent();
		this.registerUrlFieldClickEvent();
		this.registerDeleteRecordClickEvent();
	}
});
