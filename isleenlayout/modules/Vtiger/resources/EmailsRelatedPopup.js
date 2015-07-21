/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/
Vtiger_Popup_Js("Vtiger_EmailsRelatedModule_Popup_Js",{},{
	
	getListViewEntries: function(e){
		var thisInstance = this;
		var row  = jQuery(e.currentTarget);
		var id = row.data('id');
		var recordName = row.data('name');
		var emailFields = jQuery(row).find('.emailField');
		var emailValue = '';
		jQuery.each(emailFields,function(i,element) {
			emailValue = jQuery(element).text();
			if(emailValue != ''){
				return false;
			}
		});
		if(emailValue == ""){
			var error = recordName+" "+app.vtranslate("JS_DO_NOT_HAVE_AN_EMAIL_ID");
			alert(error);
			e.preventDefault();
			return;
		}
		var response ={};
		response[id] = {'name' : recordName,'email' : emailValue} ;
		thisInstance.done(response, thisInstance.getEventName());
		e.preventDefault();
	},
	
	registerEvents: function(){
		this._super();
	}
})