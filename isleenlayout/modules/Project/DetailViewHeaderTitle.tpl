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
		<i class="fa fa-cogs"></i>
	</span>
	<span class="user-name">
		<span class="row-fluid">
			<h5 class="recordLabel font-x-x-large textOverflowEllipsis pushDown span" title="{$RECORD->getName()}"  style="color:#FFFFFF;margin:0">
				{foreach item=NAME_FIELD from=$MODULE_MODEL->getNameFields()}
					{assign var=FIELD_MODEL value=$MODULE_MODEL->getField($NAME_FIELD)}
						{if $FIELD_MODEL->getPermissions()}
							<span class="{$NAME_FIELD}">{$RECORD->get($NAME_FIELD)}</span>&nbsp;
						{/if}
				{/foreach}
			</h5>
		</span>
		{assign var=RELATED_TO value=$RECORD->get('linktoaccountscontacts')}
		{if !empty($RELATED_TO)}
		<span class="row-fluid">
			<span class="muted" style="color:#FFFFFF;">{vtranslate('Related to',$MODULE_NAME)} </span>
			{$RECORD->getDisplayValue('linktoaccountscontacts')}
		</span>	
        <p class="headermar0">{$RECORD->get('targetbudget')}</p>        
		{/if}
	</span>
{/strip}