{assign var="COMMENT_TEXTAREA_DEFAULT_ROWS" value="2"}
<section class="panel DetailViewRemoveBorder">
<div class="panel-body">
<div class="commentContainer"  style="float:left;width:100%;">
	<div class="commentTitle row-fluid chat-form"  style="float:left;width:100%;margin-bottom:10px;">
		<div class="addCommentBlock"  style="float:left;width:100%;">
			<div style="margin-bottom:10px;">
				<textarea name="commentcontent" rows="{$COMMENT_TEXTAREA_DEFAULT_ROWS}" class="commentcontent form-control"  placeholder="{vtranslate('LBL_ADD_YOUR_COMMENT_HERE', $MODULE_NAME)}"></textarea>
			</div>
			<div class="pull-right">
				<button class="btn  saveComment" type="button" data-mode="add"><strong>{vtranslate('LBL_POST', $MODULE_NAME)}</strong></button>
			</div>
		</div>
	</div>
	<div class="commentsList commentsBody timeline-messages">
		{include file='CommentsList.tpl'|@vtemplate_path}
	</div>
	<div class="hide basicAddCommentBlock">
		<div class="row-fluid">
			<span class="col-md-1">&nbsp;</span>
			<div class="col-md-11 paddingRight">
				<textarea class="commentcontenthidden fullWidthAlways form-control 3" rows="{$COMMENT_TEXTAREA_DEFAULT_ROWS}" name="commentcontent" placeholder="{vtranslate('LBL_ADD_YOUR_COMMENT_HERE', $MODULE_NAME)}" style="margin:10px 0;"></textarea>
			</div>
		</div>
		<div class="pull-right">
			<button class="btn btn-success saveComment" type="button" data-mode="add"><strong>{vtranslate('LBL_POST', $MODULE_NAME)}</strong></button>
			<a class="cursorPointer closeCommentBlock" type="reset">{vtranslate('LBL_CANCEL', $MODULE_NAME)}</a>
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
				<textarea class="commentcontenthidden fullWidthAlways  form-control 4" name="commentcontent" rows="{$COMMENT_TEXTAREA_DEFAULT_ROWS}"></textarea>
			</div>
		</div>
		<div class="pull-right">
			<button class="btn btn-success saveComment" type="button" data-mode="edit"><strong>{vtranslate('LBL_POST', $MODULE_NAME)}</strong></button>
			<a class="cursorPointer closeCommentBlock cancelLink" type="reset">{vtranslate('LBL_CANCEL', $MODULE_NAME)}</a>
		</div>
	</div>
</div>
</div>
</section>