{************************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.1
* ("License"); You may not use this file except in compliance with the License
* The Original Code is:  vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
************************************************************************************}
{strip}
	<div class="listViewPageDiv" id="email_con" name="email_con">
		<input type="hidden" id="jscal_dateformat" name="jscal_dateformat" value="yyyy-mm-dd" />
			<div class="listViewTopMenuDiv noprint">
				<div class="listViewActionsDiv row-fluid" style="padding: 0px;">
					<span class="btn-toolbar span12">
						<strong>{Vtiger_Util_Helper::toSafeHTML($FOLDER->name())}</strong>
						{if $FOLDER->mails()}
							<span class="pull-right listViewActions">
								<span class="pageNumbers alignTop">
									{$FOLDER->pageInfo()}
								</span>
								<span class="btn-group alignTop">
									<span class="btn-group">
										{if $FOLDER->hasPrevPage()}
											<button class="btn" href="#{$FOLDER->name()}/page/{$FOLDER->pageCurrent(-1)}" onclick="MailManager.folder_open('{$FOLDER->name()}', {$FOLDER->pageCurrent(-1)});">
												<span class="icon-chevron-left"></span>
											</button>
										{/if}
										{if $FOLDER->hasNextPage()}
											<button class="btn" href="#{$FOLDER->name()}/page/{$FOLDER->pageCurrent(1)}" onclick="MailManager.folder_open('{$FOLDER->name()}', {$FOLDER->pageCurrent(1)});">
												<span class="icon-chevron-right"></span>
											</button>
										{/if}
									</span>
								</span>
							</span>
						{/if}&nbsp;
					</span>
				</div>
			</div>

			<div class="listViewContentDiv">
				<div class="listViewEntriesDiv">
					<table class="table table-bordered listViewEntriesTable">
						<thead>
							<tr class="listViewHeaders">
								<th colspan="2" class="narrowWidthType">
									<input align="left" type="checkbox" class='small'  name="selectall" id="parentCheckBox" onClick='MailManager.toggleSelect(this.checked,"mc_box");'/>
									&nbsp;<input type=button class='crmbutton small delete' onclick="MailManager.massMailDelete('{$FOLDER->name()}');" value="{vtranslate('LBL_Delete',$MODULE)}" style="margin-bottom:0px !important;"/>
									&nbsp;<select style="width:auto;margin-bottom: 0px !important;" id="moveFolderList" onchange="MailManager.moveMail(this);" style="margin-bottom:0px !important;">
										<option value="">{vtranslate('LBL_MOVE_TO',$MODULE)}</option>
										{foreach item=folder from=$FOLDERLIST}
											<option value="{$folder}" >{$folder}</option>
										{/foreach}
									</select>
								</th>
								<th colspan="2" class="narrowWidthType">
						<div class="pull-right">
							{vtranslate('LBL_Search',$MODULE)}
							&nbsp;<input type="text" id='search_txt' class='small' value="{$QUERY}" style="margin-bottom:0px !important;"/>
							&nbsp;<img id="jscal_trigger_fval" width="20" align="absmiddle" height="20" src="" style="display:none">
							{vtranslate('LBL_IN',$MODULE)}
							&nbsp;<select style="width:auto; margin-bottom: 0px !important;" id="search_type" onchange="MailManager.addRequiredElements()" style="margin-bottom:0px !important;">
								{foreach item=arr key=option from=$SEARCHOPTIONS}
									{if $arr eq $TYPE}
										<option value="{$arr}" selected >{$option|getTranslatedString}</option>
									{else}
										<option value="{$arr}" >{$option|getTranslatedString}</option>
									{/if}
								{/foreach}
							</select>
								&nbsp;<input type=submit class="crmbutton small edit" onclick="MailManager.search_mails('{$FOLDER->name()}');" value="{vtranslate('LBL_FIND',$MODULE)}" id="mm_search" style="margin-bottom:0px !important;"/>
						</div>
						</th>
						</tr>
						</thead>
						<tbody>
							{if $FOLDER->mails()}
							{foreach item=MAIL from=$FOLDER->mails()}
								<tr class="listViewEntries {if $MAIL->isRead()}mm_normal{else}fontBold{/if} mm_clickable"
									id="_mailrow_{$MAIL->msgNo()}" onmouseover='MailManager.highLightListMail(this);' onmouseout='MailManager.unHighLightListMail(this);'>
									<td width="3%" class="narrowWidthType"><input type='checkbox' value = "{$MAIL->msgNo()}" name = 'mc_box' class='small'
																				  onclick='MailManager.toggleSelectMail(this.checked, this);'></td>
									<td width="27%" class="narrowWidthType" onclick="MailManager.mail_open('{$FOLDER->name()}', {$MAIL->msgNo()});">{$MAIL->from(30)}</td>
									<td class="narrowWidthType" onclick="MailManager.mail_open('{$FOLDER->name()}', {$MAIL->msgNo()});">{$MAIL->subject()}</td>
									<td width="17%" class="narrowWidthType" align="right" onclick="MailManager.mail_open('{$FOLDER->name()}', {$MAIL->msgNo()});">{$MAIL->date(true)}</td>
								</tr>
							{/foreach}
							{else}
								<tr>
									<td>&nbsp;</td><td>&nbsp;</td>
									<td><b>{vtranslate('LBL_No_Mails_Found',$MODULE)}</b></td>
								</tr>
							{/if}

						</tbody>
					</table>
				</div>
			</div>
	</div>

{/strip}