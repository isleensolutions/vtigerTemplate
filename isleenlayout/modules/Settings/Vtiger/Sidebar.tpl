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
<div class="sidebarTitleBlock">
	<h3 class="titlePadding themeTextColor unSelectedQuickLink cursorPointer"><a href="index.php?module=Vtiger&parent=Settings&view=Index">{vtranslate('LBL_SETTINGS', $QUALIFIED_MODULE)}</a></h3>
</div>
<hr>
<!--div>
	<input class='input-medium' type='text' name='settingsSearch' placeholder={vtranslate("LBL_SEARCH_SETTINGS_PLACEHOLDER", $QUALIFIED_MODULE)} >
</div-->
<div class="quickWidgetContainer accordion SettingSidebar" id="settingsQuickWidgetContainer">
	{foreach item=MENU from=$SETTINGS_MENUS}
		<div class="quickWidget">
			<div class="accordion-heading accordion-toggle quickWidgetHeader collapsed" data-parent="#settingsQuickWidgetContainer" data-target="#Settings_sideBar_{Vtiger_Util_Helper::replaceSpaceWithUnderScores($MENU->getLabel())}"
				data-toggle="collapse" data-parent="#quickWidgets" style="float: left;padding: 10px 0 10px 10px;width: 100%;">
				
				<h5 class="title col-md-10 paddingLeft10px widgetTextOverflowEllipsis" title="{vtranslate($MENU->getLabel(), $QUALIFIED_MODULE)}">{vtranslate($MENU->getLabel(), $QUALIFIED_MODULE)}</h5>
				<span class="dcjq-icon" style="position: relative;right: 0;top: 10px;"></span>
			</div>
			<div  class="widgetContainer accordion-body {if $SELECTED_MENU->get('blockid') eq $MENU->get('blockid')  && !empty($SELECTED_FIELDID)} in {/if} collapse" id="Settings_sideBar_{Vtiger_Util_Helper::replaceSpaceWithUnderScores($MENU->getLabel())}" 
				style="float: left;height: auto; width: 100%;">
			{foreach item=MENUITEM from=$MENU->getMenuItems()}
				<div class="{if $MENUITEM->getId() eq $SELECTED_FIELDID} selectedMenuItem selectedListItem{/if}" style='border-top: 0 none;float: left;padding-bottom: 5px;  padding-left: 10px;width: 100%;'>
					<div class="row-fluid menuItem"  data-actionurl="{$MENUITEM->getPinUnpinActionUrl()}">
						<a href="{$MENUITEM->getUrl()}" data-id="{$MENUITEM->getId()}" class="col-md-11 menuItemLabel" data-menu-item="true" style="padding:15px 0 15px 10px;color:#BABABA" >{vtranslate($MENUITEM->get('name'), $QUALIFIED_MODULE)} </a>					
					</div>
				</div>
			{/foreach}	
			</div>
		</div>
	{/foreach}
</div>
{/strip}
