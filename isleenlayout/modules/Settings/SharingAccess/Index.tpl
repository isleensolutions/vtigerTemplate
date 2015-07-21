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
<div class="container-fluid" id="sharingAccessContainer">
	<div class="contents">
		<form name="EditSharingAccess" action="index.php" method="post" class="form-horizontal" id="EditSharingAccess">
			<input type="hidden" name="module" value="SharingAccess" />
			<input type="hidden" name="action" value="SaveAjax" />
			<input type="hidden" name="parent" value="Settings" />
			<input type="hidden" class="dependentModules" value='{ZEND_JSON::encode($DEPENDENT_MODULES)}' />
			
			<div>
				<div class="widget_header row-fluid">
					<div class="col-md-8"><h3>{vtranslate('LBL_SHARING_ACCESS', $QUALIFIED_MODULE)}</h3></div>
					<div class="col-md-4">
						<button class="btn btn-success pull-right hide" type="submit" name="saveButton"><strong>{vtranslate('LBL_APPLY_NEW_SHARING_RULES', $QUALIFIED_MODULE)}</strong></button>
					</div>
				</div>
				<hr>
			</div>
			
			<table class="table table-hover table-condensed equalSplit sharingAccessDetails">
				<thead>
					<tr class="blockHeader">
						<th>
							{vtranslate('LBL_MODULE', $QUALIFIED_MODULE)}
						</th>
							
						{foreach from=$ALL_ACTIONS key=ACTION_ID item=ACTION_MODEL}
							<th>
								{$ACTION_MODEL->getName()|vtranslate:$QUALIFIED_MODULE}
							</th>
						{/foreach}
						<th nowrap="nowrap">{'LBL_ADVANCED_SHARING_RULES'|vtranslate:$QUALIFIED_MODULE}</th>
					</tr>
				</thead>
				<tbody>
					<tr data-module-name="Calendar">
						<td>{'SINGLE_Calendar'|vtranslate:'Calendar'}</td>
						<td class="row-fluid">
							<div><input type="radio" style="margin-left: 25%" disabled="disabled" /></div>
						</td>
						<td class="row-fluid">
							<div><input type="radio" style="margin-left: 25%" disabled="disabled" /></div>
						</td>
						<td class="row-fluid">
							<div><input type="radio" style="margin-left: 25%" disabled="disabled" /></div>
						</td>
						<td class="row-fluid">
							<div><input type="radio" style="margin-left: 25%" checked="true" disabled="disabled" /></div>
						</td>
						<td>
							<div class="row-fluid">
								<div class="col-md-3">&nbsp;</div>
								<div class="col-md-6">
									<button type="button" class="btn btn-mini vtButton arrowDown row-fluid" disabled="disabled" style="padding: 0 20px;"><i class="fa fa-chevron-down"></i></button>
								</div>
								<div class="col-md-3">&nbsp;</div>
							</div>
						</td>
					</tr>
					{foreach from=$ALL_MODULES key=TABID item=MODULE_MODEL}
					<tr data-module-name="{$MODULE_MODEL->get('name')}">
						<td>
							{if $MODULE_MODEL->getName() == 'Accounts'}
								{$MODULE_MODEL->get('label')|vtranslate:$QUALIFIED_MODULE}
							{else}
								{$MODULE_MODEL->get('label')|vtranslate:$MODULE_MODEL->getName()}
							{/if}
						</td>
						{foreach from=$ALL_ACTIONS key=ACTION_ID item=ACTION_MODEL}
						<td class="row-fluid">
							{if $ACTION_MODEL->isModuleEnabled($MODULE_MODEL)}
								<div><input style="margin-left: 25%" type="radio" name="permissions[{$TABID}]" data-action-state="{$ACTION_MODEL->getName()}" value="{$ACTION_ID}"{if $MODULE_MODEL->getPermissionValue() eq $ACTION_ID}checked="true"{/if}></div>
							{/if}
						</td>
						{/foreach}
						<td class="triggerCustomSharingAccess">
							<div class="row-fluid">
								<div class="col-md-3">&nbsp;</div>
								<div class="col-md-6">
									<button type="button" class="btn btn-mini vtButton arrowDown row-fluid" data-handlerfor="fields" data-togglehandler="{$TABID}-rules" style="padding: 0 20px;
"><i class="fa fa-chevron-down"></i></button>
									<button type="button" class="btn btn-mini vtButton arrowUp row-fluid hide" data-handlerfor="fields" data-togglehandler="{$TABID}-rules" style="padding: 0 20px;"><i class="fa fa-chevron-up"></i></button>
								</div>
								<div class="col-md-3">&nbsp;</div>
							</div>
						</td>
					</tr>
					{/foreach}
				</tbody>
			</table>
			<div>
				<div class="pull-right">
					<button class="btn btn-success hide" type="submit" name="saveButton"><strong>{vtranslate('LBL_APPLY_NEW_SHARING_RULES', $QUALIFIED_MODULE)}</strong></button>
				</div>
			</div>
		</form>
	</div>
</div>
{/strip}
