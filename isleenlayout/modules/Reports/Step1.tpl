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
{strip}		<div class="panel-body">
			<div class="reportContents CustomReportStep1">
				<form class="form-horizontal recordEditView" id="report_step1" method="post" action="index.php">
					<input type="hidden" name="module" value="{$MODULE}" />
					<input type="hidden" name="view" value="Edit" />
					<input type="hidden" name="mode" value="step2" />
					<input type="hidden" class="step" value="1" />
					<input type="hidden" name="isDuplicate" value="{$IS_DUPLICATE}" />
					<input type="hidden" name="record" value="{$RECORD_ID}" />
					<input type=hidden id="relatedModules" data-value='{ZEND_JSON::encode($RELATED_MODULES)}' />
					<div class="well contentsBackground">
						<div class="row-fluid padding1per" style="float:left;width:100%;padding:15px 0;">
							<span class="col-md-4">{vtranslate('LBL_REPORT_NAME',$MODULE)}<span class="redColor">*</span></span>
							<span class="col-md-4 row-fluid"><input class="form-control" data-validation-engine='validate[required]' type="text" name="reportname" value="{$REPORT_MODEL->get('reportname')}"/></span>
						</div>
						<div class="row-fluid padding1per" style="float:left;width:100%;padding:15px 0;">
							<span class="col-md-4">{vtranslate('LBL_REPORT_FOLDER',$MODULE)}<span class="redColor">*</span></span>
							<span class="col-md-4 row-fluid">
								<select class="chzn-select form-control" name="folderid">
									<optgroup>

										{foreach item=REPORT_FOLDER from=$REPORT_FOLDERS}
											<option value="{$REPORT_FOLDER->getId()}"
													{if $REPORT_FOLDER->getId() eq $REPORT_MODEL->get('folderid')}
														selected=""
													{/if}
													>{vtranslate($REPORT_FOLDER->getName(), $MODULE)}</option>
										{/foreach}
									</optgroup>
								</select>
							</span>
						</div>
						<div class="row-fluid padding1per"  style="float:left;width:100%;padding:15px 0;">
							<span class="col-md-4">{vtranslate('LBL_DESCRIPTION',$MODULE)}</span>
							<span class="col-md-4"><textarea class="form-control" type="text" name="description" >{$REPORT_MODEL->get('description')}</textarea></span>
						</div>
						<div class="row-fluid padding1per"  style="float:left;width:100%;padding:15px 0;">
							<span class="col-md-4">{vtranslate('PRIMARY_MODULE',$MODULE)}<span class="redColor">*</span></span>
							<span class="col-md-4 row-fluid">
								<select class="form-control chzn-select" id="primary_module" name="primary_module">
									<optgroup>
										{foreach key=RELATED_MODULE_KEY item=RELATED_MODULE from=$MODULELIST}
											<option value="{$RELATED_MODULE_KEY}" {if $REPORT_MODEL->getPrimaryModule() eq $RELATED_MODULE_KEY } selected="selected" {/if}>
												{vtranslate($RELATED_MODULE_KEY,$RELATED_MODULE_KEY)}
											</option>
										{/foreach}
									</optgroup>
								</select>
							</span>
						</div>
						<div class="row-fluid padding1per" style="float:left;width:100%;padding:15px 0;">
							<span class="col-md-4">
								<div>{vtranslate('LBL_SELECT_RELATED_MODULES',$MODULE)}</div>
								<div>({vtranslate('LBL_MAX',$MODULE)}&nbsp;2)</div>
							</span>
							<span class="col-md-4 row-fluid">
								{assign var=SECONDARY_MODULES_ARR value=explode(':',$REPORT_MODEL->getSecondaryModules())}
								{assign var=PRIMARY_MODULE value=$REPORT_MODEL->getPrimaryModule()}

								{if $PRIMARY_MODULE eq ''}
									{foreach key=PARENT item=RELATED from=$RELATED_MODULES name=relatedlist}
										{if $smarty.foreach.relatedlist.index eq 0}
											{assign var=PRIMARY_MODULE value=$PARENT}
										{/if}
									{/foreach}
								{/if}
								{assign var=PRIMARY_RELATED_MODULES value=$RELATED_MODULES[$PRIMARY_MODULE]}
								<select class="form-control select2-container" id="secondary_module" multiple name="secondary_modules[]" data-placeholder="{vtranslate('LBL_SELECT_RELATED_MODULES',$MODULE)}">
									{foreach key=PRIMARY_RELATED_MODULE  item=PRIMARY_RELATED_MODULE_LABEL from=$PRIMARY_RELATED_MODULES}
										<option {if in_array($PRIMARY_RELATED_MODULE,$SECONDARY_MODULES_ARR)} selected="" {/if} value="{$PRIMARY_RELATED_MODULE}">{$PRIMARY_RELATED_MODULE_LABEL}</option>
									{/foreach}
								</select>
							</span>
						</div>
					</div>
					<div class="pull-right">
						<button type="submit" class="btn btn-success nextStep"><strong>{vtranslate('LBL_NEXT',$MODULE)}</strong></button>&nbsp;&nbsp;
						<a onclick='window.history.back()' class="cancelLink cursorPointer">{vtranslate('LBL_CANCEL',$MODULE)}</a>
					</div>
				</form>
			</div>
		</div>
		</section>
	</section>
</section>
{/strip}
