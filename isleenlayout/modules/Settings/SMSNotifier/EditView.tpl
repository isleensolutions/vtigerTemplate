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
<div class="modal SMSNotify">
	<div class="modal-header">
		<button data-dismiss="modal" class="close" title="{vtranslate('LBL_CLOSE')}">x</button>
		{if $RECORD_ID}
			<h3>{vtranslate('LBL_EDIT_CONFIGURATION', $QUALIFIED_MODULE_NAME)} </h3>
		{else}
			<h3>{vtranslate('LBL_ADD_CONFIGURATION', $QUALIFIED_MODULE_NAME)} </h3>
		{/if}
	</div>
	<form class="form-horizontal contentsBackground" id="smsConfig">
		<div class="modal-body configContent marginLeftRight20px">
			{if $RECORD_ID}
				<input type="hidden" value="{$RECORD_ID}" name="record" id="recordId"/>
			{/if}
			{foreach item=FIELD_MODEL from=$EDITABLE_FIELDS}
			<div class="control-group form-group">
				{assign var=FIELD_NAME value=$FIELD_MODEL->get('name')}
				<span class="control-label col-md-3">
					<strong>
						{vtranslate($FIELD_NAME, $QUALIFIED_MODULE_NAME)}
					</strong>
				</span>
				<div class="controls col-md-9">
					{assign var=FIELD_TYPE value=$FIELD_MODEL->getFieldDataType()}
					{assign var=FIELD_VALUE value=$RECORD_MODEL->get($FIELD_NAME)}
					{if $FIELD_TYPE == 'picklist'}
						<select class="select2 FloatWidth marginLeftZero providerType" name="{$FIELD_NAME}" placeholder="{vtranslate('LBL_SELECT_ONE', $QUALIFIED_MODULE_NAME)}">
							<option></option>
							{foreach item=PROVIDER_MODEL from=$PROVIDERS}
								{assign var=PROVIDER_NAME value=$PROVIDER_MODEL->getName()}
								<option value="{$PROVIDER_NAME}" {if $FIELD_VALUE eq $PROVIDER_NAME} selected {/if} data-provider-fields='{ZEND_JSON::encode($PROVIDER_MODEL->getRequiredParams())}'>{vtranslate($PROVIDER_NAME, $QUALIFIED_MODULE_NAME)}</option>
							{/foreach}
						</select>
					{else if $FIELD_TYPE == 'radio'}
						<input type="radio" name="{$FIELD_NAME}" value='1' {if $FIELD_VALUE} checked="checked" {/if} />&nbsp;{vtranslate('LBL_YES', $QUALIFIED_MODULE_NAME)}&nbsp;&nbsp;&nbsp;
						<input type="radio" name="{$FIELD_NAME}" value='0' {if !$FIELD_VALUE} checked="checked" {/if}/>&nbsp;{vtranslate('LBL_NO', $QUALIFIED_MODULE_NAME)}
					{else if $FIELD_TYPE == 'password'}
						<input type="password" name="{$FIELD_NAME}" class="col-md-3" data-validation-engine="validate[required]" value="{$FIELD_VALUE}" />
					{else}
						<input type="text" name="{$FIELD_NAME}" class="col-md-3" {if $FIELD_NAME == 'username'} data-validation-engine="validate[required]" {/if} value="{$FIELD_VALUE}" />
					{/if}
				</div>
			</div>
			{/foreach}
		</div>
		{include file='ModalFooter.tpl'|@vtemplate_path:$MODULE}
	</form>
</div>
{/strip}
