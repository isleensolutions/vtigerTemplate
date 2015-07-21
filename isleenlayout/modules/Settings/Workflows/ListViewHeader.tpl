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
<div class="listViewPageDiv">
	<div class="listViewTopMenuDiv CustomFloatRight">
        <div class="row-fluid FloatWidth">
		<label class=" pull-left themeTextColor font-x-x-large">{vtranslate($MODULE,$QUALIFIED_MODULE)}</label>
        
        <div class="pull-right">
        <b>
        {if $CRON_RECORD_MODEL->isDisabled() }{vtranslate('LBL_DISABLED',$QUALIFIED_MODULE)}{/if}
            {if $CRON_RECORD_MODEL->isRunning() }{vtranslate('LBL_RUNNING',$QUALIFIED_MODULE)}{/if}
            {if $CRON_RECORD_MODEL->isEnabled()}
                {if $CRON_RECORD_MODEL->hadTimedout}
                    {vtranslate('LBL_LAST_SCAN_TIMED_OUT',$QUALIFIED_MODULE)}.
                {elseif $CRON_RECORD_MODEL->getLastEndDateTime() neq ''}
                    {vtranslate('LBL_LAST_SCAN_AT',$QUALIFIED_MODULE)}
                    {$CRON_RECORD_MODEL->getLastEndDateTime()}
                    &
                    {vtranslate('LBL_TIME_TAKEN',$QUALIFIED_MODULE)}:
                    {$CRON_RECORD_MODEL->getTimeDiff()}
                    {vtranslate('LBL_SHORT_SECONDS',$QUALIFIED_MODULE)}
                {else}

                {/if}
        {/if}
        </b>
        </div>
        </div>
        <hr style="float:left;width:100%;">
		<div class="row-fluid FloatWidth m-bot15">
			<span class="col-md-4 btn-toolbar">
				<button class="btn addButton" {if stripos($MODULE_MODEL->getCreateViewUrl(), 'javascript:')===0} onclick="{$MODULE_MODEL->getCreateViewUrl()|substr:strlen('javascript:')};"
                        {else} onclick='window.location.href="{$MODULE_MODEL->getCreateViewUrl()}"' {/if}>
					<i class="fa fa-plus"></i>&nbsp;
					<strong>{vtranslate('LBL_NEW', $QUALIFIED_MODULE)} {vtranslate('LBL_WORKFLOW',$QUALIFIED_MODULE)}</strong>
				</button>
			</span>
			<span class="col-md-4 btn-toolbar">
				<select class="chzn-select" id="moduleFilter" >
					<option value="">{vtranslate('LBL_ALL', $QUALIFIED_MODULE)}</option>
					{foreach item=MODULE_MODEL key=TAB_ID from=$SUPPORTED_MODULE_MODELS}
						<option {if $SOURCE_MODULE eq $MODULE_MODEL->getName()} selected="" {/if} value="{$MODULE_MODEL->getName()}">{vtranslate($MODULE_MODEL->getName(),$MODULE_MODEL->getName())}</option>
					{/foreach}
				</select>
			</span>
			<span class="col-md-4 btn-toolbar">
				{include file='ListViewActions.tpl'|@vtemplate_path}
			</span>
		</div>
		<div class="clearfix"></div>
	</div>
	<div class="listViewContentDiv" id="listViewContents">
{/strip}
