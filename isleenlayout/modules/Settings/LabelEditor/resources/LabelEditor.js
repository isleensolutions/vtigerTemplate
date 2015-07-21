/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/
jQuery.Class('Settings_LabelEditor_Js', {}, {

	/**
	 * Function to register the events for on change step1 select element
	 */
	registerStep1OnChange : function() {		
		var thisInstance = this;
		var container = jQuery('#labeleditorContents');
		var select = container.find('#step1');
		
		select.on('change', function() {
			var step1 = select.val();
			container.find('#div2').show();
			
			var params = {};
			params['module'] = app.getModuleName();
			params['parent'] = app.getParentModuleName();
			params['view'] = 'ListAjax';
			params['mode'] = 'step2';
			params['step1'] = step1;
			
			var aDeferred = jQuery.Deferred();
			var progressIndicatorElement = jQuery.progressIndicator({
				'position' : 'html',
				'blockInfo' : {
					'enabled' : true
				}
			});
		
			AppConnector.request(params).then(
				function(data) {
					progressIndicatorElement.progressIndicator({'mode' : 'hide'});
					var output = JSON.parse(data);
					
					jQuery.each( output.result, function( key, value ) {						
						jQuery("select.step2").append("<option value="+value+">"+value+"</option>");
					});
					
					aDeferred.resolve(data);
				},
				function(error) {
					progressIndicatorElement.progressIndicator({'mode' : 'hide'});
					aDeferred.reject(error);
				}
			);
			return aDeferred.promise();
		});
	},
	
		/**
	 * Function to register the events for on change step1 select element
	 */
	registerStep2OnChange : function() {
		
		var thisInstance = this;
		var container = jQuery('#labeleditorContents');
		var select2 = container.find('#step2');
		
		select2.on('change', function() {
			var lang_module = container.find('#step2').val();
			var language = container.find('#step1').val();
			container.find('#step3').show();
			
			var params = {};
			params['module'] = app.getModuleName();
			params['parent'] = app.getParentModuleName();
			params['view'] = 'ListAjax';
			params['mode'] = 'step3';
			params['language'] = language;
			params['lang_module'] = lang_module;
			
			var aDeferred = jQuery.Deferred();
			var progressIndicatorElement = jQuery.progressIndicator({
				'position' : 'html',
				'blockInfo' : {
					'enabled' : true
				}
			});
		
			AppConnector.request(params).then(
				function(data) {
					progressIndicatorElement.progressIndicator({'mode' : 'hide'});
					var output = JSON.parse(data);
					
					jQuery.each( output.result, function( key, value ) {
						jQuery.each( value, function( k, v ) {
							jQuery(".listViewEntriesTable tbody").append("<tr><td>"+k+"</td><td><input class='form-control' type='text' name='"+k+"_"+key+"' value='"+v+"'/></td></tr>");
						});
					});
					
					aDeferred.resolve(data);
				},
				function(error) {
					progressIndicatorElement.progressIndicator({'mode' : 'hide'});
					aDeferred.reject(error);
				}
			);
			return aDeferred.promise();
		});
	},
	
	/**
	 * register events for layout editor
	 */
	registerEvents : function() {
		var thisInstance = this;
		thisInstance.registerStep1OnChange();
		thisInstance.registerStep2OnChange();
	}

});

jQuery(document).ready(function() {
	var instance = new Settings_LabelEditor_Js();
	instance.registerEvents();
})
