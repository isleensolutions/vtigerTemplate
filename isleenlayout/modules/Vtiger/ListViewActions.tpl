{strip}
	<span class="pull-right listViewActions">
        {if (method_exists($MODULE_MODEL,'isPagingSupported') && ($MODULE_MODEL->isPagingSupported()  eq true)) || !method_exists($MODULE_MODEL,'isPagingSupported')}
		<span class="pageNumbers alignTop pull-left" data-placement="bottom" >
			{if $LISTVIEW_ENTIRES_COUNT}{$PAGING_MODEL->getRecordStartRange()} {vtranslate('LBL_to', $MODULE)} {$PAGING_MODEL->getRecordEndRange()}{/if}
		</span>
		<span class="btn-group alignTop">
			<span class="btn-group">
				<button class="btn" id="listViewPreviousPageButton" {if !$PAGING_MODEL->isPrevPageExists()} disabled {/if} type="button"><span class="fa fa-chevron-left"></span></button>
					<button class="btn dropdown-toggle" type="button" id="listViewPageJump" data-toggle="dropdown" {if $PAGE_COUNT eq 1} disabled {/if}>
						<i class="fa  fa-files-o" title="{vtranslate('LBL_LISTVIEW_PAGE_JUMP',$moduleName)}"></i>
					</button>
					<ul class="listViewBasicAction dropdown-menu" id="listViewPageJumpDropDown" style="min-width:100%;left: -55px;">
						<li>
							<span class="row-fluid CustomTextAlign">
								<span class=" col-md-3 pushUpandDown2per paddingLeftRight"><span class="listPage">{vtranslate('LBL_PAGE',$moduleName)}</span></span>
								<span class=" col-md-4 paddingLeftRight">
									<input type="text" id="pageToJump" class="listViewPagingInput" value="{$PAGE_NUMBER}" style="width:100%"/>
								</span>
								<span class="col-md-2 textAlignCenter pushUpandDown2per listPage">
									{vtranslate('LBL_OF',$moduleName)}&nbsp;
								</span>
								<span class="col-md-3 pushUpandDown2per listPage" id="totalPageCount">{$PAGE_COUNT}</span>
							</span>
						</li>
					</ul>
				<button class="btn" id="listViewNextPageButton" {if (!$PAGING_MODEL->isNextPageExists()) or ($PAGE_COUNT eq 1)} disabled {/if} type="button"><span class="fa fa-chevron-right"></span></button>&nbsp;
			</span>
		</span>
		
        {/if}
		
	{if $LISTVIEW_LINKS['LISTVIEWSETTING']|@count gt 0}
		<span class="btn-group">
			<button class="btn dropdown-toggle btn-warning" href="#" data-toggle="dropdown"><i class="fa fa-wrench" alt="{vtranslate('LBL_SETTINGS', $MODULE)}" title="{vtranslate('LBL_SETTINGS', $MODULE)}"></i>&nbsp;&nbsp;<i class="caret"></i></button>
			<ul class="listViewSetting dropdown-menu pull-right">
				{foreach item=LISTVIEW_SETTING from=$LISTVIEW_LINKS['LISTVIEWSETTING']}
					<li><a href={$LISTVIEW_SETTING->getUrl()}>{vtranslate($LISTVIEW_SETTING->getLabel(), $MODULE)}</a></li>
				{/foreach}
			</ul>
		</span>
	{/if}
	</span>
	<div class="clearfix"></div>
	<input type="hidden" id="recordsCount" value=""/>
	<input type="hidden" id="selectedIds" name="selectedIds" />
	<input type="hidden" id="excludedIds" name="excludedIds" />
{/strip}
