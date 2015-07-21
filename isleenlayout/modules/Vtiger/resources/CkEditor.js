/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/
jQuery.Class("Vtiger_CkEditor_Js",{},{
	
	/*
	 *Function to set the textArea element 
	 */
	setElement : function(element){
		this.element = element;
		return this;
	},
	
	/*
	 *Function to get the textArea element
	 */
	getElement : function(){
		return this.element;
	},
	
	/*
	 * Function to return Element's id atrribute value
	 */
	getElementId :function(){
		var element = this.getElement();
		return element.attr('id');
	},
	/*
	 * Function to get the instance of ckeditor
	 */
	
	getCkEditorInstanceFromName :function(){
		var elementName = this.getElementId();
		return CKEDITOR.instances[elementName];
	},
    
    /***
     * Function to get the plain text
     */
    getPlainText : function() {
        var ckEditorInstnace = this.getCkEditorInstanceFromName();
        return ckEditorInstnace.document.getBody().getText();
    },
	/*
	 * Function to load CkEditor
	 * @params : element: element on which CkEditor has to be loaded, config: custom configurations for ckeditor
	 */
	loadCkEditor : function(element,customConfig){
		
		this.setElement(element);
		var instance = this.getCkEditorInstanceFromName();
		var elementName = this.getElementId();
		var vtiger_ckeditor_toolbar = this.defaultVtigerCkEditorToolBar();
		var config = {
			fullPage : true,
			extraPlugins : 'docprops',
			toolbar : vtiger_ckeditor_toolbar
		}
		
		if(typeof customConfig != 'undefined'){
			var config = jQuery.extend(config,customConfig);
		}
		if(instance)
		{
			CKEDITOR.remove(instance);
		}
		
		config.filebrowserBrowseUrl = 'kcfinder/browse.php?type=images';
		config.filebrowserUploadUrl = 'kcfinder/upload.php?type=images';
		
		CKEDITOR.replace( elementName,config);
	},
	
	/*
	 * Function to retunr default ckeditor toolbar
	 */
	defaultVtigerCkEditorToolBar : function(){
		
		//configured ckeditor toolbar for vtiger
		var Vtiger_ckeditor_toolbar = 
		[
			['Bold','Italic','Underline','Strike','-','Subscript','Superscript'],
			['NumberedList','BulletedList','-','Outdent','Indent'],
			['JustifyLeft','JustifyCenter','JustifyRight','JustifyBlock'],
			['Link','Unlink','Anchor'],
			['Source','-','NewPage','Preview','Templates'],
			'/',
			['Cut','Copy','Paste','PasteText','PasteFromWord','-','Print', 'SpellChecker'],
			['Undo','Redo','-','Find','Replace','-','SelectAll','RemoveFormat'],
			['Image','Table','HorizontalRule','SpecialChar','PageBreak','TextColor','BGColor'], //,'Smiley','UniversalKey'],
			'/',
			['Styles','Format','Font','FontSize']
		];
		return Vtiger_ckeditor_toolbar;	
	},
	
	/*
	 * Function to load contents in ckeditor textarea
	 * @params : textArea Element,contents ;
	 */
	loadContentsInCkeditor : function(contents){
		var editor = this.getCkEditorInstanceFromName();
		var editorData = editor.getData();
		var replaced_text = editorData.replace(editorData, contents); 
		editor.setData(replaced_text);	
	}
});
    
