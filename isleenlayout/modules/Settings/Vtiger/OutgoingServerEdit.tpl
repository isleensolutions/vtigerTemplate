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
<div class="container-fluid">
	<div class="contents row-fluid">
		<form id="OutgoingServerForm" class="form-horizontal" data-detail-url="{$MODEL->getDetailViewUrl()}">
			<div class="widget_header row-fluid">
				<div class="col-md-7"><h3>{vtranslate('LBL_OUTGOING_SERVER', $QUALIFIED_MODULE)}</h3>&nbsp;{vtranslate('LBL_OUTGOING_SERVER_DESC', $QUALIFIED_MODULE)}</div>
				<div class="col-md-5 btn-toolbar"><div class="pull-right">
					<button class="btn btn-success saveButton" type="submit" title="{vtranslate('LBL_SAVE', $QUALIFIED_MODULE)}" style="margin-right:5px;"><strong>{vtranslate('LBL_SAVE', $QUALIFIED_MODULE)}</strong></button>
					<button class="btn resetButton" type="button" title="{vtranslate('LBL_RESET_TO_DEFAULT', $QUALIFIED_MODULE)}" style="margin-right:5px;"><strong>{vtranslate('LBL_RESET_TO_DEFAULT', $QUALIFIED_MODULE)}</strong></button>
					<a type="reset" class="cancelLink" title="{vtranslate('LBL_CANCEL', $QUALIFIED_MODULE)}">{vtranslate('LBL_CANCEL', $QUALIFIED_MODULE)}</a>
				</div></div>
			</div>
			<hr>

			<input type="hidden" name="default" value="false" />
			<input type="hidden" name="server_port" value="0" />
			<input type="hidden" name="server_type" value="email" />
			<input type="hidden" name="id" value="{$MODEL->get('id')}" />

			<div class="row-fluid hide errorMessage">
				<div class="alert alert-error">
				  {vtranslate('LBL_TESTMAILSTATUS', $QUALIFIED_MODULE)}<strong>{vtranslate('LBL_MAILSENDERROR', $QUALIFIED_MODULE)}</strong>  
				</div>
			</div>
			<table class="table table-condensed themeTableColor">
				<thead>
					<tr class="blockHeader"><th colspan="2" class="mediumWidthType">{vtranslate('LBL_MAIL_SERVER_SMTP', $QUALIFIED_MODULE)}</th></tr>
				</thead>
				<tbody>
					<tr>
						<td width="20%"><label class="muted pull-right marginRight10px"><span class="redColor">*</span>{vtranslate('LBL_SERVER_NAME', $QUALIFIED_MODULE)}</label></td>
						<td style="border-left: none;"><input type="text" class="form-control" name="server" data-validation-engine='validate[required]' value="{$MODEL->get('server')}" style="width:50%"/></td>
					</tr>
					<tr>
						<td><label class="muted pull-right marginRight10px"><span class="redColor">*</span>{vtranslate('LBL_USER_NAME', $QUALIFIED_MODULE)}</label></td>
						<td style="border-left: none;"><input type="text" class="form-control" name="server_username" data-validation-engine='validate[required]' value="{$MODEL->get('server_username')}" style="width:50%"/></td>
					</tr>
					<tr>
						<td><label class="muted pull-right marginRight10px"><span class="redColor">*</span>{vtranslate('LBL_PASSWORD', $QUALIFIED_MODULE)}</label></td>
						<td style="border-left: none;"><input type="password" class="form-control" name="server_password" data-validation-engine='validate[required]' value="{$MODEL->get('server_password')}" style="width:50%"/></td>
					</tr>
					<tr>
						<td><label class="muted pull-right marginRight10px">{vtranslate('LBL_FROM_EMAIL', $QUALIFIED_MODULE)}</label></td>
						<td style="border-left: none;"><input type="text" class="form-control" name="from_email_field" data-validation-engine="validate[funcCall[Vtiger_Base_Validator_Js.invokeValidation]]" data-validator='{Zend_Json::encode([['name' => 'Email']])}' value="{$MODEL->get('from_email_field')}" style="width:50%"/></td>
					</tr>
					<tr>
						<td><label class="muted pull-right marginRight10px">{vtranslate('LBL_REQUIRES_AUTHENTICATION', $QUALIFIED_MODULE)}</label></td>
						<td style="border-left: none;"><input type="checkbox" name="smtp_auth" {if $MODEL->isSmtpAuthEnabled()}checked{/if}/></td>
					</tr>
				</tbody>
			</table>
			<span class="alert alert-info">{vtranslate('LBL_OUTGOING_SERVER_FROM_FIELD', $QUALIFIED_MODULE)}</span>
		</form>
	</div>
</div>
{/strip}
