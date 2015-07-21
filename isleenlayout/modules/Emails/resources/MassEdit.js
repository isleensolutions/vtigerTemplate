/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/
jQuery.Class("Emails_MassEdit_Js",{},{

	ckEditorInstance : false,
	massEmailForm : false,
	saved : "SAVED",
	sent : "SENT",
	attachmentsFileSize : 0,
	documentsFileSize : 0,
	
	/**
	 * Function to get ckEditorInstance
	 */
	getckEditorInstance : function(){
		if(this.ckEditorInstance == false){
			this.ckEditorInstance = new Vtiger_CkEditor_Js();
		}
		return this.ckEditorInstance;
	},

	/**
	 * function to display the email form
	 * return UI
	 */
	showComposeEmailForm : function(params,cb,windowName){
	    app.hideModalWindow();
		var popupInstance = Vtiger_Popup_Js.getInstance();
		return popupInstance.show(params,cb,windowName);
		
	},

	/*
	 * Function to get the Mass Email Form
	 */
	getMassEmailForm : function(){
		if(this.massEmailForm == false){
			this.massEmailForm = jQuery("#massEmailForm");
		}
		return this.massEmailForm;
	},

	/**
	 * function to call the registerevents of send Email step1
	 */
	registerEmailFieldSelectionEvent : function(){
		var thisInstance = this;
		var selectEmailForm = jQuery("#SendEmailFormStep1");
		selectEmailForm.on('submit',function(e){
			var form = jQuery(e.currentTarget);
			var params = form.serializeFormData();
			thisInstance.showComposeEmailForm(params,"","composeEmail");
			e.preventDefault();
		});
	},

	/*
		* Function to register the event of send email
		*/
	registerSendEmailEvent : function(){
		this.getMassEmailForm().on('submit',function(e){
			//TODO close the window once the mail has sent
			var formElement = jQuery(e.currentTarget);
			var invalidFields = formElement.data('jqv').InvalidFields;
			var progressElement = formElement.find('[name="progressIndicator"]');
			if(invalidFields.length == 0){
				jQuery('#sendEmail').attr('disabled',"disabled");
				jQuery('#saveDraft').attr('disabled',"disabled");
				progressElement.progressIndicator();
				return true;
			}
			return false;
		}).on('keypress',function(e){
			if(e.which == 13){
				e.preventDefault();
			}
		});
	},
	setAttachmentsFileSizeByElement : function(element){
		 if(jQuery.browser.msie)
		{
			var	filesize = element.fileSize;
			if(typeof fileSize != 'undefined'){
				this.attachmentsFileSize += filesize;
			}
		} else {
			this.attachmentsFileSize += element.get(0).files[0].size;
		}
	},
	
	setAttachmentsFileSizeBySize : function(fileSize){
		this.attachmentsFileSize += parseFloat(fileSize);
	},

	removeAttachmentFileSizeByElement : function(element) {
		 if(jQuery.browser.msie)
		{
			var	filesize = element.fileSize;
			if(typeof fileSize != 'undefined'){
				this.attachmentsFileSize -= filesize;
			}
		} else {
			this.attachmentsFileSize -= element.get(0).files[0].size;
		}
	},
	
	removeAttachmentFileSizeBySize : function(fileSize){
		this.attachmentsFileSize -= parseFloat(fileSize);
	},

	getAttachmentsFileSize : function(){
		return this.attachmentsFileSize;
	},
	setDocumentsFileSize : function(documentSize){
		this.documentsFileSize += parseFloat(documentSize);
	},
	getDocumentsFileSize : function(){
		return this.documentsFileSize;
	},

	getTotalAttachmentsSize : function(){
		return parseFloat(this.getAttachmentsFileSize())+parseFloat(this.getDocumentsFileSize());
	},

	getMaxUploadSize : function(){
		return jQuery('#maxUploadSize').val();
	},

	removeDocumentsFileSize : function(documentSize){
		this.documentsFileSize -= parseFloat(documentSize);
	},

	removeAttachmentsFileSize : function(){
		//TODO  update the attachment file size when you delete any attachment from the list
	},

	fileAfterSelectHandler : function(element, value, master_element){
		var thisInstance = this;
		var mode = jQuery('[name="emailMode"]').val();
		var existingAttachment = JSON.parse(jQuery('[name="attachments"]').val());
		element = jQuery(element);
		thisInstance.setAttachmentsFileSizeByElement(element);
		var totalAttachmentsSize = thisInstance.getTotalAttachmentsSize();
		var maxUploadSize = thisInstance.getMaxUploadSize();
		if(totalAttachmentsSize > maxUploadSize){
			Vtiger_Helper_Js.showPnotify(app.vtranslate('JS_MAX_FILE_UPLOAD_EXCEEDS'));
			this.removeAttachmentFileSizeByElement(jQuery(element));
			master_element.list.find('.MultiFile-label:last').find('.MultiFile-remove').trigger('click');
		}else if((mode != "") && (existingAttachment != "")){
			var pattern = /\\/;
			var val = value.split(pattern);
			if(jQuery.browser.mozilla){
				fileuploaded = value;
			} else if(jQuery.browser.webkit || jQuery.browser.msie) {
				var fileuploaded = val[2];
				fileuploaded=fileuploaded.replace(" ","_");
			}
			jQuery.each(existingAttachment,function(key,value){
				if((value['attachment'] == fileuploaded) && !(value.hasOwnProperty( "docid"))){
					var errorMsg = app.vtranslate("JS_THIS_FILE_HAS_ALREADY_BEEN_SELECTED")+fileuploaded;
					Vtiger_Helper_Js.showPnotify(app.vtranslate(errorMsg));
					thisInstance.removeAttachmentFileSizeByElement(jQuery(element),value);
					master_element.list.find('.MultiFile-label:last').find('.MultiFile-remove').trigger('click');
					return false;
				}
			})
		}
		return true;
	},
	/*
	 * Function to register the events for getting the values
	 */
	registerEventsToGetFlagValue : function(){
		var thisInstance = this;
		jQuery('#saveDraft').on('click',function(e){
			jQuery('#flag').val(thisInstance.saved);
		});
		jQuery('#sendEmail').on('click',function(e){
			jQuery('#flag').val(thisInstance.sent);
		});
	},
	
	checkHiddenStatusofCcandBcc : function(){
		var ccLink = jQuery('#ccLink');
		var bccLink = jQuery('#bccLink');
		if(ccLink.is(':hidden') && bccLink.is(':hidden')){
			ccLink.closest('div.row-fluid').addClass('hide');
		}
	},

	/*
	 * Function to register the events for bcc and cc links
	 */
	registerCcAndBccEvents : function(){
		var thisInstance = this;
		jQuery('#ccLink').on('click',function(e){
			jQuery('#ccContainer').show();
			jQuery(e.currentTarget).hide();
			thisInstance.checkHiddenStatusofCcandBcc();
		});
		jQuery('#bccLink').on('click',function(e){
			jQuery('#bccContainer').show();
			jQuery(e.currentTarget).hide();
			thisInstance.checkHiddenStatusofCcandBcc();
		});
	},

	/*
	 * Function to register the send email template event
	 */
	registerSendEmailTemplateEvent : function(){

		var thisInstance = this;
		jQuery('#selectEmailTemplate').on('click',function(e){
			var url = jQuery(e.currentTarget).data('url');
			var popupInstance = Vtiger_Popup_Js.getInstance();
			popupInstance.show(url,function(data){
				var responseData = JSON.parse(data);
				for(var id in responseData){
					var selectedName = responseData[id].name;
					var selectedTemplateBody = responseData[id].info;
				}
				var ckEditorInstance = thisInstance.getckEditorInstance();
				ckEditorInstance.loadContentsInCkeditor(selectedTemplateBody);
				jQuery('#subject').val(selectedName);
			},'tempalteWindow');
		});
	},
	getDocumentAttachmentElement : function(selectedFileName,id,selectedFileSize){
		return '<div class="MultiFile-label"><a class="removeAttachment cursorPointer" data-id='+id+' data-file-size='+selectedFileSize+'>x </a><span>'+selectedFileName+'</span></div>';
	},
	registerBrowseCrmEvent : function(){
		var thisInstance = this;
		jQuery('#browseCrm').on('click',function(e){
			var selectedDocumentId;
			var url = jQuery(e.currentTarget).data('url');
			var popupInstance = Vtiger_Popup_Js.getInstance();
			popupInstance.show(url,function(data){
				var responseData = JSON.parse(data);
				for(var id in responseData){
					selectedDocumentId = id;
					var selectedFileName = responseData[id].info['filename'];
					var selectedFileSize =  responseData[id].info['filesize'];
					var response = thisInstance.writeDocumentIds(selectedDocumentId)
					if(response){
						var attachmentElement = thisInstance.getDocumentAttachmentElement(selectedFileName,id,selectedFileSize);
						//TODO handle the validation if the size exceeds 5mb before appending.
						jQuery(attachmentElement).appendTo(jQuery('#attachments'));
						jQuery('.MultiFile-applied,.MultiFile').addClass('removeNoFileChosen');
						thisInstance.setDocumentsFileSize(selectedFileSize);
					}
				}
				
			},'browseCrmWindow');
		});
	},
	/**
	 * Function to check whether selected document 
	 * is already an existing attachment
	 * @param expects document id to check
	 * @return true if present false if not present
	 */
	checkIfExisitingAttachment : function(selectedDocumentId){
		var documentExist;
		var documentPresent;
		var mode = jQuery('[name="emailMode"]').val();
		var selectedDocumentIds = jQuery('#documentIds').val();
		var existingAttachment = JSON.parse(jQuery('[name="attachments"]').val());
		if((mode != "") && (existingAttachment != "")){
			jQuery.each(existingAttachment,function(key,value){
				if(value.hasOwnProperty( "docid")){
					if(value['docid'] == selectedDocumentId){
						documentExist = 1;
						return false;
					} 
				}
			})
			if(selectedDocumentIds != ""){
				selectedDocumentIds = JSON.parse(selectedDocumentIds);
			}
			if((documentExist == 1) || (jQuery.inArray(selectedDocumentId,selectedDocumentIds) != '-1')){
				documentPresent = 1;
			} else {
				documentPresent = 0;
			}
		} else if(selectedDocumentIds != ""){
			selectedDocumentIds = JSON.parse(selectedDocumentIds);
			if((jQuery.inArray(selectedDocumentId,selectedDocumentIds) != '-1')){
				documentPresent = 1;
			} else {
				documentPresent = 0;
			}
		}
		if(documentPresent == 1){
			var errorMsg = app.vtranslate("JS_THIS_DOCUMENT_HAS_ALREADY_BEEN_SELECTED");
			Vtiger_Helper_Js.showPnotify(app.vtranslate(errorMsg));
			return true;
		} else {
			return false;
		}
	},

	writeDocumentIds :function(selectedDocumentId){
		var thisInstance = this;
		var newAttachment;
		var selectedDocumentIds = jQuery('#documentIds').val();
		if(selectedDocumentIds != ""){
			selectedDocumentIds = JSON.parse(selectedDocumentIds);
			var existingAttachment = thisInstance.checkIfExisitingAttachment(selectedDocumentId);
			if(!existingAttachment){
				newAttachment = 1;
			} else {
				newAttachment = 0;
			}
		} else {
			var existingAttachment = thisInstance.checkIfExisitingAttachment(selectedDocumentId);
			if(!existingAttachment){
				newAttachment = 1;
				var selectedDocumentIds = new Array();
			}
		}
		if(newAttachment == 1){
			selectedDocumentIds.push(selectedDocumentId);
			jQuery('#documentIds').val(JSON.stringify(selectedDocumentIds));
			return true;
		} else {
			return false;
		}
	},
	
	removeDocumentIds : function(removedDocumentId){
		var documentIdsContainer = jQuery('#documentIds');
		var documentIdsArray = JSON.parse(documentIdsContainer.val());
		documentIdsArray.splice( jQuery.inArray('"'+removedDocumentId+'"', documentIdsArray), 1 );
		documentIdsContainer.val(JSON.stringify(documentIdsArray));
	},
	
	registerRemoveAttachmentEvent : function(){
		var thisInstance = this;
		this.getMassEmailForm().on('click','.removeAttachment',function(e){
			var currentTarget = jQuery(e.currentTarget);
			var id = currentTarget.data('id');
			var fileSize = currentTarget.data('fileSize');
			currentTarget.closest('.MultiFile-label').remove();
			thisInstance.removeDocumentsFileSize(fileSize);
			thisInstance.removeDocumentIds(id);
			if (jQuery('#attachments').is(':empty')){
				jQuery('.MultiFile,.MultiFile-applied').removeClass('removeNoFileChosen');
			}
		});
	},
	
	/**
	 * Function to register event for to field in compose email popup
	 */
	registerEventsForToField : function(){
		var thisInstance = this;
		this.getMassEmailForm().on('click','.selectEmail',function(e){
			var moduleSelected = jQuery('.emailModulesList').val();
			var parentElem = jQuery(e.target).closest('.toEmailField');
			var sourceModule = jQuery('[name=module]').val();
			var params = {
				'module' : moduleSelected,
				'src_module' : sourceModule,
				'view': 'EmailsRelatedModulePopup'
			}
			var popupInstance =Vtiger_Popup_Js.getInstance();
			popupInstance.show(params, function(data){
					var responseData = JSON.parse(data);
					for(var id in responseData){
						var data = {
							'name' : responseData[id].name,
							'id' : id,
							'emailid' : responseData[id].email
						}
						thisInstance.setReferenceFieldValue(parentElem, data);
                        thisInstance.addToEmailAddressData(data);
                        thisInstance.appendToSelectedIds(id);
                        thisInstance.addToEmails(data);
					}
				},'relatedEmailModules');
		});
		
		this.getMassEmailForm().on('click','[name="clearToEmailField"]',function(e){
			var element = jQuery(e.currentTarget);
			element.closest('div.toEmailField').find('.sourceField').val('');
			thisInstance.getMassEmailForm().find('[name="toemailinfo"]').val(JSON.stringify(new Array()));
			thisInstance.getMassEmailForm().find('[name="selected_ids"]').val(JSON.stringify(new Array()));
			thisInstance.getMassEmailForm().find('[name="to"]').val(JSON.stringify(new Array()));
		});
		
		
	},
	
	setReferenceFieldValue : function(container,object){
		var toEmailField = container.find('.sourceField');
		var toEmailFieldExistingValue = toEmailField.val();
		var toEmailFieldNewValue;
		if(toEmailFieldExistingValue != ""){
			toEmailFieldNewValue = toEmailFieldExistingValue+","+object.emailid;
		} else {
			toEmailFieldNewValue = object.emailid;
		}
		toEmailField.val(toEmailFieldNewValue);
	},

    addToEmailAddressData : function(mailInfo) {
        var mailInfoElement = this.getMassEmailForm().find('[name="toemailinfo"]');
        var existingToMailInfo = JSON.parse(mailInfoElement.val());
        //If it is an array then there are no previous records so make as map
        if(typeof existingToMailInfo.length != 'undefined') {
          existingToMailInfo = {};
        }
        existingToMailInfo[mailInfo.id] = new Array(mailInfo.emailid);
        mailInfoElement.val(JSON.stringify(existingToMailInfo));
    },

    appendToSelectedIds : function(selectedId) {
        var selectedIdElement = this.getMassEmailForm().find('[name="selected_ids"]');
        var previousValue = JSON.parse(selectedIdElement.val());
        previousValue.push(selectedId);
        selectedIdElement.val(JSON.stringify(previousValue));
    },

    addToEmails : function(mailInfo){
        var toEmails = this.getMassEmailForm().find('[name="to"]');
        var value = JSON.parse(toEmails.val());
		if(value == ""){
			value = new Array();
		}
        value.push(mailInfo.emailid);
        toEmails.val(JSON.stringify(value));
    },
	
	/**
	 * Function to remove attachments that are added in 
	 * edit view of email in compose email form
	 */
	registerEventForRemoveCustomAttachments : function(){
		var thisInstance = this;
		var composeEmailForm = this.getMassEmailForm();
		jQuery('[name="removeAttachment"]').on('click',function(e){
			var attachmentsContainer = composeEmailForm.find('[ name="attachments"]');
			var attachmentsInfo = JSON.parse(attachmentsContainer.val());
			var element = jQuery(e.currentTarget);
			var imageContainer = element.closest('div.MultiFile-label');
			var imageContainerData = imageContainer.data();
			var fileType = imageContainerData['fileType'];
			var fileSize = imageContainerData['fileSize'];
			var fileId = imageContainerData['fileId'];
			if(fileType == "document"){
				thisInstance.removeDocumentsFileSize(fileSize);
			} else if(fileType == "file"){
				thisInstance.removeAttachmentFileSizeBySize(fileSize);
			}
			jQuery.each(attachmentsInfo,function(index,attachmentObject){
				if((typeof attachmentObject != "undefined") && (attachmentObject.fileid == fileId)){
					attachmentsInfo.splice(index,1);
				}
			})
			attachmentsContainer.val(JSON.stringify(attachmentsInfo));
			imageContainer.remove();
		})
	},
	
	/**
	 * Function to calculate upload file size
	 */
	calculateUploadFileSize : function(){
		var thisInstance = this;
		var composeEmailForm = this.getMassEmailForm();
		var attachmentsList = composeEmailForm.find('#attachments');
		var attachments = attachmentsList.find('.customAttachment');
		jQuery.each(attachments,function(){
			var element = jQuery(this);
			var fileSize = element.data('fileSize');
			var fileType = element.data('fileType');
			if(fileType == "file"){
				thisInstance.setAttachmentsFileSizeBySize(fileSize);
			} else if(fileType == "document"){
				fileSize = fileSize.replace('KB','');
				thisInstance.setDocumentsFileSize(fileSize);
			}
		})
	},
	
	/**
	 * Function to register event for saved or sent mail
	 * getting back to preview
	 */
	registerEventForGoToPreview : function(){
		jQuery('#gotoPreview').on('click',function(e){
			var recordId = jQuery('[name="parent_id"]').val();
			var parentRecordId = jQuery('[name="parent_record_id"]').val();
			var params = {};
			params['module'] = "Emails";
			params['view'] = "ComposeEmail";
			params['mode'] = "emailPreview";
			params['record'] = recordId;
			params['parentId'] = parentRecordId;
			var urlString = (typeof params == 'string')? params : jQuery.param(params);
			var url = 'index.php?'+urlString;
			self.location.href = url;
		})
	},
	
	registerEvents : function(){
		var thisInstance = this;
		var composeEmailForm = this.getMassEmailForm();
		if(composeEmailForm.length > 0){
			jQuery("#multiFile").MultiFile({
				list: '#attachments',
				'afterFileSelect' : function(element, value, master_element){
					var masterElement = master_element;
					var newElement = jQuery(masterElement.current);
					newElement.addClass('removeNoFileChosen');
					thisInstance.fileAfterSelectHandler(element, value, master_element);
				},
				'afterFileRemove' : function(element, value, master_element){
					if (jQuery('#attachments').is(':empty')){
						jQuery('.MultiFile,.MultiFile-applied').removeClass('removeNoFileChosen');
					}
					thisInstance.removeAttachmentFileSizeByElement(jQuery(element));
				}
			});
			this.getMassEmailForm().validationEngine(app.validationEngineOptions);
			this.registerSendEmailEvent();
			var textAreaElement = jQuery('#description');
			var ckEditorInstance = this.getckEditorInstance(textAreaElement);
			ckEditorInstance.loadCkEditor(textAreaElement);
			this.registerRemoveAttachmentEvent();
			this.registerEventsToGetFlagValue();
			this.registerCcAndBccEvents();
			this.registerSendEmailTemplateEvent();
			this.registerBrowseCrmEvent();
			this.registerEventsForToField();
			this.registerEventForRemoveCustomAttachments();
			this.calculateUploadFileSize();
			this.registerEventForGoToPreview();
		}
	}
});
//On Page Load
jQuery(document).ready(function() {
	var emailMassEditInstance = new Emails_MassEdit_Js();
	emailMassEditInstance.registerEvents();
});

