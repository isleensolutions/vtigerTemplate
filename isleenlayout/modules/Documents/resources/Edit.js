/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

Vtiger_Edit_Js("Documents_Edit_Js", {} ,{

	INTERNAL_FILE_LOCATION_TYPE : 'I',
	EXTERNAL_FILE_LOCATION_TYPE : 'E',

	getMaxiumFileUploadingSize : function() {
		//TODO : get it from the server
		return this.getForm().find('.maxUploadSize').data('value');
	},

	isFileLocationInternalType : function(fileLocationElement) {
		if(fileLocationElement.val() == this.INTERNAL_FILE_LOCATION_TYPE) {
			return true;
		}
		return false;
	},

	isFileLocationExternalType : function(fileLocationElement) {
		if(fileLocationElement.val() == this.EXTERNAL_FILE_LOCATION_TYPE) {
			return true;
		}
		return false;
	},

	convertFileSizeInToDisplayFormat : function(fileSizeInBytes) {
		 var i = -1;
		var byteUnits = [' kB', ' MB', ' GB', ' TB', 'PB', 'EB', 'ZB', 'YB'];
		do {
			fileSizeInBytes = fileSizeInBytes / 1024;
			i++;
		} while (fileSizeInBytes > 1024);

		return Math.max(fileSizeInBytes, 0.1).toFixed(1) + byteUnits[i];

	},

	registerFileLocationTypeChangeEvent : function() {
		var thisInstance = this;
		jQuery('select[name="filelocationtype"]', this.getForm()).on('change', function(e){
			var fileLocationTypeElement = jQuery(e.currentTarget);
			var fileNameElement = jQuery('[name="filename"]',thisInstance.getForm());
			if(thisInstance.isFileLocationInternalType(fileLocationTypeElement)) {
				var newFileNameElement = jQuery('<input type="file"/>');
			}else{
				var newFileNameElement = jQuery('<input type="text" />');
			}
			var oldElementAttributeList = fileNameElement.get(0).attributes;
			
			for(var index=0; index<oldElementAttributeList.length; index++) {
				var attributeObject = oldElementAttributeList[index];
				//Dont update the type attribute
				if(attributeObject.name=='type' || attributeObject.name == 'value'){
					continue;
				}
				var value = attributeObject.value
				if(attributeObject.name=='data-fieldinfo') {
					value = JSON.parse(value);
					if(thisInstance.isFileLocationExternalType(fileLocationTypeElement)) {
						value['type'] = 'url';
					}else{
						value['type'] = 'file';
					}
					value = JSON.stringify(value);
				}
				newFileNameElement.attr(attributeObject.name, value);
			}
			fileNameElement.replaceWith(newFileNameElement);
			var fileNameElementTd = newFileNameElement.closest('td');
			var uploadFileDetails = fileNameElementTd.find('.uploadedFileDetails');
			if(thisInstance.isFileLocationExternalType(fileLocationTypeElement)) {
				uploadFileDetails.addClass('hide').removeClass('show');
			}else{
				uploadFileDetails.addClass('show').removeClass('hide');
			}
		});
	},

	registerFileChangeEvent : function() {
		var thisInstance = this;
		this.getForm().on('change', 'input[name="filename"]', function(e){
			var element = jQuery(e.currentTarget);
			//ignore all other types than file 
			if(element.attr('type') != 'file'){
				return ;
			}
			var uploadFileSizeHolder = element.closest('.fileUploadContainer').find('.uploadedFileSize');
			var fileSize = element.get(0).files[0].size;
			var maxFileSize = thisInstance.getMaxiumFileUploadingSize();
			if(fileSize > maxFileSize) {
				alert(app.vtranslate('JS_EXCEEDS_MAX_UPLOAD_SIZE'));
				element.val('');
				uploadFileSizeHolder.text('');
			}else{
				uploadFileSizeHolder.text(thisInstance.convertFileSizeInToDisplayFormat(fileSize));
			}

		});
	},
	/**
	 * Function to register event for ckeditor for description field
	 */
	registerEventForCkEditor : function(){
		var form = this.getForm();
		var noteContentElement = form.find('[name="notecontent"]');
		if(noteContentElement.length > 0){
			var ckEditorInstance = new Vtiger_CkEditor_Js();
			ckEditorInstance.loadCkEditor(noteContentElement);
		}
	},

	registerEvents : function() {
		this._super();
		this.registerFileLocationTypeChangeEvent();
		this.registerFileChangeEvent();
		this.registerEventForCkEditor();
	}
});


