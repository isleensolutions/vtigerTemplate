<div class="modelContainer" id="commentWidget">
	<div class="modal-header contentsBackground">
        <button data-dismiss="modal" class="close" title="{vtranslate('LBL_CLOSE')}">&times;</button>
		<h3>{vtranslate('LBL_MAILMANAGER_ADD_ModComments', 'MailManager')}</h3>
	</div>
	<div class="modal-body tabbable">
		<textarea class="input-block-level" name="commentcontent" data-validation-engine="validate[required]" id="commentcontent" placeholder="{vtranslate('LBL_WRITE_YOUR_COMMENT_HERE', 'MailManager')}"></textarea>
	</div>
	<input type=hidden name="_mlinkto" value="{$PARENT}">
	<input type=hidden name="_mlinktotype" value="{$LINKMODULE}">
	<input type=hidden name="_msgno" value="{$MSGNO}">
	<input type=hidden name="_folder" value="{$FOLDER}">
	{include file='ModalFooter.tpl'|@vtemplate_path:$MODULE}
</div>
