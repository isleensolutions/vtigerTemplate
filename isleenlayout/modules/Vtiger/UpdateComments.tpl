{strip}
<div class="fb-status-container fb-border fb-gray-bg">
{if !empty($COMMENTS)}
	<ul class="fb-comments">
		{foreach key=index item=COMMENT from=$COMMENTS}
		{assign var=COMMENTOR value=$COMMENT->getCommentedByModel()}
			<li>
				<a href="#" class="cmt-thumb">
                	{foreach key=ITER item=IMAGE_INFO from=$COMMENTOR->getImageDetails()}
										{if !empty($IMAGE_INFO.path) && !empty($IMAGE_INFO.orgname)}
											<img src="{$IMAGE_INFO.path}_{$IMAGE_INFO.orgname}" alt="{$IMAGE_INFO.orgname}" title="{$IMAGE_INFO.orgname}" data-image-id="{$IMAGE_INFO.id}">
										{else}
											<img src="{vimage_path('default_user.jpg')}" alt="" title="" data-image-id="">
										{/if}
									{/foreach}
                </a>
				<div class="cmt-details">
                        <a href="#">{$COMMENTOR->getName()}</a>
                      	<span>{nl2br($COMMENT->get('commentcontent'))}</span>
                   		<p title="{Vtiger_Util_Helper::formatDateTimeIntoDayString($COMMENT->getCommentedTime())}">{Vtiger_Util_Helper::formatDateDiffInStrings($COMMENT->getCommentedTime())}</p>
               	</div>
			</li>
		{/foreach}
	</ul>
{else}
	 {vtranslate('LBL_NO_COMMENTS',$MODULE_NAME)}
{/if}
</div>
{/strip}