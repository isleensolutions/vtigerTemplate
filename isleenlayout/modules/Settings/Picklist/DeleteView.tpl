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
<div class="modal DeletePicklistItem" style="height: 310px;">
<div class='modelcontainer'>
	<div class="modal-header">
		<button data-dismiss="modal" class="close" title="{vtranslate('LBL_CLOSE')}">x</button>
		<h3>{vtranslate('LBL_DELETE_PICKLIST_ITEMS', $QUALIFIED_MODULE)}</h3>
	</div>
	<form id="deleteItemForm" class="form-horizontal" method="post" action="index.php">
		<input type="hidden" name="module" value="{$MODULE}" />
		<input type="hidden" name="parent" value="Settings" />
		<input type="hidden" name="source_module" value="{$SOURCE_MODULE}" />
		<input type="hidden" name="action" value="SaveAjax" />
		<input type="hidden" name="mode" value="remove" />
		<input type="hidden" name="picklistName" value="{$FIELD_MODEL->get('name')}" />
		<div class="modal-body tabbable marginLeftRight20px">
			<div class="control-group FloatWidth m-bot15">
				<div class="control-label col-md-6">{vtranslate('LBL_ITEMS_TO_DELETE',$QUALIFIED_MODULE)}</div>
				<div class="controls col-md-6">
					<select class="select2 form-control" multiple="" id="deleteValue" name="delete_value[]">
						{foreach from=$SELECTED_PICKLISTFIELD_EDITABLE_VALUES key=PICKLIST_VALUE_KEY item=PICKLIST_VALUE}
							<option {if in_array($PICKLIST_VALUE,$FIELD_VALUES)} selected="" {/if} value="{$PICKLIST_VALUE}">{vtranslate($PICKLIST_VALUE,$SOURCE_MODULE)}</option>
						{/foreach}	
					</select>	
					<input id="pickListValuesCount" type="hidden" value="{count($SELECTED_PICKLISTFIELD_EDITABLE_VALUES)}" />
				</div>
			</div>
			<div class="control-group FloatWidth m-bot15">
				<div class="control-label col-md-6">{vtranslate('LBL_REPLACE_IT_WITH',$QUALIFIED_MODULE)}</div>
				<div class="controls col-md-6">
					<select id="replaceValue" name="replace_value" class="chzn-select" data-validation-engine="validate[required]">
						{foreach from=$SELECTED_PICKLISTFIELD_EDITABLE_VALUES key=PICKLIST_VALUE_KEY item=PICKLIST_VALUE}
							{if !(in_array($PICKLIST_VALUE, $FIELD_VALUES))}
								<option value="{$PICKLIST_VALUE}">{vtranslate($PICKLIST_VALUE,$SOURCE_MODULE)}</option>
							{/if}
						{/foreach}
					</select>
				</div>
			</div>
				{if $SELECTED_PICKLISTFIELD_NON_EDITABLE_VALUES}
			<div class="control-group FloatWidth m-bot15">
				<div class="control-label col-md-6">{vtranslate('LBL_NON_EDITABLE_PICKLIST_VALUES',$QUALIFIED_MODULE)}</div>
				<div class="controls nonEditableValuesDiv col-md-6">
					<ul class="nonEditablePicklistValues" style="list-style-type: none;">
					{foreach from=$SELECTED_PICKLISTFIELD_NON_EDITABLE_VALUES key=NON_EDITABLE_VALUE_KEY item=NON_EDITABLE_VALUE}
						<li>{vtranslate($NON_EDITABLE_VALUE,$SOURCE_MODULE)}</li>
					{/foreach}
					</ul>
				</div>
				{/if}
			</div>
		</div>
		<div class="modal-footer FloatWidth">
			<div class=" pull-right cancelLinkContainer">
				<a class="cancelLink" type="reset" data-dismiss="modal">{vtranslate('LBL_CANCEL', $MODULE)}</a>
			</div>
			<button class="btn btn-danger" type="submit" name="saveButton">
				<strong>{vtranslate('LBL_DELETE', $MODULE)}</strong>
			</button>
		</div>
	</form>
</div>
</div>
{/strip}
