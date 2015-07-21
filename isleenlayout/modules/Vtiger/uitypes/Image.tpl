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
{assign var="FIELD_INFO" value=Vtiger_Util_Helper::toSafeHTML(Zend_Json::encode($FIELD_MODEL->getFieldInfo()))}
{assign var="SPECIAL_VALIDATOR" value=$FIELD_MODEL->getValidator()}
	<div class="fileupload fileupload-new" data-provides="fileupload">
		<span class="btn btn-white btn-file" style="float: left;">
			<span class="fileupload-new">
				<i class="fa fa-paper-clip"></i>
				Select Image
			</span>
			<span class="fileupload-exists">
				<i class="fa fa-undo"></i>
				Change
			</span>
			
			<input type="file" class="input-large default {if $MODULE eq 'Products'} " maxlength="6"{else}"{/if} name="{$FIELD_MODEL->getFieldName()}[]" value="{$FIELD_MODEL->get('fieldvalue')}"
					   data-validation-engine="validate[{if ($FIELD_MODEL->isMandatory() eq true) and (empty($IMAGE_DETAILS))} required,{/if}funcCall[Vtiger_Base_Validator_Js.invokeValidation]]"
				data-fieldinfo='{$FIELD_INFO}' {if !empty($SPECIAL_VALIDATOR)}data-validator={Zend_Json::encode($SPECIAL_VALIDATOR)}{/if} />
				
		</span>
		<span class="fileupload-preview FloatWidth"></span>
		<a class="close fileupload-exists"  data-dismiss="fileupload" href="#"></a>
	</div>
	{if $MODULE eq 'Products'}
		<div id="MultiFile1_wrap_list" class="MultiFile-list"></div>
	{/if}
	{foreach key=ITER item=IMAGE_INFO from=$IMAGE_DETAILS}
		<div class="row-fluid">
			{if !empty($IMAGE_INFO.path) && !empty({$IMAGE_INFO.orgname})}
				<span class="col-md-12 paddingLeft" name="existingImages">
					<img src="{$IMAGE_INFO.path}_{$IMAGE_INFO.orgname}" data-image-id="{$IMAGE_INFO.id}" style="height: 200px;width: 100%;"></span>
				<span class="col-md-12 row-fluid paddingLeft paddingTop20px">					
					<span class="row-fluid">
						<input type="button" id="file_{$ITER}" value="Delete" class="imageDelete btn btn-danger">
					</span>&nbsp;&nbsp;
					<span class="row-fluid">[{$IMAGE_INFO.name}]</span>
				</span>
			{/if}
		</div>
	{/foreach}
{/strip}

