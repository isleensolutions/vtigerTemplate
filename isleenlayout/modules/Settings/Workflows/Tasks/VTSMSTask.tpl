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
	<div class="row-fluid">
		<div class="col-md-2">{vtranslate('LBL_RECEPIENTS',$QUALIFIED_MODULE)}<span class="redColor">*</span></div>
		<div class="col-md-10 row-fluid m-bot15">
			<span class="col-md-5">
				<input type="text" class="fields form-control" data-validation-engine='validate[required]' name="sms_recepient" value="{$TASK_OBJECT->sms_recepient}" />
			</span>
			<span class="col-md-5">
				<select class="chzn-select task-fields">
					{foreach from=$RECORD_STRUCTURE_MODEL->getFieldsByType('phone') item=FIELD}
						<option value=",${$FIELD->get('name')}">({vtranslate($FIELD->getModule()->get('name'),$FIELD->getModule()->get('name'))})  {vtranslate($FIELD->get('label'),$FIELD->getModule()->get('name'))}</option>
					{/foreach}
				</select>	
			</span>
		</div>
	</div>
	<div class="row-fluid">
		<div class="col-md-2">{vtranslate('LBL_ADD_FIELDS',$QUALIFIED_MODULE)}</div>
		<div class="col-md-10  m-bot15">
				<span class="col-md-5">
					<select class="chzn-select task-fields">
						{$ALL_FIELD_OPTIONS}
					</select>	
				</span>
		</div>

		<div class="row-fluid">
			<div class="col-md-2">{vtranslate('LBL_SMS_TEXT',$QUALIFIED_MODULE)}</div>
			<span class="col-md-10">
				<span class="col-md-12">
					<textarea name="content" class="fields form-control">{$TASK_OBJECT->content}</textarea>
				</span>
			</span>
		</div>
	</div>
{/strip}	