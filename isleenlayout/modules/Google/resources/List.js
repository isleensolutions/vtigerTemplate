/*+***********************************************************************************
 * The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 *************************************************************************************/  
jQuery.Class("Contact",{
    _init:function(){
        if(jQuery('#sync_button')){
            jQuery('#sync_button').on('click',function(){
                jQuery('#sync_button b').text(app.vtranslate('LBL_SYNCRONIZING'));
                jQuery('#sync_button').attr("disabled", "disabled")
                jQuery('#synctime').remove();
                var imagePath = app.vimage_path('Sync.gif')
                jQuery('#sync_details').html('<img src='+imagePath+' style="margin-left:40px"/>');
                var url = jQuery('#sync_button').data('url');
                if(jQuery('#firsttime').val() == 'yes'){
                     var win=window.open(url,'','height=600,width=600,channelmode=1');
                     //http://stackoverflow.com/questions/1777864/how-to-run-function-of-parent-window-when-child-window-closes 
                     window.sync = function() {
                        jQuery('#sync_details').html('<img src='+imagePath+' style="margin-left:40px"/>'); 
                        AppConnector.request(url).then(
                           function(data) {
                               jQuery('#sync_button b').text(app.vtranslate('LBL_SYNC_BUTTON'));
                               jQuery('#sync_button').removeAttr("disabled");
                               jQuery('#sync_details').html(data);
                               if(jQuery('#norefresh').length == 0){
                                listInstance  =  Vtiger_List_Js.getInstance();
                                listInstance.getListViewRecords();
                               }
                               jQuery('#firsttime').val('no');
                           }
                           );
                     }
                     
                     
                     win.onunload = function(){
                         jQuery('#sync_button b').text(app.vtranslate('LBL_SYNC_BUTTON'));
                         jQuery('#sync_button').removeAttr("disabled");
                         jQuery('#sync_details').html(app.vtranslate('LBL_NOT_SYNCRONIZED'));
                     }
                         
                     
                } else {
                    AppConnector.request(url).then(
						function(data) {
                            jQuery('#sync_button b').text(app.vtranslate('LBL_SYNC_BUTTON'));
                            jQuery('#sync_button').removeAttr("disabled");
                            jQuery('#sync_details').html(data);
                            if(jQuery('#norefresh').length == 0){
                                listInstance  =  Vtiger_List_Js.getInstance();
                                listInstance.getListViewRecords()
                            }
                        }
                        );
                }
                
            });
        }
		var data=jQuery('#mappingTable').html();
		jQuery('#popid').popover({
			'html':true,
			'content': data,
			'title':'Field Mapping'
		});
		
    },
    
    _showMessage : function(){
       
    },
    _exit:function(){
        
    }
},{});

jQuery('document').ready(function(){
	jQuery('#mappingTable').hide();
  Contact._init();
})

