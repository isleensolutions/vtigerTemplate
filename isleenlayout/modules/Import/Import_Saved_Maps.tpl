
<select name="saved_maps" id="saved_maps" class="font-x-small chzn-select" onchange="ImportJs.loadSavedMap();">
	<option id="-1" value="" selected>--{'LBL_SELECT_SAVED_MAPPING'|@vtranslate:$MODULE}--</option>
	{foreach key=_MAP_ID item=_MAP from=$SAVED_MAPS}
	<option id="{$_MAP_ID}" value="{$_MAP->getStringifiedContent()}">{$_MAP->getValue('name')}</option>
	{/foreach}
</select>
<span id="delete_map_container" style="display:none;">
	<i class="fa fa-trash-o cursorPointer" onclick="ImportJs.deleteMap('{$FOR_MODULE}');" alt="{'LBL_DELETE'|@vtranslate:$FOR_MODULE}"></i>
</span>