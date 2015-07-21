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
	<div class="col-md-2 textAlignCenter">
		<strong>{vtranslate('LBL_PRIORITY',$QUALIFIED_MODULE)}&nbsp;<span class="sequenceNumber">{$RULE_COUNT}</span> :</strong>
	</div>
	<div class="col-md-10">
		<table class="table table-bordered listViewEntriesTable"> 
			<thead>
				<tr class="blockHeader">
					<th colspan="4">
						<img class="alignMiddle" src="{vimage_path('drag.png')}" />&nbsp;&nbsp;{vtranslate($RULE_MODEL->get('action'),$QUALIFIED_MODULE)}
						<div class="pull-right">
							{foreach from=$RULE_MODEL->getRecordLinks() item=ACTION_LINK}
								<a {if stripos($ACTION_LINK->getUrl(), 'javascript:')===0} onclick='{$ACTION_LINK->getUrl()|substr:strlen("javascript:")}' 
								{else} onclick='window.location.href="{$ACTION_LINK->getUrl()}"' {/if}><i title="{vtranslate($ACTION_LINK->get('linklabel'), $MODULE)}" class="{$ACTION_LINK->get('linkicon')} alignMiddle cursorPointer"></i></a>&nbsp;&nbsp;
							{/foreach}
						</div>	
					</th>
				</tr>
			</thead>
			<tbody>
				<tr class="cursorPointer">
					<td width="16%"><strong>{vtranslate('LBL_FROM',$QUALIFIED_MODULE)}</strong></td>
					<td colspan="3">{$RULE_MODEL->get('fromaddress')}</td>
				</tr>
				<tr class="cursorPointer">
					<td width="16%"><strong>{vtranslate('LBL_TO',$QUALIFIED_MODULE)}</strong></td>
					<td colspan="3">{$RULE_MODEL->get('toaddress')}</td>
				</tr>
				<tr class="cursorPointer">
					<td width="16%"><strong>{vtranslate('LBL_SUBJECT',$QUALIFIED_MODULE)}</strong></td>
					<td colspan="3"><p class="pull-left"><small><strong>{vtranslate($RULE_MODEL->get('subjectop'))}</strong></small></p>&nbsp;&nbsp;&nbsp;{$RULE_MODEL->get('subject')}</td>
				</tr>
				<tr class="cursorPointer">
					<td width="16%"><strong>{vtranslate('LBL_BODY',$QUALIFIED_MODULE)}</strong></td>
					<td colspan="3"><p class="pull-left"><small><strong>{vtranslate($RULE_MODEL->get('bodyop'))}</strong></small></p>&nbsp;&nbsp;&nbsp;{$RULE_MODEL->get('body')}</td>
				</tr>
				<tr class="cursorPointer">
					<td width="16%"><strong>{vtranslate('LBL_MATCH',$QUALIFIED_MODULE)}</strong></td>
					<td colspan="3"><small>{if $RULE_MODEL->get('matchusing') eq 'AND'}{vtranslate('LBL_ALL_CONDITIONS',$QUALIFIED_MODULE)}{else}{vtranslate('LBL_ANY_CONDITIONS',$QUALIFIED_MODULE)}{/if}</small></td>
				</tr>
				<tr class="cursorPointer">
					<td width="16%"><strong>{vtranslate('LBL_ACTION',$QUALIFIED_MODULE)}</strong></td>
					<td colspan="3"><small>{vtranslate($RULE_MODEL->get('action'),$QUALIFIED_MODULE)}</small></td>
				</tr>
			</tbody>
		</table>	
	</div>
	<div class="clearfix"></div>				
{/strip}							
