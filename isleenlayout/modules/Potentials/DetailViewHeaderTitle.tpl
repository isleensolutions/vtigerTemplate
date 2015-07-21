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
    <span class="detail-icon">
        	<i class="fa fa-money"></i>
    </span>
    <div class="user-name">
            <h5 class="recordLabel pushDown headermar5" title="{$RECORD->getName()}">
                {foreach item=NAME_FIELD from=$MODULE_MODEL->getNameFields()}
                    {assign var=FIELD_MODEL value=$MODULE_MODEL->getField($NAME_FIELD)}
                    {if $FIELD_MODEL->getPermissions()}
                        <span class="{$NAME_FIELD}">{$RECORD->get($NAME_FIELD)}</span>&nbsp;
                    {/if}
                {/foreach}
            </h5>

        {assign var=RELATED_TO value=$RECORD->get('related_to')}
        {if !empty($RELATED_TO)}
            <span class="row-fluid" style="color:#FFFFFF">
                <span class="muted">{vtranslate('Related to',$MODULE_NAME)} - </span>
                {$RECORD->getDisplayValue('related_to')}
                <p class="headermar0">{$RECORD->getDisplayValue('amount')}</p>
            </span>
        {/if}
    </div>
{/strip}