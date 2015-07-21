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
<table class="summary-table form-horizontal">
	<tbody>
	{foreach item=FIELD_MODEL key=FIELD_NAME from=$SUMMARY_RECORD_STRUCTURE['SUMMARY_FIELDS']}
		{if $FIELD_MODEL->get('name') neq 'modifiedtime' && $FIELD_MODEL->get('name') neq 'createdtime'}
			<tr class="summaryViewEntries">
				<td class="fieldLabel" style="width:30%"><label class="muted control-label" style="font-weight:400">{vtranslate($FIELD_MODEL->get('label'),$MODULE_NAME)}</label></td>
				<td class="fieldValue" style="width:70%">
					<div class="row-fluid">
						<span class="value {if $FIELD_MODEL->get('uitype') eq 19}col-md-11 paddingLeft{/if}" style=" {if $FIELD_MODEL->get('uitype') neq 19}float:left;{/if}">
							{include file=$FIELD_MODEL->getUITypeModel()->getDetailViewTemplateName()|@vtemplate_path FIELD_MODEL=$FIELD_MODEL USER_MODEL=$USER_MODEL MODULE=$MODULE_NAME RECORD=$RECORD}
						</span>
						{if $FIELD_MODEL->isEditable() eq 'true' && ($FIELD_MODEL->getFieldDataType()!=Vtiger_Field_Model::REFERENCE_TYPE) && $IS_AJAX_ENABLED && $FIELD_MODEL->isAjaxEditable() eq 'true' && $FIELD_MODEL->get('uitype') neq 69}
							<span class="summaryViewEdit cursorPointer CustomIconhover {if $FIELD_MODEL->get('uitype') neq 19}col-md-1{/if} {if $FIELD_MODEL->get('uitype') eq 19}col-md-1 paddingLeft{/if}">
								<i class="fa fa-pencil" title="{vtranslate('LBL_EDIT',$MODULE_NAME)}"></i>
							</span>
							<span class="hide edit col-md-10">
								{include file=vtemplate_path($FIELD_MODEL->getUITypeModel()->getTemplateName(),$MODULE_NAME) FIELD_MODEL=$FIELD_MODEL USER_MODEL=$USER_MODEL MODULE=$MODULE_NAME}
								{if $FIELD_MODEL->getFieldDataType() eq 'multipicklist'}
									<input type="hidden" class="fieldname" value='{$FIELD_MODEL->get('name')}[]' data-prev-value='{$FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue'))}' />
								 {else}
									 <input type="hidden" class="fieldname" value='{$FIELD_MODEL->get('name')}' data-prev-value='{$FIELD_MODEL->get('fieldvalue')}' />
								 {/if}
							</span>
					{/if}
					</div>
				</td>
			</tr>
		{/if}
	{/foreach}
	</tbody>
</table>
<hr>
<div class="row-fluid col-md-12 paddingLeftRight">
	<div class="col-md-4 toggleViewByMode paddingLeftRight">
		{assign var="CURRENT_VIEW" value="full"}
		{assign var="CURRENT_MODE_LABEL" value="{vtranslate('LBL_COMPLETE_DETAILS',{$MODULE_NAME})}"}
		<button type="button" class="btn changeDetailViewMode cursorPointer">{vtranslate('LBL_SHOW_FULL_DETAILS',$MODULE_NAME)}</button>
		{assign var="FULL_MODE_URL" value={$RECORD->getDetailViewUrl()|cat:'&mode=showDetailViewByMode&requestMode=full'} }
		<input type="hidden" name="viewMode" value="{$CURRENT_VIEW}" data-nextviewname="full" data-currentviewlabel="{$CURRENT_MODE_LABEL}"
			data-full-url="{$FULL_MODE_URL}"  />
	</div>
	<div class="col-md-8">
		<div class="pull-right">
			<div>
				<p class="Pmargin0px">
					<small>
						<em>{vtranslate('LBL_CREATED_ON',$MODULE_NAME)} <b>{Vtiger_Util_Helper::formatDateTimeIntoDayString($RECORD->get('createdtime'))}</b></em>
					</small>
				</p>
			</div>
			<div>
				<p class="Pmargin0px">
					<small>
						<em>{vtranslate('LBL_MODIFIED_ON',$MODULE_NAME)} <b>{Vtiger_Util_Helper::formatDateTimeIntoDayString($RECORD->get('modifiedtime'))}</b></em>
					</small>
				</p>
			</div>
		</div>
	</div>
</div>
{/strip}