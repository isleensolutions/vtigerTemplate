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
        	<i class="fa fa-sitemap"></i>
    </span>
	<div class="user-name">
       	<h5 class="headermar5" title="{$RECORD->getDisplayValue('salutationtype')}&nbsp;{$RECORD->getName()}">
                {assign var=COUNTER value=0}
                {foreach item=NAME_FIELD from=$MODULE_MODEL->getNameFields()}
                    {assign var=FIELD_MODEL value=$MODULE_MODEL->getField($NAME_FIELD)}
                    {if $FIELD_MODEL->getPermissions()}
                        <span class="{$NAME_FIELD}">{$RECORD->get($NAME_FIELD)}</span>
                    {if $COUNTER eq 0 && ($RECORD->get($NAME_FIELD))}&nbsp;{assign var=COUNTER value=$COUNTER+1}{/if}
                {/if}
            {/foreach}</h5>
        <span style="color:#FFFFFF">            
			<span class="designation_label">{$RECORD->getDisplayValue('designation')}</span>
            {if $RECORD->getDisplayValue('designation') && $RECORD->getDisplayValue('company')}
                &nbsp;{vtranslate('LBL_AT')}&nbsp;
            {/if}
            <span class="company_label">{$RECORD->get('company')}</span>
            <p class="headermar0">{$RECORD->get('phone')}</p>
            <p class="headermar0">{$RECORD->get('email1')}</p>
		</span>
    </div>
{/strip}