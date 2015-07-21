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
	<div class="contentsDiv col-md-12 marginLeftZero paddingLeft10px" id="labeleditorContents">
		<form name="labeleditor" id="labeleditor" class="form-horizontal FloatWidth" method="post" action="index.php">
			<input type="hidden" value="LabelEditor" name="module">
			<input type="hidden" value="Save" name="action">
			<input type="hidden" value="Settings" name="parent">
			
			<div class="widget_header row-fluid m-bot15">
				<span class="col-md-6"><h2>{vtranslate('LabelEditor', $QUALIFIED_MODULE)}</h2></span>
				<span class="col-md-8" style="opacity: 0.5;font-size: 12px;padding-bottom:5px;">Customize Field Names, Menu Names and other labels to suit your business needs</span>
			</div>
			<hr style="margin: 0;" class="clearfix">
			<br>
			<div class="contents row-fluid">
				<span class="col-md-2" style="font-size:14px;margin-top:5px">Step 1  </span>
				<span class="col-md-4">
						<select id="step1" name="step1" class="select2">
							<option>Select Language</option>
							{foreach item=ITEM key="KEY" from=$LANGUAGE}
								<option value="{$KEY}">{vtranslate($ITEM,$QUALIFIED_MODULE)}</option>
							{/foreach}
						</select>
				</span>
			</div>
			<div class="row-fluid steps FloatWidth" id="div2" style="display:none;margin-top:15px;">
				<span class="col-md-2" style="font-size:14px;margin-top:5px;">Step 2</span>
				{**<span class="col-md-4">
					<input type="search" placeholder="Enter label to search" name="langSearch" id="langSearch">
				</span>
				<span class="col-md-10" style="margin-top:5px;">or</span>**}
				<span class="col-md-4" >
					<select class="step2 select2" id="step2" name="step2"> 
						<option>Select Modules</option>
					</select>
				</span>
			</div>
			<div class="row-fluid steps FloatWidth" id="step3" style="display:none;margin-top: 20px;">
				<div style="padding-bottom: 5px;" class="row-fluid FloatWidth">
					<span style="font-size:14px;" class="col-md-2">Step 3  </span>
					<span style="font-size:14px;" class="col-md-6">Edit Labels in the table below</span>
				</div>
				<div id="languageContents" class="dataTable FloatWidth" style="margin-top: 20px;">
					<table class="table table-bordered listViewEntriesTable" cellspacing="0" cellpadding="0">
						<thead>
							<tr class="listViewHeaders">
								<th class="medium">
									<span class="small">Default Label</span>
								</th>
								<th class="medium">
									<span class="small">Custom Label 
										<span title="Double click on the row to edit and save." id="customStringHelp"></span>
									</span>
								</th>
							</tr>
						</thead>
						<tbody>
							
						</tbody>
					</table>
				</div>
				<div class="row-fluid">
					<div class="col-md-6">
						<button name="saveMenusList" type="submit" class="btn btn-success pull-right">
							<strong>Save</strong>
						</button>
					</div>
				</div>
			</div>
		</form>
	</div>
{/strip}