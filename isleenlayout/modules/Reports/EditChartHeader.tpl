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
<section id="main-content" style="min-height: 420px;">
  <section class="wrapper site-min-height">
    <section class="panel">
      <header class="panel-heading">
   <div class="editContainer" style="padding-left: 1%;padding-right: 3%">
       <h3>
           {if $RECORD_ID eq ''}
               {vtranslate('LBL_CREATING_CHART_REPORT',$QUALIFIED_MODULE)}
           {else}
               {vtranslate('LBL_EDITING_CHART_REPORT',$QUALIFIED_MODULE)} : {$REPORT_MODEL->get('reportname')}
          {/if}
       </h3>
       <hr>
       <div class="stepy-tab">
           <ul id="reportBreadCrumbs" class="breadcrumb">
               <li class="step1 Customstep "  style="z-index:9" id="step1">
                       <span class="stepText"><em>{vtranslate('LBL_STEP_1',$MODULE)}</em><em>{vtranslate('LBL_REPORT_DETAILS',$MODULE)}</em></span>
               </li>
               <li style="z-index:8" class="step1 Customstep " id="step2">
                       <span class="stepText "><em>{vtranslate('LBL_STEP_2',$MODULE)}</em><em>{vtranslate('LBL_FILTERS',$MODULE)}</em></span>
               </li>
               <li class="step1 Customstep " style="z-index:7" id="step3">
                       <span class="stepText"><em>{vtranslate('LBL_STEP_3',$MODULE)}</em><em>{vtranslate('LBL_SELECT_CHART',$MODULE)}</em></span>
               </li>
           </ul>
       </div>
       <div class="clearfix"></div>
   </div>
 </header>
{/strip}