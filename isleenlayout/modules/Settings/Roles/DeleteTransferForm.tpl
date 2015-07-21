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
<div class="modelContainer">
	<div class="modal-header">
		<button class="close vtButton" data-dismiss="modal">×</button>
		<h3>{vtranslate('LBL_DELETE_ROLE', $QUALIFIED_MODULE)} - {$RECORD_MODEL->getName()}</h3>
	</div>
	<form class="form-horizontal" id="roleDeleteForm" method="post" action="index.php">
		<input type="hidden" name="module" value="{$MODULE}" />
		<input type="hidden" name="parent" value="Settings" />
		<input type="hidden" name="action" value="Delete" />
		<input type="hidden" name="record" id="record" value="{$RECORD_MODEL->getId()}" />

		<div class="modal-body marginLeftRight20px">
			<h5>{vtranslate('LBL_TRANSFER_OWNERSHIP',$QUALIFIED_MODULE)}</h5>
			<div class="control-group FloatWidth">
				<div class="control-label col-md-6">
					<span class="redColor">*</span>{vtranslate('LBL_TO_OTHER_ROLE',$QUALIFIED_MODULE)}
				</div>
				<div class="controls col-md-6">
					<input id="transfer_record" name="transfer_record" type="hidden" value="" class="sourceField">
					<div class="input-prepend input-append input-group">
						<span class="add-on cursorPointer input-group-addon" id="clearRole" style="float: none;margin-top: 0;padding: 6px 12px;">
							<i class="fa fa-times-circle"></i>
						</span>
						<input id="transfer_record_display" data-validation-engine='validate[required]' name="transfer_record_display" readonly type="text" class="input-medium form-control" required value="">
						<span class="add-on cursorPointer relatedPopup input-group-addon" data-field="transfer_record" data-action="popup" data-url="{$RECORD_MODEL->getPopupWindowUrl()}&type=Transfer" style="float: none;margin-top: 0;padding: 6px 12px;">
							<i class="fa fa-search"></i>
						</span>
					</div>
				</div>
			</div>
		</div>

			<div class="modal-footer FloatWidth">
				<div class=" pull-right cancelLinkContainer">
					<a class="cancelLink" data-dismiss="modal" type="reset">Cancel</a>
				</div>
				<button class="btn btn-success pull-right" type="submit">{vtranslate('LBL_SAVE', $QUALIFIED_MODULE)}</button>
			</div>
	</form>
</div>
{/strip}
