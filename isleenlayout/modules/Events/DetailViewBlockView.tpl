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
	{assign var=WIDTHTYPE value=$USER_MODEL->get('rowheight')}
    {include file='DetailViewBlockView.tpl'|@vtemplate_path:'Vtiger' RECORD_STRUCTURE=$RECORD_STRUCTURE MODULE_NAME=$MODULE_NAME}

    {assign var="IS_HIDDEN" value=false}
    <section class="panel DetailViewRemoveBorder">
        <header class="panel-heading">
            <div class="blockHeader" colspan="4">                               
                {vtranslate('LBL_INVITE_USER_BLOCK',{$MODULE_NAME})}
                <span class="tools pull-right">
                    <a class="fa fa-chevron-down" href="javascript:;"></a>                      
                </span>             
            </div>      
        </header>
        <div class="panel-body">
            <table class="table equalSplit detailview-table">	
                <tr>
                    <td class="fieldLabel {$WIDTHTYPE} col-md-3"><label class="muted pull-right" style="font-weight:400;">{vtranslate('LBL_INVITE_USERS',$MODULE_NAME)}</label></td>
                    <td class="fieldValue {$WIDTHTYPE} col-md-3">
                         {foreach key=USER_ID item=USER_NAME from=$ACCESSIBLE_USERS}
        					{if in_array($USER_ID,$INVITIES_SELECTED)}
                                {$USER_NAME}
                                <br>
                            {/if}
                        {/foreach}
                    </td>
                </tr>
           </table>
        </div>
{/strip}