{if $MAILBOX && $MAILBOX->exists()}
			<input type=hidden name="mm_selected_folder" id="mm_selected_folder">
			<input type="hidden" name="_folder" id="mailbox_folder">
			<div class="inbox-body">
			<a class="btn btn-compose" href="javascript:void(0);" onclick="MailManager.mail_compose();">{vtranslate('LBL_Compose','MailManager')}</a>
			</div>


						<ul class="inbox-nav inbox-divider">
							<li>
								<a href='#Reload' id="_mailfolder_mm_reload" onclick="MailManager.reload_now();"><i class="fa fa-refresh"></i>{vtranslate('LBL_Refresh','MailManager')}</a>
							</li>
							<li>
								<a href='#Settings' id="_mailfolder_mm_settings" onclick="MailManager.open_settings();"><i class="fa fa-cog"></i>{vtranslate('JSLBL_Settings','MailManager')}</a>
							</li>
							<li>
								<a href="#Drafts" id="_mailfolder_mm_drafts" onclick="MailManager.folder_drafts(0);"><i class="fa fa-external-link"></i>{vtranslate('LBL_Drafts','MailManager')}</a>
							</li>
						</ul>
{/if}
