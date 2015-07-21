{strip}
	<div class="tagsContainer" id="tagCloud">
		{foreach from=$TAGS[1] item=TAG_ID key=TAG_NAME}
			<a class="tagName cursorPointer" data-tagid="{$TAG_ID}" rel="{$TAGS[0][$TAG_NAME]}">{$TAG_NAME}</a>&nbsp;		
		{/foreach}
	</div>
{/strip}
