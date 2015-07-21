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
<div class="container-fluid">
	<div class="widget_header">
		<h3>{vtranslate('CustomerPortal', $QUALIFIED_MODULE)}</h3>
	</div>
	<hr>
	<div class="contents row-fluid">
		<form id="customerPortalForm" class="form-horizontal paddingTop20px">
			<div class="row-fluid">
				<input type="hidden" name="portalModulesInfo" value="" />
				<div class="control-group FloatWidth m-bot15">
					<label class="muted control-label col-md-2 paddingRight">{vtranslate('LBL_PRIVILEGES', $QUALIFIED_MODULE)}</label>
					<div class="controls col-md-10 paddingRight">
						<span class="row-fluid">
							<select name="privileges" class="select2 col-md-5">
								{foreach item=USER_MODEL from=$USER_MODELS}
									{assign var=USER_ID value=$USER_MODEL->getId()}
									<option value="{$USER_ID}" {if $CURRENT_PORTAL_USER eq $USER_ID} selected {/if}>{$USER_MODEL->getName()}</option>
								{/foreach}
							</select>							
							<span class="col-md-7 paddingRight"><i class="fa fa-info-circle alignMiddle"></i>&nbsp;{vtranslate('LBL_PREVILEGES_MESSAGE', $QUALIFIED_MODULE)}</span>							
						</span>
					</div>
				</div>
				<div class="control-group FloatWidth m-bot15">
					<label class="muted control-label col-md-2 paddingRight">{vtranslate('LBL_DEFAULT_ASSIGNEE', $QUALIFIED_MODULE)}</label>
					<div class="controls col-md-10 paddingRight">
						<span class="row-fluid">
							<select name="defaultAssignee" class="select2 col-md-5">
								<optgroup style="border: none" label="{vtranslate('LBL_USERS', $QUALIFIED_MODULE)}" >
									{foreach item=USER_MODEL from=$USER_MODELS}
										{assign var=USER_ID value=$USER_MODEL->getId()}
										<option value="{$USER_ID}" {if $CURRENT_DEFAULT_ASSIGNEE eq $USER_ID} selected {/if}>{$USER_MODEL->getName()}</option>
									{/foreach}
								</optgroup>
								<optgroup style="border: none" label="{vtranslate('LBL_GROUPS', $QUALIFIED_MODULE)}">
									{foreach item=GROUP_MODEL from=$GROUP_MODELS}
										{assign var=GROUP_ID value=$GROUP_MODEL->getId()}
										<option value="{$GROUP_ID}" {if $CURRENT_DEFAULT_ASSIGNEE eq $GROUP_ID} selected {/if}>{$GROUP_MODEL->getName()}</option>
									{/foreach}
								</optgroup>
							</select>							
							<span class="col-md-7 paddingRight"><i class="fa fa-info-circle alignMiddle"></i>&nbsp;{vtranslate('LBL_DEFAULT_ASSIGNEE_MESSAGE', $QUALIFIED_MODULE)}</span>							
						</span>
					</div>	
				</div>
				<div class="control-group FloatWidth m-bot15">
					<label class="muted control-label col-md-2 paddingRight">{vtranslate('LBL_PORTAL_URL', $QUALIFIED_MODULE)}</label>
					<div class="controls col-md-10 paddingRight">
						<span class="row-fluid">
							<span class="col-md-5 pushDownHalfper"><a class="alignBottom" href="{$PORTAL_URL}">{$PORTAL_URL}</a></span>
							<span class="col-md-7 paddingRight"><i class="fa fa-info-circle alignMiddle"></i>&nbsp;{vtranslate('LBL_PORTAL_URL_MESSAGE', $QUALIFIED_MODULE)}</span>							
						</span>
					</div>
				</div>
				<div class="FloatWidth m-bot15"><i class="fa fa-info-circle alignMiddle"></i>&nbsp;{vtranslate('LBL_DRAG_AND_DROP_MESSAGE', $QUALIFIED_MODULE)}</div><br>
				<table id="portalModulesTable" class="table table-bordered table-condensed themeTableColor">
					<thead>
						<tr class="blockHeader">
							<th>
								{vtranslate('LBL_MODULE_NAME', $QUALIFIED_MODULE)}
							</th>
							<th>
								{vtranslate('LBL_ENABLE_MODULE', $QUALIFIED_MODULE)}
							</th>
							<th>
								{vtranslate('LBL_VIEW_ALL_RECORDS', $QUALIFIED_MODULE)}
							</th>
						</tr>
					</thead>
					<tbody>
						{foreach key=TAB_ID item=MODEL from=$MODULES_MODELS}
							{assign var=MODULE_NAME value=$MODEL->get('name')}
							<tr class="portalModuleRow" data-id="{$TAB_ID}" data-sequence="{$MODEL->get('sequence')}" data-module="{$MODULE_NAME}">
								<input type="hidden" name="portalModulesInfo[{$TAB_ID}][sequence]" value="{$MODEL->get('sequence')}" />
								<td><div class="row-fluid">
										<span class="col-md-2"><a><i class="fa fa-rocket"></i></a></span>
										<span class="col-md-10">{vtranslate($MODULE_NAME, $MODULE_NAME)}</span>
									</div>
								</td>
								<td>
									<input type="hidden" name="portalModulesInfo[{$TAB_ID}][visible]" value="0" />
									<input type="checkbox" name="portalModulesInfo[{$TAB_ID}][visible]" value="1" {if $MODEL->get('visible') == '1'} checked {/if}/>
								</td>
								<td>
									<label class="radio inline col-md-3">
										<input type="radio" name="portalModulesInfo[{$TAB_ID}][prefValue]" value="1" {if $MODEL->get('prefvalue') == '1'} checked="checked" {/if}/>
										&nbsp;{vtranslate('LBL_YES', $QUALIFIED_MODULE)}
									</label>
									<label class="radio inline col-md-3">
										<input type="radio" name="portalModulesInfo[{$TAB_ID}][prefValue]" value="0" {if $MODEL->get('prefvalue') == '0'} checked="checked" {/if}/>
										&nbsp;{vtranslate('LBL_NO', $QUALIFIED_MODULE)}
									</label>
								</td>
							</tr>
						{/foreach}
					</tbody>
				</table>
			</div>
			<div class="row-fluid">
				<div class="col-md-6 padding1per">
					<button class="btn btn-success pull-right" type="submit" disabled="true" name="savePortalInfo"><strong>{vtranslate('LBL_SAVE', $QUALIFIED_MODULE)}</strong></button>
				</div>
				<div class="col-md-6">&nbsp;</div>
			</div>
		</form>
	</div>
</div>
{/strip}
