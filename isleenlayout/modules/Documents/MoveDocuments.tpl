{strip}
	<div id="MoveDocuments" class="modal modelContainer">
		<div class="modal-header">
			<button data-dismiss="modal" class="close" type="button" title="{vtranslate('LBL_CLOSE')}">x</button>
			<h3>{vtranslate('LBL_MOVE', $MODULE)} {vtranslate($MODULE, $MODULE)}</h3>
		</div>
		<form class="form-horizontal contentsBackground" id="moveDocuments" method="post" action="index.php">
			<input type="hidden" name="module" value="{$MODULE}" />
			<input type="hidden" name="action" value="MoveDocuments" />
			<input type="hidden" name="selected_ids" value={ZEND_JSON::encode($SELECTED_IDS)} />
			<input type="hidden" name="excluded_ids" value={ZEND_JSON::encode($EXCLUDED_IDS)} />
			<input type="hidden" name="viewname" value="{$VIEWNAME}" />
            <input type="hidden" name="search_key" value= "{$SEARCH_KEY}" />
            <input type="hidden" name="operator" value="{$OPERATOR}" />
            <input type="hidden" name="search_value" value="{$ALPHABET_VALUE}" />
			<div class="modal-body">
				<div class="row-fluid verticalBottomSpacing">
					<span class="col-md-4">{vtranslate('LBL_FOLDERS_LIST', $MODULE)}<span class="redColor">*</span></span>
					<span class="col-md-8 row-fluid">
						<select class="chzn-select col-md-11" name="folderid">
							<optgroup label="{vtranslate('LBL_FOLDERS', $MODULE)}">
								{foreach item=FOLDER from=$FOLDERS}
									<option value="{$FOLDER->getId()}">{$FOLDER->getName()}</option>
								{/foreach}
							</optgroup>
						</select>
					</span>
				</div>
			</div>
			{include file='ModalFooter.tpl'|@vtemplate_path:$MODULE}
		</form>
	</div>
{/strip}