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
        {*<!--<img src="{vimage_path('summary_Tickets.png')}" class="summaryImg" />-->*}
             {*<!--<i class="fa {$UPDATE->getParent()->getModule()->getIcon()}"></i>-->*}
    <span class="detail-icon">
        <i class="fa fa-ticket"></i>
        </span>    

    <span class="user-name">
        <span class="row-fluid">
            <h5 class="recordLabel" title="{$RECORD->getName()}">
                {foreach item=NAME_FIELD from=$MODULE_MODEL->getNameFields()}
                    {assign var=FIELD_MODEL value=$MODULE_MODEL->getField($NAME_FIELD)}
                    {if $FIELD_MODEL->getPermissions()}
                        <span class="{$NAME_FIELD}">{$RECORD->get($NAME_FIELD)}</span>&nbsp;
                    {/if}
                {/foreach}
            </h5>
        </span>
        {assign var=PRIORITY value=$RECORD->get('ticketpriorities')}
        {if !empty($PRIORITY)}
            <span class="row-fluid">
                <span class="title_label">{vtranslate('Priority',$MODULE_NAME)} - </span>
                {$RECORD->getDisplayValue('ticketpriorities')}
            </span>
        {/if}
    </span>

{/strip}