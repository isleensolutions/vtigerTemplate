{strip}
{assign var="totalCount" value=0}
{assign var="totalModulesSearched" value=count($MATCHING_RECORDS)}
{foreach key=module item=searchRecords from=$MATCHING_RECORDS}
    {assign var=modulesCount value=count($searchRecords)}
    {assign var="totalCount" value=$totalCount+$modulesCount}
{/foreach}
<div class="modal globalSearchResults">	
		<div class="modal-header highlightedHeader">
			<div class="row-fluid">
				<span class="col-md-12"><strong>{vtranslate('LBL_SEARCH_RESULTS',$MODULE)}&nbsp;({$totalCount})</strong></span>
				{if $IS_ADVANCE_SEARCH }
				<span class="col-md-12">
					<span class="pull-right">
						<a href="javascript:void(0);" id="showFilter">{vtranslate('LBL_SAVE_MODIFY_FILTER',$MODULE)}</a>
					</span>
				</span>
				{/if}
			</div>
		</div>
		<div class="modal-body globalSearchBody">
			{if $totalCount eq 100}
				<div class='alert alert-block'>
					<button type=button class="close" data-dismiss="alert">&times;</button>
					{if $SEARCH_MODULE}
						{vtranslate('LBL_GLOBAL_SEARCH_MAX_MESSAGE_FOR_MODULE', 'Vtiger')}
					{else}
						{vtranslate('LBL_GLOBAL_SEARCH_MAX_MESSAGE', 'Vtiger')}
					{/if}
				</div>
			{/if}
		{foreach key=module item=searchRecords from=$MATCHING_RECORDS name=matchingRecords}
			{assign var="modulesCount" value=count($searchRecords)}
			<label class="clearfix FloatWidth">
				<strong>{vtranslate($module)}&nbsp;({$modulesCount})</strong>
				{if {$smarty.foreach.matchingRecords.index+1} eq 1}
					<span class="pull-right"><p class="muted">{vtranslate('LBL_CREATED_ON', $MODULE)}</small></p></span>
				{/if}
			</label>
			<ul class="nav FloatWidth">
			{foreach item=recordObject from=$searchRecords name=globalSearch}
				{assign var="ID" value="{$module}_globalSearch_row_{$smarty.foreach.globalSearch.index+1}"}
				{assign var=DETAILVIEW_URL value=$recordObject->getDetailViewUrl()}
				<li id="{$ID}">
					<a target="_blank" id="{$ID}_link" class="cursorPointer" {if stripos($DETAILVIEW_URL, 'javascript:')===0} 
							onclick='{$DETAILVIEW_URL|substr:strlen("javascript:")}' {else} onclick='window.location.href="{$DETAILVIEW_URL}"' {/if}>{$recordObject->getName()}
						<span id="{$ID}_time" class="pull-right" title="{Vtiger_Util_Helper::formatDateTimeIntoDayString($recordObject->get('createdtime'))}">{Vtiger_Util_Helper::formatDateDiffInStrings($recordObject->get('createdtime'))}</span>
					</a>
				</li>
			{foreachelse}
				<li>{vtranslate('LBL_NO_RECORDS', $module)}</li>
			{/foreach}
			</ul>
		{/foreach}
		</div>	
	
</div>
{/strip}
