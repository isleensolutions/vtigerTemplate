{strip}
    <section class="panel DetailViewRemoveBorder">
        <div class="panel-body">
    <div class="relatedContainer">
        <input type="hidden" name="currentPageNum" value="{$PAGING->getCurrentPage()}" />
        <input type="hidden" name="relatedModuleName" class="relatedModuleName" value="{$RELATED_MODULE->get('name')}" />
        <input type="hidden" value="{$ORDER_BY}" id="orderBy">
        <input type="hidden" value="{$SORT_ORDER}" id="sortOrder">
        <input type="hidden" value="{$RELATED_ENTIRES_COUNT}" id="noOfEntries">
        <input type='hidden' value="{$PAGING->getPageLimit()}" id='pageLimit'>
        <input type='hidden' value="{$TOTAL_ENTRIES}" id='totalCount'>
        <div class="relatedHeader ">
            <div class="btn-toolbar row-fluid">
                <div class="col-md-8 btn-group" style="margin-left:0;">

                    {foreach item=RELATED_LINK from=$RELATED_LIST_LINKS['LISTVIEWBASIC']}
                        <div class="btn-group">
                            {assign var=IS_SELECT_BUTTON value={$RELATED_LINK->get('_selectRelation')}}
                            <button type="button" class="btn addButton
                            {if $IS_SELECT_BUTTON eq true} selectRelation {/if} "
                        	{if $IS_SELECT_BUTTON eq true} data-moduleName={$RELATED_LINK->get('_module')->get('name')} {/if}
                        	{if ($RELATED_LINK->isPageLoadLink())}
                        		{if $RELATION_FIELD} data-name="{$RELATION_FIELD->getName()}" {/if}
                        		data-url="{$RELATED_LINK->getUrl()}"
                    		{/if}
            				{if $IS_SELECT_BUTTON neq true}name="addButton"{/if}>
							{if $IS_SELECT_BUTTON eq false}<i class="fa fa-plus"></i>{/if}&nbsp;
							{$RELATED_LINK->getLabel()}</button>
    					</div>
					{/foreach}
				&nbsp;
				</div>
			<div class="col-md-4 paddingRight">
    			<span class="row-fluid">
        			<span class="col-md-6 pushDown">
            			<span class="pull-right pageNumbers alignTop" data-placement="bottom" data-original-title="" style="margin-top: -5px">
            				{if !empty($RELATED_RECORDS)} {$PAGING->getRecordStartRange()} {vtranslate('LBL_to', $RELATED_MODULE->get('name'))} {$PAGING->getRecordEndRange()}{/if}
        				</span>
    				</span>
    <span class="col-md-6 pull-right btn-group paddingLeftRight">
        <span class="btn-group pull-right">
            <button class="btn" id="relatedListPreviousPageButton" {if !$PAGING->isPrevPageExists()} disabled {/if} type="button"><span class="fa fa-chevron-left"></span></button>
            <button class="btn dropdown-toggle" type="button" id="relatedListPageJump" data-toggle="dropdown" {if $PAGE_COUNT eq 1} disabled {/if}>
                <i class="fa fa-share-square-o" title="{vtranslate('LBL_LISTVIEW_PAGE_JUMP',$moduleName)}"></i>
            </button>
            <ul class="listViewBasicAction dropdown-menu" id="relatedListPageJumpDropDown">
                <li>
                    <span class="row-fluid CustomTextAlign">
                        <span class="col-md-3 paddingLeftRight"><span class="pull-right listPage">{vtranslate('LBL_PAGE',$moduleName)}</span></span>
                        <span class="col-md-5 paddingLeftRight">
                            <input type="text" id="pageToJump" class="listViewPagingInput form-control" value="{$PAGING->getCurrentPage()}" style="width:100%"/>
                        </span>
                        <span class="col-md-2 textAlignCenter paddingLeftRight">
                            {vtranslate('LBL_OF',$moduleName)}
                        </span>
                        <span class="col-md-2 paddingLeftRight" id="totalPageCount">{$PAGE_COUNT}</span>
                    </span>
                </li>
            </ul>
            <button class="btn" id="relatedListNextPageButton" {if (!$PAGING->isNextPageExists()) or ($PAGE_COUNT eq 1)} disabled {/if} type="button"><span class="fa fa-chevron-right"></span></button>
        </span>
    </span>
</span>
</div>
</div>
</div>
<div class="contents-topscroll">
    <div class="topscroll-div">
        &nbsp;
    </div>
</div>
<div class="relatedContents contents-bottomscroll">
    <div class="bottomscroll-div">
			{assign var=WIDTHTYPE value=$USER_MODEL->get('rowheight')}
        <table class="table listViewEntriesTable">
            <thead>
                <tr class="listViewHeaders">
                    {foreach item=HEADER_FIELD from=$RELATED_HEADERS}
							<th {if $HEADER_FIELD@last} colspan="2" {/if} nowrap class="{$WIDTHTYPE}">
                            {if $HEADER_FIELD->get('column') eq 'access_count' or $HEADER_FIELD->get('column') eq 'idlists' }
                                <a href="javascript:void(0);" class="noSorting">{vtranslate($HEADER_FIELD->get('label'), $RELATED_MODULE->get('name'))}</a>
                            {elseif $HEADER_FIELD->get('column') eq 'time_start'}
                            {else}
                                <a href="javascript:void(0);" class="relatedListHeaderValues" data-nextsortorderval="{if $COLUMN_NAME eq $HEADER_FIELD->get('column')}{$NEXT_SORT_ORDER}{else}ASC{/if}" data-fieldname="{$HEADER_FIELD->get('column')}">{vtranslate($HEADER_FIELD->get('label'), $RELATED_MODULE->get('name'))}
                                    &nbsp;&nbsp;{if $COLUMN_NAME eq $HEADER_FIELD->get('column')}<img class="{$SORT_IMAGE} icon-white">{/if}
                                </a>
                            {/if}
                        </th>
                    {/foreach}
                </tr>
            </thead>
            {foreach item=RELATED_RECORD from=$RELATED_RECORDS}
                <tr class="listViewEntries" data-id='{$RELATED_RECORD->getId()}' data-recordUrl='{$RELATED_RECORD->getDetailViewUrl()}'>
                    {foreach item=HEADER_FIELD from=$RELATED_HEADERS}
                        {assign var=RELATED_HEADERNAME value=$HEADER_FIELD->get('name')}
							<td class="{$WIDTHTYPE}" data-field-type="{$HEADER_FIELD->getFieldDataType()}" nowrap>
                            {if $HEADER_FIELD->isNameField() eq true or $HEADER_FIELD->get('uitype') eq '4'}
                                <a href="{$RELATED_RECORD->getDetailViewUrl()}">{$RELATED_RECORD->getDisplayValue($RELATED_HEADERNAME)}</a>
                            {elseif $RELATED_HEADERNAME eq 'access_count'}
                                {$RELATED_RECORD->getAccessCountValue($PARENT_RECORD->getId())}
                            {elseif $RELATED_HEADERNAME eq 'time_start'}
                            {else}
                                {$RELATED_RECORD->getDisplayValue($RELATED_HEADERNAME)}
                            {/if}
                            {if $HEADER_FIELD@last}
								</td><td nowrap class="{$WIDTHTYPE}">
                                <div class="pull-right actions">
                                    <span class="actionImages">
                                        <a href="{$RELATED_RECORD->getFullDetailViewUrl()}"><i title="{vtranslate('LBL_SHOW_COMPLETE_DETAILS', $MODULE)}" class="fa fa-th-list  alignMiddle"></i></a>&nbsp;
                                        {if $IS_EDITABLE}
                                            <a href='{$RELATED_RECORD->getEditViewUrl()}'><i title="{vtranslate('LBL_EDIT', $MODULE)}" class="fa fa-pencil alignMiddle"></i></a>
                                        {/if}
                                        {if $IS_DELETABLE}
                                            <a class="relationDelete"><i title="{vtranslate('LBL_DELETE', $MODULE)}" class="fa fa-trash-o alignMiddle"></i></a>
                                        {/if}
                                    </span>
                                </div>
                            </td>
                        {/if}
                        </td>
                    {/foreach}
                </tr>
            {/foreach}
        </table>
    </div>
</div>
</div>
</div>
</section>
{/strip}