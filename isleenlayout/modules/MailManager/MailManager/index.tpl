{*+**********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.1
* ('License'); You may not use this file except in compliance with the License
* The Original Code is:  vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
************************************************************************************}
<div class="span2 row-fluid">
	<div id="_quicklinks_mainuidiv_" class="quickWidgetContainer accordion">
		{include file="modules/MailManager/MainuiQuickLinks.tpl"}
	
		<div id='_folderprogress_' style='float: right; display: none; position: absolute;left: 30px; font-weight: bold;'>
			<span>{vtranslate('JSLBL_LOADING_FOLDERS', $MODULE)}</span><img src="{'vtbusy.gif'|@vimage_path}" border='0' align='absmiddle'>
		</div>
		<div id="_mainfolderdiv_" class="quickWidgetContainer accordion"></div>
	</div>
</div>

<div class="contentsDiv span10 marginLeftZero">
	<div id='_progress_' style='float: right; display: none; position: absolute; right: 35px; font-weight: bold;'>
		<span id='_progressmsg_'>...</span><img src="{'vtbusy.gif'|@vimage_path}" border='0' align='absmiddle'></div>

	<span id="_messagediv_">{if $ERROR}<p>{$ERROR}</p>{/if}</span><br>
	<div id="_contentdiv_"></div>
	<div id="_contentdiv2_"></div>
	<div id="_settingsdiv_"></div>
	<div id="_relationpopupdiv_" style="display:none;position:absolute;width:800px;z-index:80000;"></div>
	<div id="_replydiv_" style="display:none;"></div>
	<div id="replycontentdiv" style="display:none;"></div>

</div>
<div id = '__vtiger__'></div>

<script type='text/javascript'>
	{literal}
	jQuery(function(){MailManager.mainui()});
	{/literal}
</script>
<input type="hidden" name="module" value="MailManager">