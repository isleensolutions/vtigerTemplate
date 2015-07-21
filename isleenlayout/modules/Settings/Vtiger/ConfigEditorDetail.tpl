{*<!--
/*********************************************************************************
** The contents of this file are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
 ********************************************************************************/
-->*}
{strip}
<div class="container-fluid" id="ConfigEditorDetails">
	<div class="widget_header row-fluid">
		<div class="col-md-8"><h3>{vtranslate('LBL_CONFIG_EDITOR', $QUALIFIED_MODULE)}</h3></div>
		<div class="col-md-4">
			<div class="pull-right">
				<button class="btn editButton" data-url='{$MODEL->getEditViewUrl()}' type="button" title="{vtranslate('LBL_EDIT', $QUALIFIED_MODULE)}"><strong>{vtranslate('LBL_EDIT', $QUALIFIED_MODULE)}</strong></button>
			</div>
		</div>
	</div>
	<hr>
	<div class="contents">
		<table class="table table-condensed themeTableColor">
			<thead>
				<tr class="blockHeader">
					<th colspan="2">
						<span class="alignMiddle">{vtranslate('LBL_CONFIG_FILE', $QUALIFIED_MODULE)}</span>
					</th>
				</tr>
			</thead>
			<tbody>
				{assign var=FIELD_DATA value=$MODEL->getViewableData()}
				{foreach key=FIELD_NAME item=FIELD_DETAILS from=$MODEL->getEditableFields()}
					<tr><td width="30%"><label class="muted marginRight10px">{vtranslate($FIELD_DETAILS['label'], $QUALIFIED_MODULE)}</label></td>
						<td style="border-left: none;">
							<span>{if $FIELD_NAME == 'default_module'}{vtranslate($FIELD_DATA[$FIELD_NAME], $FIELD_DATA[$FIELD_NAME])}
								{else if $FIELD_DETAILS['fieldType'] == 'checkbox'}{vtranslate($FIELD_DATA[$FIELD_NAME], $QUALIFIED_MODULE)}
								{else}{$FIELD_DATA[$FIELD_NAME]}{/if}
								{if $FIELD_NAME == 'upload_maxsize'}&nbsp;{vtranslate('LBL_MB', $QUALIFIED_MODULE)}{/if}</span>
						</td></tr>
				{/foreach}
			</tbody>
		</table>
	</div>
</div>
{/strip}
