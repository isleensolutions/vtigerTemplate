<section id="main-content">
	<section class="wrapper">
		<div class="mail-box">
			<aside class="sm-side">
				<div class="user-head FloatWidth">
                    <a href="javascript:;" class="inbox-avatar">
                        {assign var=CURRENT_USER_MODEL value=Users_Record_Model::getCurrentUserModel()}
                        {foreach key=ITER item=IMAGE_INFO from=$CURRENT_USER_MODEL->getImageDetails()}
                            {if !empty($IMAGE_INFO.path) && !empty({$IMAGE_INFO.orgname})}
    	                    <img alt="" src="{$IMAGE_INFO.path}_{$IMAGE_INFO.orgname}" style="height:50px;width:100%;">
                            {else}
                            <img src="{vimage_path('default_user.jpg')}" alt="" title="" data-image-id=""style="height:20px">
                            {/if}
                        {/foreach}
                    </a>
                <div class="user-name">
                    {if empty($title)}
					{assign var=title value=$USER_MODEL->get('last_name')}
					{/if}
					{if $MAILBOX && $MAILBOX->exists()}
                    <h5><a href="#">{$title}</a></h5>
                    <span><a href="#" style="font-size: 11px; word-wrap: break-word;">{$USER_MODEL->get('email1')}</a></span>
					{/if}
                </div>
                    <a href="javascript:;" class="mail-dropdown pull-right">
                     	<i class="fa fa-chevron-down"></i>
                    </a>
                 </div>
				
				<div id="_quicklinks_mainuidiv_" class="FloatWidth">
						{include file="modules/MailManager/MainuiQuickLinks.tpl"}
					<div id='_folderprogress_' style='float: right; display: none; position: absolute;left: 260px; font-weight: bold;'>
						<span>{vtranslate('JSLBL_LOADING_FOLDERS', $MODULE)}</span>
						<img src="{'MnyxU.gif'|@vimage_path}" border='0' align='absmiddle' style="width:40px">
					</div>
					<div class="inbox-body FloatWidth">
						<div id="_mainfolderdiv_"></div>
					</div>
				</div>
                 
			</aside>
			<aside class="lg-side">
				<div class="panel-body" style="padding-top:0;">
					<div id='_progress_' style='float: right; display: none; position: absolute; right: 35px; font-weight: bold;'>
						<span id='_progressmsg_'>...</span>
						<img src="{'vtbusy.gif'|@vimage_path}" border='0' align='absmiddle'>
					</div>

					<span id="_messagediv_">{if $ERROR}<p>{$ERROR}</p>{/if}</span>
					<div id="_contentdiv_"></div>
					<div id="_contentdiv2_"></div>
					<div id="_settingsdiv_" class="FloatWidth"></div>
					<div id="_relationpopupdiv_" style="display:none;position:absolute;width:800px;z-index:80000;"></div>
					<div id="_replydiv_" style="display:none;"></div>
					<div id="replycontentdiv" style="display:none;"></div>
					<div id = '__vtiger__'></div>
				</div>
			</aside>
		</div>
	</section>
</section>
<script type='text/javascript'>
	{literal}
	jQuery(function(){MailManager.mainui()});
	{/literal}
</script>
<input type="hidden" name="module" value="MailManager">

