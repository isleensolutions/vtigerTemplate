{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
* ("License"); You may not use this file except in compliance with the License
* The Original Code is:  vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
*
********************************************************************************/
-->*}
{strip}
	<input type="hidden" id="scannerId" value="{$SCANNER_ID}"/>
	<div class="listViewPageDiv">
		<h3>{vtranslate($MODULE,$QUALIFIED_MODULE)} - {vtranslate('LBL_CONVERT_EMAILS_TO_RESPECTIVE_RECORDS',$QUALIFIED_MODULE)}</h3>
        <hr>
		<div class="row-fluid padding-bottom1per">
			<div class="col-md-2">&nbsp;</div>
			<div class="col-md-9"><i class="fa fa-info-circle"></i>&nbsp;&nbsp;{vtranslate('LBL_DRAG_AND_DROP_BLOCK_TO_PRIORITISE_THE_RULE',$QUALIFIED_MODULE)}</div>
		</div>
		<div class="row-fluid">
			<div class="col-md-2">&nbsp;</div>
			<div class="col-md-2">
				<button class="btn addButton" {if stripos($SCANNER_MODEL->getCreateRuleRecordUrl(), 'javascript:')===0} onclick='{$SCANNER_MODEL->getCreateRuleRecordUrl()|substr:strlen("javascript:")}' 
						{else} onclick='window.location.href="{$SCANNER_MODEL->getCreateRuleRecordUrl()}"' {/if}><i class="fa fa-plus icon-white"></i>&nbsp;&nbsp;<strong>{vtranslate('LBL_ADD_RULE',$QUALIFIED_MODULE)}</strong></button>	
			</div>
			<div class="col-md-8">
				<button class="btn pull-right" onclick="window.history.back()"><strong>{vtranslate('LBL_BACK_TO_MAILBOXES',$QUALIFIED_MODULE)}</strong></button>
			</div> 
			<div class="clearfix"></div>
		</div><br>
		<div id="rulesList">
			{assign var=RULE_COUNT value=1}
			{foreach from=$RULE_MODELS_LIST item=RULE_MODEL}
				<div class="row-fluid padding-bottom1per rule" data-id="{$RULE_MODEL->get('ruleid')}" data-blockid="block_{$RULE_MODEL->get('ruleid')}">
					{include file="Rule.tpl"|@vtemplate_path:$QUALIFIED_MODULE RULE_COUNT=$RULE_COUNT}
				</div>
				{assign var=RULE_COUNT value=$RULE_COUNT+1}
			{/foreach}
		</div>
	</div>
{/strip}
