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
<div class="container-fluid" id="TermsAndConditionsContainer">
	<div class="widget_header row-fluid">
		<div class="row-fluid"><h3>{vtranslate('LBL_TERMS_AND_CONDITIONS', $QUALIFIED_MODULE)}</h3></div>
	</div>
	<hr>

	<div class="contents row-fluid">
		<div class="col-md-11 padding10">
			<textarea class="input-xxlarge TCContent textarea-autosize form-control" rows="3" placeholder="{vtranslate('LBL_SPECIFY_TERMS_AND_CONDITIONS', $QUALIFIED_MODULE)}" >{$CONDITION_TEXT}</textarea>
		</div>
		<div class="row-fluid">
			<div class="col-md-11 padding1per">
				<button class="btn btn-success pull-right saveTC hide"><strong>{vtranslate('LBL_SAVE', $QUALIFIED_MODULE)}</strong></button>
			</div>
		</div>
	</div>
</div>
{/strip}
