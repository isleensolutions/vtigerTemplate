{assign var="COMMENT_TEXTAREA_DEFAULT_ROWS" value="2"}

<div class="commentContainer" style="float:left;width:100%;">
	<div class="commentTitle row-fluid chat-form" style="float:left;width:100%;margin-bottom:10px;">
		<div class="addCommentBlock" style="float:left;width:100%;">
			<div class="">
				<textarea name="commentcontent" class="commentcontent form-control"  placeholder="{vtranslate('LBL_ADD_YOUR_COMMENT_HERE', $MODULE_NAME)}" rows="{$COMMENT_TEXTAREA_DEFAULT_ROWS}" style="width: 100%;margin-bottom:15px"></textarea>
			</div>
			<div class="pull-right">
				<button class="btn detailViewSaveComment" type="button" data-mode="add"><strong>{vtranslate('LBL_POST', $MODULE_NAME)}</strong></button>
			</div>
		</div>
	</div>
	<div class="commentsBody timeline-messages" style="float:left;width:100%;">
		{if !empty($COMMENTS)}
			{foreach key=index item=COMMENT from=$COMMENTS}
				<div class="commentDetails">
					<div class="commentDiv">
						<div class="singleComment msg-time-chat">
							<div class="commentInfoHeader row-fluid" data-commentid="{$COMMENT->getId()}" data-parentcommentid="{$COMMENT->get('parent_comments')}">
								<div class="commentTitle">
									{assign var=PARENT_COMMENT_MODEL value=$COMMENT->getParentCommentModel()}
									{assign var=CHILD_COMMENTS_MODEL value=$COMMENT->getChildComments()}
									{assign var=COMMENTOR value=$COMMENT->getCommentedByModel()}
									<a href="#" class="message-img"><img class="avatar" src="libraries/isleen/img/avatar-mini.jpg" alt=""></a>
                                      <div class="message-body msg-in">
                                          <span class="arrow"></span>
                                          <div class="text">
                                              <p class="attribution"><a href="#">{$COMMENTOR->getName()}</a> at <small title="{Vtiger_Util_Helper::formatDateTimeIntoDayString($COMMENT->getCommentedTime())}">{Vtiger_Util_Helper::formatDateDiffInStrings($COMMENT->getCommentedTime())}</small></p>
                                              <div class="commentInfoContent"><p>{nl2br($COMMENT->get('commentcontent'))}</p></div>
                                          </div>
                                      </div>
								</div>
							</div>
							<div class="row-fluid commentActionsContainer">
								<div class="row-fluid">
									<div class="pull-right commentActions">
										<span>
											<a class="cursorPointer replyComment feedback">
												<i class="fa fa-reply"></i>{vtranslate('LBL_REPLY',$MODULE_NAME)}
											</a>
											{if $CURRENTUSER->getId() eq $COMMENT->get('userid')}
												&nbsp;<span>|</span>&nbsp;
												<a class="cursorPointer editComment feedback">
													{vtranslate('LBL_EDIT',$MODULE_NAME)}
												</a>
											{/if}
										</span>
										<span>
											{if $PARENT_COMMENT_MODEL neq false or $CHILD_COMMENTS_MODEL neq null}
												&nbsp;<span>|</span>&nbsp;
												<a href="javascript:void(0);" class="cursorPointer detailViewThread">{vtranslate('LBL_VIEW_THREAD',$MODULE_NAME)}</a>
											{/if}
										</span>
									</div>
								</div>
								{assign var="REASON_TO_EDIT" value=$COMMENT->get('reasontoedit')}
								<div class="row-fluid"  name="editStatus">
									<div class="row-fluid pushUpandDown2per">
										<span class="col-md-6{if empty($REASON_TO_EDIT)} hide{/if}">
											[ {vtranslate('LBL_EDIT_REASON',$MODULE_NAME)} ] : <span  name="editReason" class="textOverflowEllipsis">{nl2br($REASON_TO_EDIT)}</span>
										</span>
										{if $COMMENT->getCommentedTime() neq $COMMENT->getModifiedTime()}
											<span class="{if empty($REASON_TO_EDIT)}row-fluid{else} col-md-6{/if}">
												<span class="pull-right">
													<p class="muted"><em>{vtranslate('LBL_MODIFIED',$MODULE_NAME)}</em>&nbsp;<small title="{Vtiger_Util_Helper::formatDateTimeIntoDayString($COMMENT->getModifiedTime())}" class="commentModifiedTime">{Vtiger_Util_Helper::formatDateDiffInStrings($COMMENT->getModifiedTime())}</small></p>
												</span>
											</span>
										{/if}
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			{/foreach}
		{else}
			{include file="NoComments.tpl"|@vtemplate_path}
		{/if}
	</div>
	{if $PAGING_MODEL->isNextPageExists()}
		<div class="row-fluid">
			<div class="pull-right">
				<a href="javascript:void(0)" class="moreRecentComments">{vtranslate('LBL_MORE',$MODULE_NAME)}..</a>
			</div>
		</div>
	{/if}
	<div class="hide basicAddCommentBlock">
		<div class="row-fluid">
			<span class="col-md-1">&nbsp;</span>
			<div class="col-md-11">
				<textarea class="commentcontenthidden fullWidthAlways form-control" name="commentcontent" rows="{$COMMENT_TEXTAREA_DEFAULT_ROWS}" placeholder="{vtranslate('LBL_ADD_YOUR_COMMENT_HERE', $MODULE_NAME)}" style="margin: 10px;"></textarea>
			</div>
		</div>
		<div class="pull-right">
			<button class="btn btn-success detailViewSaveComment" type="button" data-mode="add"><strong>{vtranslate('LBL_POST', $MODULE_NAME)}</strong></button>
			<a class="cursorPointer closeCommentBlock cancelLink" type="reset">{vtranslate('LBL_CANCEL', $MODULE_NAME)}</a>
		</div>
	</div>
	<div class="hide basicEditCommentBlock" style="min-height: 150px;">
		<div class="row-fluid">
			<span class="col-md-1">&nbsp;</span>
			<div class="col-md-11">
				<input type="text" name="reasonToEdit" placeholder="{vtranslate('LBL_REASON_FOR_CHANGING_COMMENT', $MODULE_NAME)}" class="input-block-level commentcontenthidden form-control"/>
			</div>
		</div>
		<div class="row-fluid">
			<span class="col-md-1">&nbsp;</span>
			<div class="col-md-11">
				<textarea class="commentcontenthidden fullWidthAlways form-control 2" name="commentcontent" rows="{$COMMENT_TEXTAREA_DEFAULT_ROWS}"></textarea>
			</div>
		</div>
		<div class="pull-right">
			<button class="btn btn-success detailViewSaveComment" type="button" data-mode="edit"><strong>{vtranslate('LBL_POST', $MODULE_NAME)}</strong></button>
			<a class="cursorPointer closeCommentBlock cancelLink" type="reset">{vtranslate('LBL_CANCEL', $MODULE_NAME)}</a>
		</div>
	</div>
</div>
{/strip}