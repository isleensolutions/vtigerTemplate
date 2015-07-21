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
<div class="modelContainer">
	<div class="modal-header">
		<button class="close vtButton" data-dismiss="modal">×</button>
		<h3>{vtranslate('SINGLE_'|cat:$MODULE, $QUALIFIED_MODULE)} - {$RECORD_MODEL->getName()}</h3>
	</div>
<div class="modal-body tabbable contentsBackground">
	<div class="marginBottom10px">{vtranslate('LBL_EMBED_THE_FOLLOWING_FORM_IN_YOUR_WEBSITE', $QUALIFIED_MODULE)}</div>
	<textarea id="showFormContent" class="input-xxlarge" style="height:400px;min-width: 600px"></textarea>
<code>
<pre>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
</head>
<form name="{$RECORD_MODEL->getName()}" action="{$ACTION_PATH}"
  method="post" accept-charset="utf-8">
	<input type="hidden" name="publicid" value="{$RECORD_MODEL->get('publicid')}" />
	<input type="hidden" name="name" value="{$RECORD_MODEL->getName()}" />
	<table>
{foreach item=FIELD_MODEL key=FIELD_NAME from=$SELECTED_FIELD_MODELS_LIST}
{assign var=DATA_TYPE value=$FIELD_MODEL->getFieldDataType()}
<tr>
<td><label>{$FIELD_MODEL->get('label')}{if $FIELD_MODEL->get('required') eq 1}*{/if}</label></td>
<td>
{if ($DATA_TYPE eq 'picklist' || $DATA_TYPE eq 'multipicklist')}
{assign var="FIELD_INFO" value=Zend_Json::encode($FIELD_MODEL->getFieldInfo())}
{assign var=PICKLIST_VALUES value=$FIELD_MODEL->getPicklistValues()}
{assign var="SPECIAL_VALIDATOR" value=$FIELD_MODEL->getValidator()}
{if Settings_Webforms_Record_Model::isCustomField($FIELD_NAME)}
	{assign var=FIELD_LABEL value=$FIELD_MODEL->get('label')}
	{assign var=PICKLIST_NAME value="label:{$FIELD_LABEL|replace:' ':'_'}"}
{else}
	{assign var=PICKLIST_NAME value=$FIELD_MODEL->get('name')}
{/if}
{else if ($DATA_TYPE eq "salutation") or ($DATA_TYPE eq "string") or ($DATA_TYPE eq "time") or ($DATA_TYPE eq "currency") or ($DATA_TYPE eq "date")}
	{assign var=TYPE value="text"}
{else if ($DATA_TYPE eq "text")}
	{assign var=TYPE value="text"}
	<textarea name="{utf8_encode($FIELD_MODEL->getFieldName())}" {if $FIELD_MODEL->get('required') eq 1} required="true"{/if}>{$FIELD_MODEL->get('fieldvalue')}</textarea>
{else if ($DATA_TYPE eq "email")}
	{assign var=TYPE value="email"}
{else if ($DATA_TYPE eq "url")}
	{assign var=TYPE value="url"}
{else if ($DATA_TYPE eq "image")}
	{assign var=TYPE value="image"}
{else if ($DATA_TYPE eq "phone")}
	{assign var=TYPE value="tel"}
{else if ($DATA_TYPE eq "integer")}
	{assign var=TYPE value="number"}
{else if ($DATA_TYPE eq "boolean")}
	{assign var=TYPE value="checkbox"}
{/if}
{if $DATA_TYPE eq 'picklist'}
<select name="{$PICKLIST_NAME}" {if $FIELD_MODEL->get('required') eq 1} required="true"{/if}>
	<option value>{vtranslate('LBL_SELECT_VALUE',$QUALIFIED_MODULE)}</option>
	{foreach item=PICKLIST_VALUE key=PICKLIST_NAME from=$PICKLIST_VALUES}
<option value="{$PICKLIST_NAME}" {if $FIELD_MODEL->get('fieldvalue') eq $PICKLIST_NAME} selected {/if}>{$PICKLIST_VALUE}</option>
	{/foreach}
</select>
{else if $DATA_TYPE eq 'multipicklist'}
{assign var="FIELD_VALUE_LIST" value=explode(' |##| ',$FIELD_MODEL->get('fieldvalue'))}
<select name="{$PICKLIST_NAME}[]" {if $FIELD_MODEL->get('required') eq 1} required="true"{/if} multiple style="width: 73%;">
	{foreach item=PICKLIST_VALUE from=$PICKLIST_VALUES}
<option value="{$PICKLIST_VALUE}" {if in_array($PICKLIST_VALUE, $FIELD_VALUE_LIST)} selected {/if}>{vtranslate($PICKLIST_VALUE, $MODULE)}</option>
	{/foreach}
</select>
{else if $TYPE eq "checkbox"}
	<input type="hidden" name="{utf8_encode($FIELD_MODEL->getFieldName())}" value="off" />
	<input type="{$TYPE}" name="{utf8_encode($FIELD_MODEL->getFieldName())}" value="on" {if $FIELD_MODEL->get('fieldvalue') eq "on"} checked {/if} />
{else if ($DATA_TYPE neq "text") and ($TYPE neq "checkbox")}
	<input type="{$TYPE}" name="{utf8_encode($FIELD_MODEL->getFieldName())}" value="{$FIELD_MODEL->get('fieldvalue')}" {if ($FIELD_MODEL->get('required') eq 1) || ($FIELD_MODEL->isMandatory(true))} required="true"{/if} />{if ($DATA_TYPE eq "date")}(yyyy-mm-dd){/if}
{/if}
</td></tr>
{/foreach}
	</table>
<input type="submit" value="Submit" ></input>
</form>
</html>
</pre>
</code>
</div>
	<div class="modal-footer">
		<div class=" pull-right cancelLinkContainer">
			<a class="cancelLink" type="reset" data-dismiss="modal">{vtranslate('LBL_CANCEL', $MODULE)}</a>
		</div>
	</div>
</div>
