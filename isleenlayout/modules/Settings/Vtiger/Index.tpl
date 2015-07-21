{*<!--
/************************************************************************************
** The contents of thisfile are subject to the vtiger CRM Public License Version 1.0
 * ("License"); You may not use this file except in compliance with the License
 * The Original Code is:  vtiger CRM Open Source
 * The Initial Developer of the Original Code is vtiger.
 * Portions created by vtiger are Copyright (C) vtiger.
 * All Rights Reserved.
*
 ************************************************************************************/
-->*}
{strip}
	<div class="container-fluid settingsIndexPage">
		<div class="widget_header row-fluid" style="padding-left: 0"><h3>{vtranslate('LBL_SUMMARY',$MODULE)}</h3></div>
		<hr/>
		<div class="row-fluid state-overview SettingSummaryBGcolor">			
			<span class="col-md-4 row-fluid paddingLeft">
				<section class="panel" style="margin-bottom: 0;">
					<div class="symbol blue">
						<i class="fa fa-user"></i>
					</div>
					<div class="value">
						<a href="index.php?module=Users&parent=Settings&view=List">
							<h1 class="themeTextColor pull-left" style="float: left;font-size: 44px;width: 100%;">{$USERS_COUNT}</h1>
							<p class="col-md-3 font-x-large themeTextColor" style="float: left;width: 100%;">{vtranslate('LBL_ACTIVE_USERS',$MODULE)}</p>
						</a>
					</div>
				</section>
			</span>
			<span class="col-md-4 row-fluid">
				<section class="panel" style="margin-bottom: 0;">
					<div class="symbol red">
						<i class="fa fa-clock-o"></i>
					</div>
					<div class="value">
						<a href="index.php?module=Workflows&parent=Settings&view=List">
							<h1 class="themeTextColor pull-left" style="float: left;font-size: 44px;width: 100%;">{$ACTIVE_WORKFLOWS}</h1>
							<p class="col-md-3 font-x-large themeTextColor" style="float: left;width: 100%;">{vtranslate('LBL_WORKFLOWS_ACTIVE',$MODULE)}</p>
						</a>
					</div>
				</section>
			</span>
			<span class="col-md-4 row-fluid paddingRight">
				<section class="panel" style="margin-bottom: 0;">
					<div class="symbol yellow">
						<i class="fa fa-th"></i>
					</div>
					<div class="value">
						<a href="index.php?module=ModuleManager&parent=Settings&view=List">
							<h1 class="themeTextColor pull-left" style="float: left;font-size: 44px;width: 100%;">{$ACTIVE_MODULES}</h1>
							<p class="col-md-3 font-x-large themeTextColor" style="float: left;width: 100%;">{vtranslate('LBL_MODULES',$MODULE)}</p>
						</a>
					</div>
				</section>
			</span>
		</div>
		<br><br>
		<h3>{vtranslate('LBL_SETTINGS_SHORTCUTS',$MODULE)}</h3>
		<hr>
		<div id="settingsShortCutsContainer" class="row-fluid"/>
		{foreach item=SETTINGS_SHORTCUT from=$SETTINGS_SHORTCUTS name=shortcuts}
			{include file='SettingsShortCut.tpl'|@vtemplate_path:$MODULE}
		{/foreach}

	</div>

{/strip}


