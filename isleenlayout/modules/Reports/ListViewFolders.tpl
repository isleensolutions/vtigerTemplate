{strip}
<span class="customFilterMainSpan btn-group">
	<select id="customFilter"  style="width:350px;">
		<optgroup id="foldersBlock" label="{vtranslate('LBL_FOLDERS', $MODULE)}">
			<option value="All">{vtranslate('LBL_ALL_REPORTS', $MODULE)}</option>
			{foreach item=FOLDER from=$FOLDERS}
				<option  data-editurl="{$FOLDER->getEditUrl()}" id="filterOptionId_{$FOLDER->getId()}" class="filterOptionId_{$FOLDER->getId()}" data-deletable="{$FOLDER->isDeletable()}" data-editable="{$FOLDER->isEditable()}" data-deleteurl="{$FOLDER->getDeleteUrl()}" value="{$FOLDER->getId()}" data-id="{$FOLDER->getId()}" {if $VIEWNAME eq $FOLDER->getId()}selected=""{/if}>{vtranslate($FOLDER->getName(), $MODULE)}</option>
			{/foreach}
		</optgroup>
	</select>
</span>
<span class="hide filterActionImages pull-right">
	<i title="{vtranslate('LBL_DELETE', $MODULE)}" data-value="delete" class="fa fa-trash-o alignMiddle deleteFilter filterActionImage pull-right"></i>
	<i title="{vtranslate('LBL_EDIT', $MODULE)}" data-value="edit" class="fa fa-pencil alignMiddle editFilter filterActionImage pull-right"></i>
</span>
{/strip}
