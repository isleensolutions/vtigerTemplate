{*+***********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.0
* ("License"); You may not use this file except in compliance with the License
* The Original Code is:  vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
*************************************************************************************}
{strip}
    <div class="editContainer" style="padding-left: 3%;padding-right: 3%">
        <h3>
            {if $RECORDID eq ''}
                {vtranslate('LBL_CREATING_WORKFLOW',$QUALIFIED_MODULE)}
            {else}
                {vtranslate('LBL_EDITING_WORKFLOW',$QUALIFIED_MODULE)} : {$WORKFLOW_MODEL->get('summary')}
            {/if}
        </h3>

        <hr>       
            <div id="breadcrumb"  class="stepy-tab">
                <ul id="reportBreadCrumbs" class="crumbs marginLeftZero">
                    <li class="first step Customstep"  style="z-index:9;clear: none;" id="step1">
                        <a>
                            <em><span class="stepNum">1</span></em>
                            <em><span class="stepText">{vtranslate('SCHEDULE_WORKFLOW',$QUALIFIED_MODULE)}</span></em>
                        </a>
                    </li>
                    <li style="z-index:8;clear: none;" class="step Customstep" id="step2">
                        <a>
                            <em><span class="stepNum">2</span></em>
                           <em> <span class="stepText">{vtranslate('ADD_CONDITIONS',$QUALIFIED_MODULE)}</span></em>
                        </a>
                    </li>
                    <li class="step last Customstep" style="z-index:7;clear: none;" id="step3">
                        <a>
                            <em><span class="stepNum">3</span></em>
                            <em><span class="stepText">{vtranslate('ADD_TASKS',$QUALIFIED_MODULE)}</span></em>
                        </a>
                    </li>
                </ul>         
        </div>
        <div class="clearfix"></div>
    </div>
{/strip}