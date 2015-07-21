{strip}
	{assign var="MODULE_NAME" value=$MODULE_MODEL->get('name')}
	<input id="recordId" type="hidden" value="{$RECORD->getId()}" />
	<div class="detailViewContainer">
		<div class="detailViewTitle">
					<aside class="sm-side">
						<div class="detail-head"> 
							{include file="DetailViewHeaderTitle.tpl"|vtemplate_path:$MODULE}
						</div>
					</aside>
					<aside class="lg-side">
						<div class="detail-summary-head">
							<span class="btn-group">
							{foreach item=DETAIL_VIEW_BASIC_LINK from=$DETAILVIEW_LINKS['DETAILVIEWBASIC']}
								
									<button class="btn btn-success" id="{$MODULE_NAME}_detailView_basicAction_{Vtiger_Util_Helper::replaceSpaceWithUnderScores($DETAIL_VIEW_BASIC_LINK->getLabel())}"
										{if $DETAIL_VIEW_BASIC_LINK->isPageLoadLink()}
											onclick="window.location.href='{$DETAIL_VIEW_BASIC_LINK->getUrl()}'"
										{else}
											onclick={$DETAIL_VIEW_BASIC_LINK->getUrl()}
										{/if}>
										{vtranslate($DETAIL_VIEW_BASIC_LINK->getLabel(), $MODULE_NAME)}
									</button>
							
							{/foreach}
							</span>
							&nbsp;
								{if $DETAILVIEW_LINKS['DETAILVIEW']|@count gt 0}
								<span class="btn-group">
									<button class="btn dropdown-toggle btn-warning" data-toggle="dropdown" href="javascript:void(0);">
										{vtranslate('LBL_MORE', $MODULE_NAME)}&nbsp;&nbsp;<i class="caret"></i>
									</button>
									<ul class="dropdown-menu pull-right">
										{foreach item=DETAIL_VIEW_LINK from=$DETAILVIEW_LINKS['DETAILVIEW']}
										<li id="{$MODULE_NAME}_detailView_moreAction_{Vtiger_Util_Helper::replaceSpaceWithUnderScores($DETAIL_VIEW_LINK->getLabel())}">
											<a href={$DETAIL_VIEW_LINK->getUrl()} >{vtranslate($DETAIL_VIEW_LINK->getLabel(), $MODULE_NAME)}</a>
										</li>
										{/foreach}
									</ul>
								</span>
								&nbsp;
								{/if}
								{if $DETAILVIEW_LINKS['DETAILVIEWSETTING']|@count gt 0}
									<span class="btn-group">
										<button class="btn dropdown-toggle btn-warning" href="#" data-toggle="dropdown"><i class="fa fa-wrench" alt="{vtranslate('LBL_SETTINGS', $MODULE_NAME)}" title="{vtranslate('LBL_SETTINGS', $MODULE_NAME)}"></i>&nbsp;&nbsp;<i class="caret"></i></button>
										<ul class="listViewSetting dropdown-menu">
											{foreach item=DETAILVIEW_SETTING from=$DETAILVIEW_LINKS['DETAILVIEWSETTING']}
												<li><a href={$DETAILVIEW_SETTING->getUrl()}>{vtranslate($DETAILVIEW_SETTING->getLabel(), $MODULE_NAME)}</a></li>
											{/foreach}
										</ul>
									</span>
								{/if}
								{if !{$NO_PAGINATION}}
									<span class="detailViewPagingButton">
										<span class="btn-group pull-right">
											<button class="btn" id="detailViewPreviousRecordButton" {if empty($PREVIOUS_RECORD_URL)} disabled="disabled" {else} onclick="window.location.href='{$PREVIOUS_RECORD_URL}'" {/if}><i class="fa fa-chevron-left"></i></button>
											<button class="btn" id="detailViewNextRecordButton" {if empty($NEXT_RECORD_URL)} disabled="disabled" {else} onclick="window.location.href='{$NEXT_RECORD_URL}'" {/if}><i class="fa fa-chevron-right"></i></button>
										</span>
									</span>
								{/if}
						</div>
					</aside>
		</div>
		<div class="detailViewInfo" style="position:static">
			<div class="details">
					<form id="detailView" data-name-fields='{ZEND_JSON::encode($MODULE_MODEL->getNameFields())}'>
						<div class="contents marginTop5px">
{/strip}	

