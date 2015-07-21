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
		<div class="listViewTopMenuDiv noprint">
			<div class="listViewActionsDiv row-fluid">
				<span class="btn-toolbar span4" id="mail_fldrname">
					<strong>{$FOLDER->name()}</strong>
				</span>
				<span class="btn-toolbar span4">
					&nbsp;
				</span>asdfasdf
				<span class="btn-toolbar span4">
					<span class="pull-right listViewActions">
						{if $FOLDER->mails()}
							<span class="pageNumbers alignTop">
								{$FOLDER->pageInfo()}
							</span>
							<span class="btn-group alignTop">

									<span class="btn-group">
										{if $FOLDER->hasPrevPage()}
											<button class="btn" href="#{$FOLDER->name()}/page/{$FOLDER->pageCurrent(-1)}" onclick="MailManager.folder_drafts({$FOLDER->pageCurrent(-1)});">
												<span class="icon-chevron-left"></span>
											</button>
										{/if}
										{if $FOLDER->hasNextPage()}
											<button class="btn" href="#{$FOLDER->name()}/page/{$FOLDER->pageCurrent(1)}" onclick="MailManager.folder_drafts({$FOLDER->pageCurrent(1)});">
												<span class="icon-chevron-right"></span>
											</button>
										{/if}
									</span>

							</span>
						{/if}
					</span>
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
								&nbsp;<input type=button class='crmbutton small delete' onclick="MailManager.massMailDelete('__vt_drafts');" value="{vtranslate('LBL_Delete',$MODULE)}"/>
							</th>
							<th colspan="2" class="narrowWidthType">
					<div class="pull-right">
						{vtranslate('LBL_Search',$MODULE)}
						&nbsp;<input type="text" id='search_txt' class='small' value="{$QUERY}" />
						{vtranslate('LBL_IN', $MODULE)}
						<select class='small' id="search_type">
							{foreach item=label key=value from=$SEARCHOPTIONS}
								<option value="{$value}" >{vtranslate($label,$MODULE)}</option>
							{/foreach}
						</select>
						&nbsp;<input type=submit class="crmbutton small edit" onclick="MailManager.search_drafts();" value="{vtranslate('LBL_FIND',$MODULE)}" id="mm_search"/>
					</div>
					</th>
					</tr>
					</thead>
					<tbody>
						{if $FOLDER->mails()}
							{foreach item=MAIL from=$FOLDER->mails()}
								<tr class="listViewEntries mm_normal mm_clickable"
									id="_mailrow_{$MAIL.id}" onmouseover='MailManager.highLightListMail(this);' onmouseout='MailManager.unHighLightListMail(this);'>
									<td width="3%" class="narrowWidthType"><input type='checkbox' value = "{$MAIL.id}" name = 'mc_box' class='small'
																				  onclick='MailManager.toggleSelectMail(this.checked, this);'></td>
									<td width="27%" class="narrowWidthType" onclick="MailManager.mail_draft({$MAIL.id});">{$MAIL.saved_toid}</td>
									<td class="narrowWidthType" onclick="MailManager.mail_draft({$MAIL.id});">{$MAIL.subject}</td>
									<td width="17%" class="narrowWidthType" align="right" onclick="MailManager.mail_draft({$MAIL.id});">{$MAIL.date_start}</td>
								</tr>
							{/foreach}
						{elseif $FOLDER->mails() eq null}
							<tr>
								<td>&nbsp;</td><td>&nbsp;</td>
								<td><center><b>{vtranslate('LBL_No_Mails_Found',$MODULE)}</b></center></td>
							</tr>
						{/if}
					</tbody>
				</table>
			</div>
		</div>
	</div>


{/strip}