{*+***********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.0
* ("License"); You may not use this file except in compliance with the License
* The Original Code is:  vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
*************************************************************************************}
{strip}
    <div class="workFlowContents">
        <form name="EditWorkflow" action="index.php" method="post" id="workflow_step1" class="form-horizontal">
            <input type="hidden" name="module" value="Workflows">
            <input type="hidden" name="view" value="Edit">
            <input type="hidden" name="mode" value="Step2" />
            <input type="hidden" name="parent" value="Settings" />
            <input type="hidden" class="step" value="1" />
            <input type="hidden" name="record" value="{$RECORDID}" />

            <div class="padding1per FloatWidth" style="border:1px solid #ccc;">
                <label>
                    <strong>{vtranslate('LBL_STEP_1',$QUALIFIED_MODULE)}: {vtranslate('LBL_ENTER_BASIC_DETAILS_OF_THE_WORKFLOW',$QUALIFIED_MODULE)}</strong>
                </label>
                <br>
                <div class="control-group FloatWidth m-bot15">
                    <div class="control-label col-md-3">
                        {vtranslate('LBL_SELECT_MODULE', $QUALIFIED_MODULE)}
                    </div>
                    <div class="controls col-md-5">
                        {if $MODE eq 'edit'}
                            <input type='text' disabled='disabled' value="{vtranslate($MODULE_MODEL->getName(), $MODULE_MODEL->getName())}" >
                            <input type='hidden' name='module_name' value="{$MODULE_MODEL->get('name')}" >
                        {else}
                            <select class="chzn-select" id="moduleName" name="module_name" required="true" data-placeholder="Select Module...">
                                {foreach from=$ALL_MODULES key=TABID item=MODULE_MODEL}
                                    <option value="{$MODULE_MODEL->getName()}" {if $SELECTED_MODULE == $MODULE_MODEL->getName()} selected {/if}>{vtranslate($MODULE_MODEL->getName(), $MODULE_MODEL->getName())}</option>
                                {/foreach}
                            </select>
                        {/if}
                    </div>
                </div>
                <div class="control-group FloatWidth m-bot15">
                    <div class="control-label col-md-3">
                        {vtranslate('LBL_DESCRIPTION', $QUALIFIED_MODULE)}<span class="redColor">*</span>
                    </div>
                    <div class="controls col-md-5">
                        <input type="text" name="summary" class="form-control" data-validation-engine='validate[required]' value="{$WORKFLOW_MODEL->get('summary')}" id="summary" />
                    </div>
                </div>
			</div>
			<div class="controls FloatWidth">
                
				{assign var=WORKFLOW_MODEL_OBJ value=$WORKFLOW_MODEL->getWorkflowObject()}

				{foreach from=$TRIGGER_TYPES item=LABEL key=LABEL_ID}
                    <div class="col-md-3"></div>
					<div class="col-md-8">
                        <div>
    						<label><input type="radio" class="alignTop" name="execution_condition" {if $WORKFLOW_MODEL_OBJ->executionCondition eq $LABEL_ID} checked="" {/if} value="{$LABEL_ID}" {if $WORKFLOW_MODEL->getId() eq '' && $SCHEDULED_WORKFLOW_COUNT >= $MAX_ALLOWED_SCHEDULED_WORKFLOWS && $LABEL_ID eq 6} disabled {/if} />&nbsp;&nbsp;{vtranslate($LABEL,$QUALIFIED_MODULE)}
    						</label><br>
    						<div class="clearfix"></div>
    					</div>
                    </div>
				{/foreach}
			</div>
			<div class="pull-right">
				<button class="btn btn-success" type="submit" disabled="disabled" style="margin-right: 5px;"><strong>{vtranslate('LBL_NEXT', $QUALIFIED_MODULE)}</strong></button>
				<a class="cancelLink" type="reset" onclick="javascript:window.history.back();">{vtranslate('LBL_CANCEL', $QUALIFIED_MODULE)}</a>
			</div>
			<div class="clearfix"></div>
		</form>
	</div><br>
{/strip}
