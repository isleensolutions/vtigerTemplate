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
<section id="main-content" style="min-height: 439px;">
    <section class="wrapper site-min-height">
        <section class="panel">
        	<div class="panel-body"> 
				<div class="contentsDiv col-md-12 marginLeftZero">
					<form onsubmit="" action="index.php" enctype="multipart/form-data" method="POST" name="importBasic">
						<input type="hidden" name="module" value="{$FOR_MODULE}" />
						<input type="hidden" name="view" value="Import" />
						<input type="hidden" name="mode" value="uploadAndParse" />

						<table style="margin-left: auto;margin-right: auto;width: 100%;" class="searchUIBasic" cellspacing="12">
							<tr>
								<td class="font-x-large" align="left" colspan="2">		
									<header class="panel-heading  m-bot15">				
										<strong>{'LBL_IMPORT'|@vtranslate:$MODULE} {$FOR_MODULE|@vtranslate:$FOR_MODULE}</strong>
									</header>		
								</td>
							</tr>
							{if $ERROR_MESSAGE neq ''}
							<tr>
								<td class="style1" align="left" colspan="2">
									{$ERROR_MESSAGE}
								</td>
							</tr>
							{/if}
							<tr>
								<td class="leftFormBorder1 importContents" width="40%" valign="top">
								{include file='Import_Step1.tpl'|@vtemplate_path:'Import'}
								</td>
								<td class="leftFormBorder1 importContents" width="40%" valign="top">
								{include file='Import_Step2.tpl'|@vtemplate_path:'Import'}
								</td>
							</tr>
							{if $DUPLICATE_HANDLING_NOT_SUPPORTED neq 'true'}
							<tr>
									<td class="leftFormBorder1 importContents" colspan="2" valign="top">
									{include file='Import_Step3.tpl'|@vtemplate_path:'Import'}
									</td>
							</tr>
							{/if}
							<tr>
								<td align="right" colspan="2">
								{include file='Import_Basic_Buttons.tpl'|@vtemplate_path:'Import'}
								</td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		</section>
	</section>
</section>
{/strip}