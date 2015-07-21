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
<div class="commentDiv">
	<div class="singleComment msg-time-chat">
		<div class="commentInfoHeader row-fluid" data-commentid="{$COMMENT->getId()}" data-parentcommentid="{$COMMENT->get('parent_comments')}">
			<div class="commentTitle" id="{$COMMENT->getId()}">
				{assign var=PARENT_COMMENT_MODEL value=$COMMENT->getParentCommentModel()}
				{assign var=CHILD_COMMENTS_MODEL value=$COMMENT->getChildComments()}
				{assign var=IMAGE_PATH value=$COMMENT->getImagePath()}
				{assign var=COMMENTOR value=$COMMENT->getCommentedByModel()}
				<a href="#" class="message-img"  style="float:left;margin-right: 4%;width: 6%;">
					{*<!--<img class="avatar" src="libraries/isleen/img/avatar-mini.jpg" alt="">-->*}
				<img class="avatar" src="{if !empty($IMAGE_PATH)}{$IMAGE_PATH}{else}{vimage_path('default_user.jpg')}{/if}"</a>
				<div class="row-fluid message-body msg-in" style="float: left;margin: 0;width: 90%;">
					<span class="arrow"></span>
					<div class="text FloatWidth">
						<p class="attribution">
							<a href="#">{$COMMENTOR->getName()}</a> at <small title="{Vtiger_Util_Helper::formatDateTimeIntoDayString($COMMENT->getCommentedTime())}">{Vtiger_Util_Helper::formatDateDiffInStrings($COMMENT->getCommentedTime())}</small>
						</p>						
						<div class="col-md-11 commentorInfo">							
							<div class="inner">
								<div class="clearfix"></div>
							</div>
							<div class="commentInfoContent">
								{nl2br($COMMENT->get('commentcontent'))}
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row-fluid commentActionsContainer">
			<div class="row-fluid commentActionsDiv">
				<div class="pull-right commentActions">
					{if $CHILDS_ROOT_PARENT_MODEL}
						{assign var=CHILDS_ROOT_PARENT_ID value=$CHILDS_ROOT_PARENT_MODEL->getId()}
					{/if}
					<span>
						<a class="cursorPointer replyComment"><i class="fa fa-reply"></i>{vtranslate('LBL_REPLY',$MODULE_NAME)}</a>
						{if $CURRENTUSER->getId() eq $COMMENT->get('userid')}
							&nbsp;<span style="color:black">|</span>&nbsp;
							<a class="cursorPointer editComment feedback">{vtranslate('LBL_EDIT',$MODULE_NAME)}
							</a>
						{/if}
					</span>
					{assign var=CHILD_COMMENTS_COUNT value=$COMMENT->getChildCommentsCount()}
					{if $CHILD_COMMENTS_MODEL neq null and ($CHILDS_ROOT_PARENT_ID neq $PARENT_COMMENT_ID)}
						&nbsp;<span style="color:black">|</span>&nbsp;
						<span class="viewThreadBlock" data-child-comments-count="{$COMMENT->getChildCommentsCount()}">
							<a class="cursorPointer viewThread">
								<span class="childCommentsCount">{$COMMENT->getChildCommentsCount()}</span>&nbsp;{if $CHILD_COMMENTS_COUNT eq 1}{vtranslate('LBL_REPLY',$MODULE_NAME)}{else}{vtranslate('LBL_REPLIES',$MODULE_NAME)}{/if}
								<img class="alignMiddle" src="{vimage_path('rightArrowSmall.png')}" />
							</a>
						</span>
						<span class="hide hideThreadBlock" data-child-comments-count="{$COMMENT->getChildCommentsCount()}">
							<a class="cursorPointer hideThread">
								<span class="childCommentsCount">{$COMMENT->getChildCommentsCount()}</span>&nbsp;{if $CHILD_COMMENTS_COUNT eq 1}{vtranslate('LBL_REPLY',$MODULE_NAME)}{else}{vtranslate('LBL_REPLIES',$MODULE_NAME)}{/if}
								<img class="alignMiddle" src="{vimage_path('downArrowSmall.png')}" />
							</a>
						</span>

					{elseif $CHILD_COMMENTS_MODEL neq null and ($CHILDS_ROOT_PARENT_ID eq $PARENT_COMMENT_ID)}
						&nbsp;<span style="color:black">|</span>&nbsp;
						<span class="viewThreadBlock" style="display:none;" data-child-comments-count="{$COMMENT->getChildCommentsCount()}">
							<a class="cursorPointer viewThread 1">
								<span class="childCommentsCount">{$COMMENT->getChildCommentsCount()}</span>&nbsp;{if $CHILD_COMMENTS_COUNT eq 1}{vtranslate('LBL_REPLY',$MODULE_NAME)}{else}{vtranslate('LBL_REPLIES',$MODULE_NAME)}{/if}
								<img class="alignMiddle" src="{vimage_path('rightArrowSmall.png')}" />
							</a>
						</span>
						<span class="hideThreadBlock" data-child-comments-count="{$COMMENT->getChildCommentsCount()}">
							<a class="cursorPointer hideThread">
								<span class="childCommentsCount">{$COMMENT->getChildCommentsCount()}</span>&nbsp;{if $CHILD_COMMENTS_COUNT eq 1}{vtranslate('LBL_REPLY',$MODULE_NAME)}{else}{vtranslate('LBL_REPLIES',$MODULE_NAME)}{/if}
								<img class="alignMiddle" src="{vimage_path('downArrowSmall.png')}" />
							</a>
						</span>
					{/if}
				</div>
			</div>
			{assign var="REASON_TO_EDIT" value=$COMMENT->get('reasontoedit')}
			<div class="row-fluid"  name="editStatus">
				<div class="row-fluid pushUpandDown2per">
					<span class="{if empty($REASON_TO_EDIT)}hide{/if} col-md-6">
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
<div class="FloatWidth">
{/strip}

