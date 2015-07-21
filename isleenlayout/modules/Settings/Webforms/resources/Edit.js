/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/

Settings_Vtiger_Edit_Js('Settings_Webforms_Edit_Js', {}, {
	
	targetFieldsTable : false,
	/**
	 * Function to get source module fields table
	 */
	getSourceModuleFieldTable : function() {
		var editViewForm = this.getForm();
		if(this.targetFieldsTable == false){
			this.targetFieldsTable = editViewForm.find('[name="targetModuleFields"]');
		}
		return this.targetFieldsTable;
	},
    
    /**
     * Function which will reintialize 
     */
    reIntializeSourceModuleFieldTable : function() {
        var editViewForm = this.getForm();
        this.targetFieldsTable = editViewForm.find('[name="targetModuleFields"]');
		return this.targetFieldsTable;
    },
	
	targetModule : false,
	
	/**
	 * Function to set target module
	 */
	setTargetModule : function(targetModuleName){
		this.targetModule = targetModuleName;
	},
	
	/**
	 * Function to render selected field UI
	 */
	displaySelectedField : function(selectedField){
		var editViewForm = this.getForm();
		var targetFieldsTable = this.getSourceModuleFieldTable();
		var selectedFieldOption = editViewForm.find('option[value="'+selectedField+'"]');
		var selectedFieldInfo = selectedFieldOption.data('fieldInfo');
		var selectedOptionLabel = selectedFieldInfo.label;
		var selectedOptionName = selectedFieldInfo.name;
		var isCustomField = selectedFieldInfo.customField;
		var moduleName = app.getModuleName();
		var fieldInstance = Vtiger_Field_Js.getInstance(selectedFieldInfo,moduleName);
		var fieldMandatoryStatus = selectedFieldOption.data('mandatory');
		var UI = fieldInstance.getUiTypeSpecificHtml();
		var UI = jQuery(UI);
		var addOnElementExist = UI.find('.add-on');
		var parentInputPrepend = addOnElementExist.closest('.input-prepend');
		
		if(parentInputPrepend.length > 0){
			parentInputPrepend.find('.add-on').addClass('overWriteAddOnStyles');
		}

		var webFormTargetFieldStructure = '<tr data-name="'+selectedOptionName+'" data-mandatory-field="'+fieldMandatoryStatus+'" >'+
											'<td class="textAlignCenter">'+
								'<input type="hidden" value="0" name="selectedFieldsData['+selectedField+'][required]"/>'+
								'<input type="checkbox" class="markRequired" name="selectedFieldsData['+selectedField+'][required]" value="1"/></td>';
		
		webFormTargetFieldStructure+= '<td class="fieldLabel">'+selectedOptionLabel+'</td>'+
										'<td class="textAlignCenter fieldValue CustomclassforInput" name="fieldUI_'+selectedOptionName+'"></td>';
				
		if(isCustomField){
			webFormTargetFieldStructure+=	'<td>'+app.vtranslate('JS_LABEL')+":"+selectedOptionLabel;
		} else {
			webFormTargetFieldStructure+=	'<td>'+selectedField;
		}
		
		webFormTargetFieldStructure+=	'<div class="pull-right actions">'+
										'<span class="actionImages cursorPointer"><a class="removeTargetModuleField"><i class="fa fa-times-circle"></i></a></span></div></td></tr>';
		
		targetFieldsTable.append(webFormTargetFieldStructure);
		targetFieldsTable.find('[name="fieldUI_'+selectedOptionName+'"]').html(UI);
		
		if (UI.has('input.dateField').length > 0){ 
				app.registerEventForDatePickerFields(UI); 
		} else if(UI.has('input.timepicker-default').length > 0){ 
				app.registerEventForTimeFields(UI); 
		}
		if(UI.attr('multiple')){
			app.showSelect2ElementView(UI);
		} else if(UI.hasClass('chzn-select')){
			app.changeSelectElementView(UI);
		}
	},
	
	/**
	 * Function to register event for onchange event for 
	 * select2 element fro adding and removing fields
	 */
	registerOnChangeEventForSelect2 : function(){
		var thisInstance = this;
		var editViewForm = this.getForm();
		var fieldsTable = this.getSourceModuleFieldTable();
		
		jQuery('#fieldsList').on('change',function(e){
			var element = jQuery(e.currentTarget);
			//To handle the options that are removed from select2
			if(typeof e.removed != "undefined"){
				var removedFieldObject = e.removed;
				var removedFieldName = removedFieldObject.id; 
				var removedFieldLabel = removedFieldObject.text; 
				var selectedFieldOption = editViewForm.find('option[value="'+removedFieldName+'"]');
				var fieldMandatoryStatus = selectedFieldOption.data('mandatory');
				//To handle the mandatory option that are removed using backspace from select2
				if(fieldMandatoryStatus){
					var existingOptions = element.select2("data");
					var params = {
						'id' : removedFieldName,
						'text' : removedFieldLabel
					}
					existingOptions.push(params);
					//By setting data attribute select2 mandatory options are added back to select2
					element.select2("data",existingOptions);
					thisInstance.triggerLockMandatoryFieldOptions();
				} else {
					//Remove the row with respect to option that are removed from select2
					var selectedFieldInfo = selectedFieldOption.data('fieldInfo');
					var removeRowName = selectedFieldInfo.name;
					fieldsTable.find('tr[data-name="'+removeRowName+'"]').find('.removeTargetModuleField').trigger('click');
				}
			} else if(typeof e.added != "undefined"){
				//To add the row according to option that is selected from select2
				var addedFieldObject = e.added;
				var addedFieldName = addedFieldObject.id;
				thisInstance.displaySelectedField(addedFieldName);
			}
		})
	},
	
	/**
	 * Function to register event for making field as required
	 */
	registerEventForMarkRequiredField : function(){
		this.getSourceModuleFieldTable().on('change','.markRequired',function(e){
			var element = jQuery(e.currentTarget);
			var isMandatory = element.closest('tr').data('mandatoryField');
			if(isMandatory){
                jQuery(e.currentTarget).attr('checked',true);
				e.preventDefault();
				return;
			}
		})
	},
	
	/**
	 * Function to handle target module remove field action
	 */
	registerEventForRemoveTargetModuleField : function(){
		var thisInstance = this;
		var sourceModuleContainer = this.getSourceModuleFieldTable();
		sourceModuleContainer.on('click','.removeTargetModuleField',function(e){
			var element = jQuery(e.currentTarget);
			var containerRow = element.closest('tr');
			var removedFieldLabel = containerRow.find('td.fieldLabel').text();
			var select2Element = sourceModuleContainer.find('#fieldsList');
			select2Element.find('option:contains('+removedFieldLabel+')').removeAttr('selected');
			jQuery(select2Element).trigger('change');
			thisInstance.triggerLockMandatoryFieldOptions();
			containerRow.remove();
		})
	},
	
	/**
	 * Function to lock mandatory option in select2
	 */
	lockMandatoryOptionInSelect2 : function(mandatoryFieldLabel){
		var sourceModuleContainer = this.getSourceModuleFieldTable();
		var fieldsListSelect2Element = sourceModuleContainer.find('#s2id_fieldsList');
		fieldsListSelect2Element.find('.select2-search-choice div:contains("'+mandatoryFieldLabel+'")').closest('li').find('a').remove();
	},
	
	/**
	 * Function to trigger lock mandatory field options in edit mode
	 */
	triggerLockMandatoryFieldOptions : function(){
		var editViewForm = this.getForm();
		var selectedOptions = editViewForm.find('#fieldsList option:selected');
		for(var i=0;i<selectedOptions.length;i++){
			var selectedOption = jQuery(selectedOptions[i]);
			var selectedFieldInfo = jQuery(selectedOption).data('fieldInfo');
			var mandatoryStatus = selectedOption.data('mandatory');
			if(mandatoryStatus){
				var selectedFieldLabel = selectedFieldInfo.label;
				this.lockMandatoryOptionInSelect2(selectedFieldLabel);
			}
		}
	},
	
	/**
	 * Function to handle on change of target module
	 */
	registerEventToHandleChangeofTargetModule : function(){
		var thisInstance =this;
		var editViewForm = this.getForm();
		editViewForm.find('[name="targetmodule"]').on('change',function(e){
			var element = jQuery(e.currentTarget);
			var targetModule = element.val();
			var existingTargetModule = thisInstance.targetModule;
			
			if(existingTargetModule == targetModule){
				return;
			}
			
			var params = {
			"module" : app.getModuleName(),
			"parent" : app.getParentModuleName(),
			"view" : "GetSourceModuleFields",
			"sourceModule" : targetModule
			}
			var message = app.vtranslate('JS_LOADING_TARGET_MODULE_FIELDS');
			var progressIndicatorElement = jQuery.progressIndicator({
				'message' : message,
				'position' : 'html',
				'blockInfo' : {
					'enabled' : true
				}
			});
			AppConnector.request(params).then(
				function(data){
					if(data){
						progressIndicatorElement.progressIndicator({
							'mode' : 'hide'
						})
                        var contianer = editViewForm.find('.targetFieldsTableContainer');
						contianer.html(data);
                        thisInstance.setTargetModule(targetModule);
                        app.showSelect2ElementView(contianer.find('.select2'));
                        thisInstance.reIntializeSourceModuleFieldTable();
						thisInstance.registerBasicEvents();
					}
				},
				function(error){

				})
		})
	},
	
	/**
	 * Function to add floatNone and displayInlineBlock class for
	 * add-on element in a form
	 */
	addExternalStylesForElement : function(){
		var editViewForm = this.getForm();
		var targetModuleFieldsTable = this.getSourceModuleFieldTable();
		var addOnElementExist = editViewForm.find('.add-on');
		var parentInputPrepend = addOnElementExist.closest('.input-prepend');
		if(parentInputPrepend.length > 0){
			parentInputPrepend.find('.add-on').addClass('overWriteAddOnStyles');
		}
		targetModuleFieldsTable.find('input.dateField,input.timepicker-default').closest('.input-append').css("margin-left","3em");
		targetModuleFieldsTable.find('input.timepicker-default').removeClass('input-small');
		targetModuleFieldsTable.find('textarea').removeClass('input-xxlarge').css('width',"80%")
	},
	
	/**
	 * Function to register Basic Events
	 */
	registerBasicEvents : function(){
		var editViewForm = this.getForm();
		app.changeSelectElementView();
		
		this.registerOnChangeEventForSelect2();
		this.registerEventForRemoveTargetModuleField();
		this.registerEventForMarkRequiredField();
		this.triggerLockMandatoryFieldOptions();
		this.addExternalStylesForElement();
		
		/** Register for fields only if field exist in a form**/
		if (editViewForm.has('input.dateField').length > 0){
			app.registerEventForDatePickerFields(editViewForm);
		}
		if(editViewForm.has('input.timepicker-default').length > 0){
			app.registerEventForTimeFields(editViewForm);
		}
	},
	
	/**
	 * Function which will handle the registrations for the elements 
	 */
	registerEvents : function() {
		var form = this.getForm();
		this._super();
		this.registerEventToHandleChangeofTargetModule();
		this.registerBasicEvents(form);
		var targetModule = form.find('[name="targetModule"]').val();
		this.setTargetModule(targetModule);
	}
})
