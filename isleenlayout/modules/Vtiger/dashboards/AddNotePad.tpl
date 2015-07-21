{strip}
	<div id="addNotePadWidgetContainer" class='modelContainer FloatWidth'>
		<div class="modal-header contentsBackground">
            <button data-dismiss="modal" class="close" title="{vtranslate('LBL_CLOSE')}">&times;</button>
			<h3 id="massEditHeader">{vtranslate('LBL_ADD', $MODULE)} {vtranslate('LBL_NOTEPAD', $MODULE)}</h3>
		</div>
		<form class="form-horizontal col-md-12">
			 <div class="control-group margin0px padding1per form-group">
				<label class="control-label col-md-4">{vtranslate('LBL_NOTEPAD_NAME', $MODULE)}<span class="redColor">*</span> </label>
				<div class="controls col-md-8">
					<input type="text" name="notePadName" class="input-large form-control" data-validation-engine="validate[required]" />
				</div>
			</div>
			<div class="control-group margin0px padding1per">
				<label class="control-label col-md-4">{vtranslate('LBL_NOTEPAD_CONTENT', $MODULE)}</label>
				<div class="controls col-md-8">
					<textarea class=" form-control" type="text" name="notePadContent" style="min-height: 100px;resize: none;"/>
				</div>
			</div>
				{include file='ModalFooter.tpl'|@vtemplate_path:$MODULE}
		</form>
	</div>
{/strip}
