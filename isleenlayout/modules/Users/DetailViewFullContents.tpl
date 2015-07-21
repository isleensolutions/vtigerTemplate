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
	{assign var=WIDTHTYPE value=$USER_MODEL->get('rowheight')}
	{include file='DetailViewBlockView.tpl'|@vtemplate_path:$MODULE_NAME RECORD_STRUCTURE=$RECORD_STRUCTURE MODULE_NAME=$MODULE_NAME}
	{* Tag Cloud block starts *}
	<table class="table equalSplit detailview-table ">
		<thead>
			<tr style="border-bottom:1px solid #EFF2F7">
				<th class="blockHeader" colspan="4" style="border:medium none;">
					{vtranslate('LBL_TAG_CLOUD_DISPLAY', $MODULE_NAME)}
				</th>
			</tr>
		</thead>
		<tbody>
			<tr class="FloatWidth">
				<td class="fieldLabel {$WIDTHTYPE} col-md-3" id="{$MODULE}_detailView_fieldLabel_tagCloud" style="border:medium none;">
					<label class="muted pull-right control-label" style="font-weight:400;">
						{vtranslate('LBL_TAG_CLOUD', $MODULE_NAME)}
					</label>
				</td>
				<td class="fieldValue {$WIDTHTYPE} col-md-3" id="{$MODULE}_detailView_fieldValue_tagCloud" style="border:medium none;">
					{assign var=TAG_CLOUD value=$RECORD->getTagCloudStatus()}
					{if $TAG_CLOUD}
						<i class="fa fa-check"></i>&nbsp;&nbsp;{vtranslate('LBL_SHOWN', $MODULE_NAME)}
					{else}
						<i class="fa fa-check"></i>&nbsp;&nbsp;{vtranslate('LBL_HIDDEN', $MODULE_NAME)}
					{/if}
				</td>
				<td class="{$WIDTHTYPE}" style="border:medium none;"></td>
				<td class="{$WIDTHTYPE}" style="border:medium none;"></td>
			</tr>
		</tbody>
	</table>
	{* Tag Clous block ends *}
{/strip}