/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/
Vtiger_Field_Js("Webforms_Field_Js",{},{})

Vtiger_Field_Js('Webforms_Multipicklist_Field_Js',{},{
	/**
	 * Function to get the pick list values
	 * @return <object> key value pair of options
	 */
	getPickListValues : function() {
		return this.get('picklistvalues');
	},
	
	/**
	 * Function to get the ui
	 * @return - select element and chosen element
	 */
	getUi : function() {
		var html = '<select class="select2" multiple name="'+ this.getName() +'[]" style="width:73%">';
		var pickListValues = this.getPickListValues();
		var selectedOption = this.getValue();
		var selectedOptionsArray = selectedOption.split(' |##| ')
		for(var option in pickListValues) {
			html += '<option value="'+option+'" ';
			if(jQuery.inArray(option,selectedOptionsArray) != -1){
				html += ' selected ';
			}
			html += '>'+pickListValues[option]+'</option>';
		}
		html +='</select>';
		var selectContainer = jQuery(html);
		return selectContainer;
	}
});

Vtiger_Field_Js('Webforms_Picklist_Field_Js',{},{

	/**
	 * Function to get the pick list values
	 * @return <object> key value pair of options
	 */
	getPickListValues : function() {
		return this.get('picklistvalues');
	},

	/**
	 * Function to get the ui
	 * @return - select element and chosen element
	 */
	getUi : function() {
		var html = '<select class="row-fluid chzn-select" name="'+ this.getName() +'" style="width:220px">';
		var pickListValues = this.getPickListValues();
		var selectedOption = this.getValue();
		for(var option in pickListValues) {
			html += '<option value="'+option+'" ';
			if(option == selectedOption) {
				html += ' selected ';
			}
			html += '>'+pickListValues[option]+'</option>';
		}
		html +='</select>';
		var selectContainer = jQuery(html);
		this.addValidationToElement(selectContainer);
		return selectContainer;
	}
});

Vtiger_Field_Js('Webforms_Date_Field_Js',{},{

	/**
	 * Function to get the user date format
	 */
	getDateFormat : function(){
		return this.get('date-format');
	},

	/**
	 * Function to get the ui
	 * @return - input text field
	 */
	getUi : function() {
		var html = '<div class="input-append" style="margin-left:3em">'+
						'<div class="date">'+
							'<input class="dateField" type="text" name="'+ this.getName() +'"  data-date-format="'+ this.getDateFormat() +'"  value="'+  this.getValue() + '" />'+
							'<span class="add-on"><i class="icon-calendar"></i></span>'+
						'</div>'+
					'</div>';
		var element = jQuery(html);
		return this.addValidationToElement(element);
	}
});

Vtiger_Field_Js('Webforms_Time_Field_Js',{},{

	/**
	 * Function to get the ui
	 * @return - input text field
	 */
	getUi : function() {
		var html = '<div class="input-append time" style="margin-left:3em">'+
							'<input class="timepicker-default" type="text" name="'+ this.getName() +'"  value="'+  this.getValue() + '" />'+
							'<span class="add-on"><i class="icon-time"></i></span>'+
					'</div>';
		var element = jQuery(html);
		return this.addValidationToElement(element);
	}
});
