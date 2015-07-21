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
    <div class="detailViewInfo">
		<div class="contents">
			<form id="detailView" class="padding20 form-horizontal">
				<div class="row-fluid">
					<span class="col-md-6 settingsHeader ">
					<h4>{$RECORD_MODEL->get('groupname')}</h4>
					</span>
					<span class="col-md-6">
						<span class="pull-right">
							<button class="btn" onclick="window.location.href='{$RECORD_MODEL->getEditViewUrl()}'" type="button">
								<strong>{vtranslate('LBL_EDIT_RECORD', $MODULE)}</strong>
							</button>
						</span>
					</span>
				</div><hr>
				<div class="control-group FloatWidth m-bot15 paddingTop20px">
					<span class="control-label col-md-2">
						{vtranslate('LBL_GROUP_NAME', $QUALIFIED_MODULE)} <span class="redColor">*</span>
					</span>
					<div class="controls pushDown col-md-8">
						<b>{$RECORD_MODEL->getName()}</b>
					</div>
				</div>
				<div class="control-group FloatWidth m-bot15">
					<span class="control-label col-md-2">
						{vtranslate('LBL_DESCRIPTION', $QUALIFIED_MODULE)}
					</span>
					<div class="controls pushDown  col-md-8">
						<b>{$RECORD_MODEL->getDescription()}</b>
					</div>
				</div>
				<div class="control-group FloatWidth m-bot15">
					<span class="control-label col-md-2">
						{vtranslate('LBL_GROUP_MEMBERS', $QUALIFIED_MODULE)}
					</span>
					<div class="controls pushDown  col-md-4">
						<div class="row-fluid">
						<span class="collectiveGroupMembers">
							<ul class="nav nav-list GroupMemberBg">
							{assign var="GROUPS" value=$RECORD_MODEL->getMembers()}
							{foreach key=GROUP_LABEL item=GROUP_MEMBERS from=$GROUPS}
								{if !empty($GROUP_MEMBERS)}
									<li class="row-fluid groupLabel nav-header">
											{vtranslate($GROUP_LABEL,$QUALIFIED_MODULE)}
									</li>
									{foreach item=GROUP_MEMBER_INFO from=$GROUP_MEMBERS}
										<li class="row-fluid">
											<a href="{$GROUP_MEMBER_INFO->getDetailViewUrl()}">{$GROUP_MEMBER_INFO->get('name')}</a>
										</li>
									{/foreach}
								{/if}
							{/foreach}
							</ul>
						</span>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
{strip}
