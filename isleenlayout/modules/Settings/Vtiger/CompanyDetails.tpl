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
	<input type="hidden" id="supportedImageFormats" value='{ZEND_JSON::encode(Settings_Vtiger_CompanyDetails_Model::$logoSupportedFormats)}' />
	<div class="padding-left1per">
		<div class="row-fluid settingsHeader">
			{vtranslate('LBL_COMPANY_DETAILS', $QUALIFIED_MODULE)}{if $DESCRIPTION}<span style="font-size:12px;color: black;"> - &nbsp;{vtranslate({$DESCRIPTION}, $QUALIFIED_MODULE)}</span>{/if}
			<button id="updateCompanyDetails" class="btn pull-right">{vtranslate('LBL_EDIT',$QUALIFIED_MODULE)}</button>
			<hr>
		</div>
		<div  id="CompanyDetailsContainer" class="{if !empty($ERROR_MESSAGE)}hide{/if}">
			<div class="row-fluid">
				<table class="table table-bordered">
					<thead>
						<tr class="blockHeader">
							<th colspan="2"><strong>{vtranslate('LBL_COMPANY_LOGO',$QUALIFIED_MODULE)}</strong></th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>
								<div class="companyLogo">
									<img src="{$MODULE_MODEL->getLogoPath()}" class="padding10 alignMiddle" />
								</div>
							</td>
						</tr>
					</tbody>
				</table>
				<table class="table table-bordered">
					<thead>
						<tr class="blockHeader">
							<th colspan="2"><strong>{vtranslate('LBL_COMPANY_INFORMATION',$QUALIFIED_MODULE)}</strong></th>
						</tr>
					</thead>
					<tbody>
						{foreach from=$MODULE_MODEL->getFields() item=FIELD_TYPE key=FIELD}
							{if $FIELD neq 'logoname' && $FIELD neq 'logo' }
								<tr>
									<td>{vtranslate($FIELD,$QUALIFIED_MODULE)}</td>
									<td>{$MODULE_MODEL->get($FIELD)}</td>
								</tr>
							{/if}
						{/foreach}
					</tbody>
				</table>
			</div>
		</div>

	<form class="form-horizontal {if empty($ERROR_MESSAGE)}hide{/if}"  id="updateCompanyDetailsForm" method="post" action="index.php" enctype="multipart/form-data">
		<input type="hidden" name="module" value="Vtiger" />
		<input type="hidden" name="parent" value="Settings" />
		<input type="hidden" name="action" value="CompanyDetailsSave" />
		<div class="control-group FloatWidth">
			<div class="control-label col-md-2 paddingRight">{vtranslate('LBL_COMPANY_LOGO',$QUALIFIED_MODULE)}</div>
			<div class="controls col-md-10">
				<div class="companyLogo col-md-12">
					<img src="{$MODULE_MODEL->getLogoPath()}" class="alignMiddle size" />
				</div>
				<input class="col-md-4" type="file" name="logo" id="logoFile" />&nbsp;&nbsp;
				<span class="alert alert-info col-md-8" style="bottom: 25px;padding: 5px 10px;position: relative;margin-bottom: 0;">
					{vtranslate('LBL_LOGO_RECOMMENDED_MESSAGE',$QUALIFIED_MODULE)}
				</span>
				{if !empty($ERROR_MESSAGE)}
					<br><br><div class="marginLeftZero col-md-8 alert alert-error" style="bottom: 25px;padding: 5px 10px;position: relative;margin-bottom: 0;">
						{vtranslate($ERROR_MESSAGE,$QUALIFIED_MODULE)}
					</div>
				{/if}
			</div>
		</div>
		{foreach from=$MODULE_MODEL->getFields() item=FIELD_TYPE key=FIELD}
			{if $FIELD neq 'logoname' && $FIELD neq 'logo' }
				<div class="control-group FloatWidth m-bot15">
					<div class="control-label col-md-2 paddingRight">
						{vtranslate($FIELD,$QUALIFIED_MODULE)}{if $FIELD eq 'organizationname'}<span class="redColor">*</span>{/if}
					</div>
					<div class="controls col-md-5">
						{if $FIELD eq 'address'}
							<textarea class="form-control" name="{$FIELD}">{$MODULE_MODEL->get($FIELD)}</textarea>
						{else}
							<input type="text" {if $FIELD eq 'organizationname'} data-validation-engine="validate[required]" {/if} class="input-xlarge form-control col-md-5" name="{$FIELD}" value="{$MODULE_MODEL->get($FIELD)}"/>
						{/if}
					</div>
				</div>
			{/if}
		{/foreach}
		{include file="ModalFooter.tpl"|@vtemplate_path:$QUALIFIED_MODULE}
	</form>
{/strip}
