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
<input type="hidden" name="selectedFieldsData" val=""/>
	<input type="hidden" name="mode" value="{$MODE}"/>
	<input type="hidden" name="targetModule" value="{$SOURCE_MODULE}"/>
	<table class="table" width="100%" name="targetModuleFields">
		<tr class="blockHeader" colspan=8>
			<th class="blockHeader" colspan="4">
				{vtranslate($SOURCE_MODULE, $SOURCE_MODULE)} {vtranslate('LBL_FIELD_INFORMATION', $MODULE)}
			</th>
		</tr>
		<tr>
			<td colspan="4">
				<span class="row-fluid">
					<span class="col-md-1"><span class="pull-right pushDown"><b>{vtranslate('LBL_ADD_FIELDS', $MODULE)}</b></span></span>
					<span class="col-md-11 CustomSelect2">
						<select id="fieldsList" multiple="multiple" data-placeholder="{vtranslate('LBL_SELECT_FIELDS_OF_TARGET_MODULE', $MODULE)}" class="row-fluid select2" style="width:100%">
							{foreach key=BLOCK_LABEL item=BLOCK_FIELDS from=$ALL_FIELD_MODELS_LIST name="EditViewBlockLevelLoop"}
								{foreach key=FIELD_NAME item=FIELD_MODEL from=$BLOCK_FIELDS name=blockfields}
									{assign var="FIELD_INFO" value=Zend_Json::encode($FIELD_MODEL->getFieldInfo())}
										<option value="{$FIELD_MODEL->get('name')}" data-field-info='{$FIELD_INFO}' data-mandatory="{($FIELD_MODEL->isMandatory(true) eq 1) ? "true":"false"}"
										{if (array_key_exists($FIELD_MODEL->get('name'), $SELECTED_FIELD_MODELS_LIST)) or ($FIELD_MODEL->isMandatory(true))}selected{/if}>
											{vtranslate($FIELD_MODEL->get('label'), $SOURCE_MODULE)}
											{if $FIELD_MODEL->isMandatory(true)}
												<span class="redColor">*</span>
											{/if}
										</option>
								{/foreach}
							{/foreach}
						</select>
					</span>
				</span>
			</td>
		</tr>
		<tr name="fieldHeaders">
			<td class="textAlignCenter"><b>{vtranslate('LBL_MANDATORY', $MODULE)}</b></td>
			<td><b>{vtranslate('LBL_FIELD_NAME', $MODULE)}</b></td>
			<td class="textAlignCenter"><b>{vtranslate('LBL_OVERRIDE_VALUE', $MODULE)}</b></td>
			<td><b>{vtranslate('LBL_WEBFORM_REFERENCE_FIELD', $MODULE)}</b></td>
		</tr>
		
		{foreach key=BLOCK_LABEL item=BLOCK_FIELDS from=$ALL_FIELD_MODELS_LIST name="EditViewBlockLevelLoop"}
			{foreach key=FIELD_NAME item=FIELD_MODEL from=$BLOCK_FIELDS name=blockfields}
				{if $FIELD_MODEL->isMandatory(true) || array_key_exists($FIELD_NAME,$SELECTED_FIELD_MODELS_LIST)}
					{if array_key_exists($FIELD_NAME,$SELECTED_FIELD_MODELS_LIST)}
						{assign var=SELECETED_FIELD_MODEL value=$SELECTED_FIELD_MODELS_LIST.$FIELD_NAME}
						{assign var=FIELD_MODEL value=$FIELD_MODEL->set('fieldvalue',$SELECETED_FIELD_MODEL->get('fieldvalue'))}
					{/if}
					<tr data-name="{$FIELD_MODEL->getFieldName()}" data-mandatory-field={($FIELD_MODEL->isMandatory(true) eq 1) ? "true":"false"}>
						<td class="textAlignCenter">
							<input type="hidden" value="0" name='selectedFieldsData[{$FIELD_NAME}][required]'/>
							<input type="checkbox" {if ($FIELD_MODEL->isMandatory(true) eq 1) or ($SELECETED_FIELD_MODEL->get('required') eq 1)}checked="checked"{/if} 
                                   {if $FIELD_MODEL->isMandatory(true) eq 1} readonly="true"{/if} 
                                   name='selectedFieldsData[{$FIELD_NAME}][required]' class="markRequired" value="1" />
						</td>
						<td class="fieldLabel">{vtranslate($FIELD_MODEL->get('label'), $SOURCE_MODULE)}{if $FIELD_MODEL->isMandatory(true)}<span class="redColor">*</span>{/if}</td>
						<td class="fieldValue textAlignCenter">{include file=vtemplate_path($FIELD_MODEL->getUITypeModel()->getTemplateName(), $SOURCE_MODULE) BLOCK_FIELDS=$BLOCK_FIELDS}</td>
						<td>
							{if Settings_Webforms_Record_Model::isCustomField($FIELD_MODEL->get('name'))}
								{vtranslate('LBL_LABEL', $MODULE)} : {vtranslate($FIELD_MODEL->get('label'), $SOURCE_MODULE)}
							{else}
								{vtranslate({$FIELD_MODEL->get('name')}, $SOURCE_MODULE)}
							{/if}
							{if !$FIELD_MODEL->isMandatory(true)}
								<div class="pull-right actions">
									<span class="actionImages cursorPointer"><a class="removeTargetModuleField"><i class="fa fa-times-circle"></i></a></span>
								</div>
							{/if}
						</td>
					</tr>
				{/if}
			{/foreach}
		{/foreach}
		</tbody>
	</table>
{/strip}
