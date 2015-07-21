{strip}
<div class="inbox-head row">
	<h3>{$FOLDER->name()}</h3>
    <form class="pull-right position" action="#">
    	<div class="input-append">
        	<input type="text"  placeholder="Search Mail" id='search_txt' class='sr-input' value="{$QUERY}">
           	<button type="button" class="btn sr-btn crmbutton small edit" onclick="MailManager.search_mails('{$FOLDER->name()}');" value="{vtranslate('LBL_FIND',$MODULE)}" id="mm_search"><i class="fa fa-search"></i></button>           	
        </div>
   	</form>
</div>
<div class="row inbox-body">
	<div class="mail-option">
		<div class="chk-all">
        	<input type="checkbox" class="mail-checkbox mail-group-checkbox" name="selectall" id="parentCheckBox" onClick='MailManager.toggleSelect(this.checked,"mc_box");' style="float: left;margin: 3px;">
            	<div class="btn-group" >
                	<a class="btn mini all" href="#" data-toggle="dropdown">
                    	All&nbsp;<i class="fa fa-angle-down "></i></b></a>
                    <ul class="dropdown-menu">
                    	<li><a href="#"> None</a></li>
                       	<li><a href="#"> Read</a></li>
                        <li><a href="#"> Unread</a></li>
                	</ul>
              	</div>
		</div>
		<div class="btn-group">
         	<a class="btn crmbutton small delete" href="#"  value="{vtranslate('LBL_Delete',$MODULE)}" onclick="MailManager.massMailDelete('{$FOLDER->name()}');">
            	Delete
         	</a>
     	</div>
		 <div class="btn-group">
         	<a class="btn mini tooltips" href="#" data-toggle="dropdown" data-placement="top" data-original-title="Refresh" onclick="MailManager.reload_now();">
            	<i class=" fa fa-refresh"></i>
         	</a>
     	</div>
		<div class="btn-group hidden-phone">
        	<a class="btn mini blue" href="#" data-toggle="dropdown">
           		More&nbsp;
          		<i class="fa fa-angle-down "></i></b>
        	</a>
            <ul class="dropdown-menu">
            	<li><a href="#"><i class="fa fa-pencil"></i> Mark as Read</a></li>
               	<li><a href="#"><i class="fa fa-ban"></i> Spam</a></li>
                <li class="divider"></li>
                <li><a href="#"><i class="fa fa-angle-down "></i> Delete</a></li>
       		</ul>
  		</div>         
        <select class="form-control" style="width:auto; float: left;background: none repeat scroll 0 0 #FCFCFC;" id="moveFolderList" onchange="MailManager.moveMail(this);">
			<option value="">{vtranslate('LBL_MOVE_TO',$MODULE)}</option>
			{foreach item=folder from=$FOLDERLIST}
				<option value="{$folder}" >{$folder}</option>
			{/foreach}
		</select>
		<div class="unstyled inbox-pagination pull-right">
			{if $FOLDER->mails()}
			<span class="pull-right listViewActions">
				<span class="pageNumbers alignTop pull-left" style="color:#797979;">
				{$FOLDER->pageInfo()}
				</span>			
					<span class="btn-group pull-right">
						{if $FOLDER->hasPrevPage()}
						<a class="btn np-btn" href="#{$FOLDER->name()}/page/{$FOLDER->pageCurrent(-1)}" onclick="MailManager.folder_open('{$FOLDER->name()}', {$FOLDER->pageCurrent(-1)});" style=" padding: 5px 15px;">
							<i class="fa fa-angle-left"></i>
						</a>
						{/if}
						{if $FOLDER->hasNextPage()}
						<a class="btn np-btn" href="#{$FOLDER->name()}/page/{$FOLDER->pageCurrent(1)}" onclick="MailManager.folder_open('{$FOLDER->name()}', {$FOLDER->pageCurrent(1)});" style=" padding: 5px 15px;">
							<i class="fa fa-angle-right"></i>
						</a>
						{/if}
					</span>
				
			</span>				
			{/if}
		</div>
	</div>

	<div class="listViewPageDiv FloatWidth" id="email_con" name="email_con">
		<input type="hidden" id="jscal_dateformat" name="jscal_dateformat" value="yyyy-mm-dd" />			
			<div class="listViewContentDiv FloatWidth">
				<div class="listViewEntriesDiv">
					<table class="table table-inbox table-hover listViewEntriesTable FloatWidth">						
						<tbody>
							{if $FOLDER->mails()}
							{foreach item=MAIL from=$FOLDER->mails()}
								<tr class="listViewEntries {if $MAIL->isRead()}mm_normal{else}fontBold{/if} mm_clickable" id="_mailrow_{$MAIL->msgNo()}" onmouseover='MailManager.highLightListMail(this);' onmouseout='MailManager.unHighLightListMail(this);'>
									<td width="3%" class="narrowWidthType">
										<input type='checkbox' value = "{$MAIL->msgNo()}" name = 'mc_box' class='small'	onclick='MailManager.toggleSelectMail(this.checked, this);'>
									</td>
									<td width="27%" class="narrowWidthType" onclick="MailManager.mail_open('{$FOLDER->name()}', {$MAIL->msgNo()});">{$MAIL->from(30)}</td>
									<td class="narrowWidthType" onclick="MailManager.mail_open('{$FOLDER->name()}', {$MAIL->msgNo()});">{$MAIL->subject()}</td>
									<td class="inbox-small-cells">
									{if $MAIL->isAttachment() eq 'false'}
										<i class=""></i>
									{else}
										<i class="fa fa-paperclip"></i>
									{/if}
									</td>
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
	</div>

{/strip}
