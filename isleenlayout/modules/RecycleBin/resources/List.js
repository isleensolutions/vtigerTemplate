/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

Vtiger_List_Js("RecycleBin_List_Js",{
	
	emptyRecycleBin : function(url) {
		var message = app.vtranslate('JS_MSG_EMPTY_RB_CONFIRMATION');
		Vtiger_Helper_Js.showConfirmationBox({'message' : message}).then(
		function(e) {
			var deleteURL = url+'&mode=emptyRecycleBin';
			var instance = new RecycleBin_List_Js();
			AppConnector.request(deleteURL).then(
				 function(data) {
					if(data){
						instance.recycleBinActionPostOperations(data);
					}
				}
			);
		},
		function(error, err){
		})
	},
	
	deleteRecords : function(url){
		var listInstance = Vtiger_List_Js.getInstance();
		var validationResult = listInstance.checkListRecordSelected();
		if(validationResult != true){
			var selectedIds = listInstance.readSelectedIds(true);
			var cvId = listInstance.getCurrentCvId();
			var message = app.vtranslate('LBL_MASS_DELETE_CONFIRMATION');
			Vtiger_Helper_Js.showConfirmationBox({'message' : message}).then(
				function(e) {
					var sourceModule = jQuery('#customFilter').val();
					var deleteURL = url+'&viewname='+cvId+'&selected_ids='+selectedIds+'&mode=deleteRecords&sourceModule='+sourceModule;
					AppConnector.request(deleteURL).then(
						function(data) {
							if(data){
								var instance = new RecycleBin_List_Js();
								instance.recycleBinActionPostOperations(data);
							}
						}
					);
				},
				function(error, err){
				})
		} else {
			listInstance.noRecordSelectedAlert();
		}
		
	},
	
	restoreRecords : function(url){
		var listInstance = Vtiger_List_Js.getInstance();
		var validationResult = listInstance.checkListRecordSelected();
		if(validationResult != true){
			var selectedIds = listInstance.readSelectedIds(true);
			var cvId = listInstance.getCurrentCvId();
			var message = app.vtranslate('JS_LBL_RESTORE_RECORDS_CONFIRMATION');
			Vtiger_Helper_Js.showConfirmationBox({'message' : message}).then(
				function(e) {
					var sourceModule = jQuery('#customFilter').val();
					var deleteURL = url+'&viewname='+cvId+'&selected_ids='+selectedIds+'&mode=restoreRecords&sourceModule='+sourceModule;
					AppConnector.request(deleteURL).then(
						function(data) {
							if(data){
								var instance = new RecycleBin_List_Js();
								instance.recycleBinActionPostOperations(data);
							}
						}
					);
				},
				function(error, err){
				})
		} else {
			listInstance.noRecordSelectedAlert();
		}
	}
	
},{
	getDefaultParams : function() {
		var pageNumber = jQuery('#pageNumber').val();
		var module = app.getModuleName();
		var parent = app.getParentModuleName();
		var cvId = this.getCurrentCvId();
		var orderBy = jQuery('#orderBy').val();
		var sortOrder = jQuery("#sortOrder").val();
		var params = {
			'module': module,
			'parent' : parent,
			'page' : pageNumber,
			'view' : "List",
			'orderby' : orderBy,
			'sortorder' : sortOrder,
			'sourceModule' : jQuery('#customFilter').val()
		}
		return params;
	},
	/*
	 * Function to perform the operations after the Empty RecycleBin
	 */
	recycleBinActionPostOperations : function(data){
		var thisInstance = this;
		var cvId = this.getCurrentCvId();
		if(data.success){
			var module = app.getModuleName();
			var params = thisInstance.getDefaultParams();
			AppConnector.request(params).then(
				function(data) {
					app.hideModalWindow();
					var listViewContainer = thisInstance.getListViewContentContainer();
					listViewContainer.html(data);
					jQuery('#deSelectAllMsg').trigger('click');
				});
		} else {
			app.hideModalWindow();
			var params = {
				title : app.vtranslate('JS_LBL_PERMISSION'),
				text : data.error.message
			}
			Vtiger_Helper_Js.showPnotify(params);
		}
	},
	
	/*
	 * Function to register List view Page Navigation
	 */
	registerPageNavigationEvents : function(){
		var aDeferred = jQuery.Deferred();
		var thisInstance = this;
		jQuery('#listViewNextPageButton').on('click',function(){
			var pageLimit = jQuery('#pageLimit').val();
			var noOfEntries = jQuery('#noOfEntries').val();
			if(noOfEntries == pageLimit){
				var orderBy = jQuery('#orderBy').val();
				var sortOrder = jQuery("#sortOrder").val();
				var cvId = thisInstance.getCurrentCvId();
				var urlParams = {
					"orderby": orderBy,
					"sortorder": sortOrder,
					"viewname": cvId
				}
				var pageNumber = jQuery('#pageNumber').val();
				var nextPageNumber = parseInt(parseFloat(pageNumber)) + 1;
				jQuery('#pageNumber').val(nextPageNumber);
				jQuery('#pageToJump').val(nextPageNumber);
				thisInstance.getListViewRecords(urlParams).then(
					function(data){
						thisInstance.updatePagination();
						aDeferred.resolve();
					},

					function(textStatus, errorThrown){
						aDeferred.reject(textStatus, errorThrown);
					}
				);
			}
			return aDeferred.promise();
		});
		jQuery('#listViewPreviousPageButton').on('click',function(){
			var aDeferred = jQuery.Deferred();
			var pageNumber = jQuery('#pageNumber').val();
			if(pageNumber > 1){
				var orderBy = jQuery('#orderBy').val();
				var sortOrder = jQuery("#sortOrder").val();
				var cvId = thisInstance.getCurrentCvId();
				var urlParams = {
					"orderby": orderBy,
					"sortorder": sortOrder,
					"viewname" : cvId
				}
				var previousPageNumber = parseInt(parseFloat(pageNumber)) - 1;
				jQuery('#pageNumber').val(previousPageNumber);
				jQuery('#pageToJump').val(previousPageNumber);
				thisInstance.getListViewRecords(urlParams).then(
					function(data){
						thisInstance.updatePagination();
						aDeferred.resolve();
					},

					function(textStatus, errorThrown){
						aDeferred.reject(textStatus, errorThrown);
					}
				);
			}
		});

		jQuery('#listViewPageJump').on('click',function(e){
			var module = app.getModuleName();
			var cvId = thisInstance.getCurrentCvId();
			var pageCountParams = {
				'module' : module,
				'view' : "ListAjax",
				'mode' : "getPageCount",
				'sourceModule': jQuery('#sourceModule').val()
			}
			var element = jQuery('#totalPageCount');
			var totalPageNumber = element.text();
			if(totalPageNumber == ""){
				var totalRecordCount = jQuery('#totalCount').val();
				if(totalRecordCount != '') {
					var recordPerPage = jQuery('#numberOfEntries').val();
					pageCount = Math.round(totalRecordCount/recordPerPage);
					element.text(pageCount);
					return;
				}
				element.progressIndicator({});
				AppConnector.request(pageCountParams).then(
					function(data) {
						console.log(data);
						var response = JSON.parse(data);
						var pageCount = response['result']['page'];
						element.text(pageCount);
						element.progressIndicator({'mode': 'hide'});
					},
					function(error,err){

					}
				);
			}
		})

		jQuery('#listViewPageJumpDropDown').on('click','li',function(e){
			e.stopImmediatePropagation();
		}).on('keypress','#pageToJump',function(e){
			if(e.which == 13){
				e.stopImmediatePropagation();
				var element = jQuery(e.currentTarget);
				var response = Vtiger_WholeNumberGreaterThanZero_Validator_Js.invokeValidation(element);
				if(typeof response != "undefined"){
					element.validationEngine('showPrompt',response,'',"topLeft",true);
				} else {
					element.validationEngine('hideAll');
					var pageNumber = jQuery(e.currentTarget).val();
					jQuery('#pageNumber').val(pageNumber);
					thisInstance.getListViewRecords().then(
						function(data){
							thisInstance.updatePagination();
							element.closest('.btn-group ').removeClass('open');
						},
						function(textStatus, errorThrown){
						}
					);
				}
				return false;
		}
		});
	},
	
	getRecordsCount : function(){
		var aDeferred = jQuery.Deferred();
		var recordCountVal = jQuery("#recordsCount").val();
		if(recordCountVal != ''){
			aDeferred.resolve(recordCountVal);
		} else {
			var count = '';
			var module = app.getModuleName();
			var sourceModule = jQuery('#customFilter').val();
			var postData = {
				"module": module,
				"sourceModule": sourceModule,
				"view": "ListAjax",
				"mode": "getRecordsCount"
			}

			AppConnector.request(postData).then(
				function(data) {
					var response = JSON.parse(data);
					jQuery("#recordsCount").val(response['result']['count']);
					count =  response['result']['count'];
					aDeferred.resolve(count);
				},
				function(error,err){

				}
			);
		}

		return aDeferred.promise();
	}
});