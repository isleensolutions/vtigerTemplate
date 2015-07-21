{strip}
<div class="inbox-head row">	
	<h3>View Mail</h3>
	<span class="btn-group pull-right">
		{if $MAIL->msgno() < $FOLDER->count()}
		<button class="btn" onclick="MailManager.mail_open( '{$FOLDER->name()}', {$MAIL->msgno(1)} );">
			<span class="fa fa-angle-left"></span>
		</button>
		{/if}
		{if $MAIL->msgno() > 1}
		<button class="btn" onclick="MailManager.mail_open( '{$FOLDER->name()}', {$MAIL->msgno(-1)} );">
			<span class="fa fa-angle-right"></span>
		</button>
		{/if}
	</span>
</div>
<div class="inbox-body row">
	<div id="open_email_con" name="open_email_con">
		<div class="heading-inbox row">
	        <div class="col-md-8">
	            <div class="compose-btn">
	            	<button class="btn btn-primary" onclick="MailManager.mail_close();">{$FOLDER->name()}</button>&nbsp;
	                <button class="btn" onclick="MailManager.mail_reply(true);"><i class="fa fa-reply"></i>&nbsp;{vtranslate('LBL_Reply_All',$MODULE)}</button>&nbsp;
	                <button title="" data-placement="top" onclick="MailManager.mail_print();" data-toggle="tooltip" type="button" data-original-title="Print" class="btn tooltips">
	                <i class="fa fa-print"></i>
	                </button>&nbsp;
	                <button title="" data-placement="top" onclick="MailManager.maildelete('{$FOLDER->name()}',{$MAIL->msgno()},true);" data-toggle="tooltip" data-original-title="Trash" class="btn tooltips small" id = 'mail_delete_dtlview'>&nbsp;
	                	<i class="fa fa-trash-o"></i>
	                </button>&nbsp;
	                <button class="btn" onclick="MailManager.mail_reply(false);">{vtranslate('LBL_Reply',$MODULE)}</button>&nbsp;
					<button class="btn" onclick="MailManager.mail_forward({$MAIL->msgno()});">{vtranslate('LBL_Forward',$MODULE)}</button>&nbsp;
					<button class="btn" onclick="MailManager.mail_mark_unread('{$FOLDER->name()}', {$MAIL->msgno()});">{vtranslate('LBL_Mark_As_Unread',$MODULE)}</button>
	            </div>

	        </div>
	       	<div class="col-md-4 text-right">
	            <p class="date"> {$MAIL->date()}</p>
	        </div>
	        <div class="col-md-12">
	            <h4>{$MAIL->subject()}</h4>
	        </div>
	    </div>
		<div class="row-fluid FloatWidth">
			<div class="col-md-12 paddingLeftRight">
				<div class="contents">
					<div class="row-fluid">
						<div class="col-md-7">
							<div class="summaryWidgetContainer">
								<span id="_mailopen_msgid_" style="display:none;">{$MAIL->_uniqueid|@escape:'UTF-8'}</span>

								<table width="100%" cellpadding=2 cellspacing=0 border=0 class="small">
								<tr>
									<td width="100px" align=right>{'LBL_FROM'|@getTranslatedString}:</td>
									<td id="_mailopen_from">
										{foreach item=SENDER from=$MAIL->from()}
											{$SENDER}
										{/foreach}
									</td>
								</tr>
								{if $MAIL->to()}
								<tr>
									<td width="100px" align=right>{vtranslate('LBL_TO',$MODULE)}:</td>
									<td id="_mailopen_to">
										{foreach item=RECEPIENT from=$MAIL->to() name="TO"}
											{if $smarty.foreach.TO.index > 0}, {/if}{$RECEPIENT}
										{/foreach}
									</td>
								</tr>
								{/if}

								{if $MAIL->cc()}
								<tr>
									<td width="100px" align=right>{vtranslate('LBL_CC',$MODULE)}:</td>
									<td id="_mailopen_cc">
										{foreach item=CC from=$MAIL->cc() name="CC"}
											{if $smarty.foreach.CC.index > 0}, {/if}{$CC}
										{/foreach}
									</td>
								</tr>
								{/if}

								{if $MAIL->bcc()}
								<tr>
									<td width="100px" align=right>{vtranslate('LBL_BCC',$MODULE)}:</td>
									<td id="_mailopen_bcc">
										{foreach item=BCC from=$MAIL->bcc() name="BCC"}
											{if $smarty.foreach.BCC.index > 0}, {/if}{$BCC}
										{/foreach}
									</td>
								</tr>
								{/if}

								<tr>
									<td width="100px" align=right>{vtranslate('LBL_Date',$MODULE)}:</td>
									<td id="_mailopen_date">{$MAIL->date()}</td>
								</tr>
								
								{if $ATTACHMENTS}
								<tr>
									<td width="100px" align=right>{vtranslate('LBL_Attachments',$MODULE)}:</td>
									<td>
										{foreach item=ATTACHVALUE key=ATTACHNAME from=$ATTACHMENTS name="attach"}
											{if $INLINE_ATT[$ATTACHNAME] eq null}
											<img border=0 src="{'attachments.gif'|@vimage_path}">
											<a href="index.php?module={$MODULE}&action={$MODULE}Ajax&file=index&_operation=mail&_operationarg=attachment_dld&_muid={$MAIL->muid()}&_atname={$ATTACHNAME|@escape:'htmlall':'UTF-8'}">{$ATTACHNAME}</a>
											&nbsp;
											{/if}
										{/foreach}
											<input type="hidden" id="_mail_attachmentcount_" value="{$smarty.foreach.attach.total}" >
									</td>
								</tr>
								{/if}
								</table>
							</div>
						</div>
						<div class="col-md-5">
							<div class="summaryWidgetContainer">
								{vtranslate('LBL_RELATED_RECORDS',$MODULE)}
								<button class="small" id="_mailrecord_findrel_btn_" onclick="MailManager.mail_find_relationship();">{vtranslate('JSLBL_Find_Relation_Now',$MODULE)}</button>
								<div id="_mailrecord_relationshipdiv_"></div>
							</div>
						</div>
					</div>
					<table class="table table-bordered equalSplit detailview-table">
						<tbody>
							<tr>
								<td>
									<div class='mm_body' id="_mailopen_body">
									{$MAIL->body()}
									</div>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
</div>
</div>
{/strip}
