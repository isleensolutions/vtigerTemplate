{strip}
<section id="main-content">
	<section class="wrapper">

	<div class="reportsDetailHeader">
        <input type="hidden" name="date_filters" data-value='{ZEND_JSON::encode($DATE_FILTERS)}' />
		<div class="reportHeader col-md-12 paddingLeftRight marginbottom10px">
			<div class='col-lg-4' style="position:relative;left:10px">
				{if $REPORT_MODEL->isEditable() eq true}
					<button onclick='window.location.href="{$REPORT_MODEL->getEditViewUrl()}"' type="button" class="cursorPointer btn"><strong>{vtranslate('LBL_CUSTOMIZE',$MODULE)}</strong>&nbsp;<i class="fa fa-pencil"></i></button>
					&nbsp;
				{/if}
				<button onclick='window.location.href="{$REPORT_MODEL->getDuplicateRecordUrl()}"' type="button" class="cursorPointer btn"><strong>{vtranslate('LBL_DUPLICATE',$MODULE)}</strong></button>
			</div>
			<div class='col-lg-4 TextAlignCenter'>
				<h3 class="marginTopBottom0px">{$REPORT_MODEL->getName()}</h3>
				<div id="noOfRecords">{vtranslate('LBL_NO_OF_RECORDS',$MODULE)} <span id="countValue">{$COUNT}</span></div>
			</div>
			<div class='col-lg-4'>
				<span class="pull-right" style='margin-right:50px;'>
					{foreach item=DETAILVIEW_LINK from=$DETAILVIEW_LINKS}
						<img class="cursorPointer alignBottom" onclick='window.location.href="{$DETAILVIEW_LINK->getUrl()}"' src="{vimage_path({$DETAILVIEW_LINK->get('linkicon')})}" alt="{vtranslate($DETAILVIEW_LINK->getLabel(), $MODULE)}" title="{vtranslate($DETAILVIEW_LINK->getLabel(), $MODULE)}" />&nbsp;
					{/foreach}
				</span>
			</div>
		</div>
		<div class="well contentsBackground col-md-12">
			<input type="hidden" id="recordId" value="{$RECORD_ID}" />
 			{assign var=RECORD_STRUCTURE value=array()}
			{assign var=PRIMARY_MODULE_LABEL value=vtranslate($PRIMARY_MODULE, $PRIMARY_MODULE)}
			{foreach key=BLOCK_LABEL item=BLOCK_FIELDS from=$PRIMARY_MODULE_RECORD_STRUCTURE}
				{assign var=PRIMARY_MODULE_BLOCK_LABEL value=vtranslate($BLOCK_LABEL, $PRIMARY_MODULE)}
				{assign var=key value="$PRIMARY_MODULE_LABEL $PRIMARY_MODULE_BLOCK_LABEL"}
				{if $LINEITEM_FIELD_IN_CALCULATION eq false && $BLOCK_LABEL eq 'LBL_ITEM_DETAILS'}
					{* dont show the line item fields block when Inventory fields are selected for calculations *}
				{else}
					{$RECORD_STRUCTURE[$key] = $BLOCK_FIELDS}
				{/if}
			{/foreach}
			{foreach key=MODULE_LABEL item=SECONDARY_MODULE_RECORD_STRUCTURE from=$SECONDARY_MODULE_RECORD_STRUCTURES}
				{assign var=SECONDARY_MODULE_LABEL value=vtranslate($MODULE_LABEL, $MODULE_LABEL)}
				{foreach key=BLOCK_LABEL item=BLOCK_FIELDS from=$SECONDARY_MODULE_RECORD_STRUCTURE}
					{assign var=SECONDARY_MODULE_BLOCK_LABEL value=vtranslate($BLOCK_LABEL, $MODULE_LABEL)}
					{assign var=key value="$SECONDARY_MODULE_LABEL $SECONDARY_MODULE_BLOCK_LABEL"}
					{$RECORD_STRUCTURE[$key] = $BLOCK_FIELDS}
				{/foreach}
			{/foreach}
			{include file='AdvanceFilter.tpl'|@vtemplate_path RECORD_STRUCTURE=$RECORD_STRUCTURE ADVANCE_CRITERIA=$SELECTED_ADVANCED_FILTER_FIELDS COLUMNNAME_API=getReportFilterColumnName}
			<div class="row">
				<div class="span4 offset5 TextAlignCenter" >
					<input type="button" class="btn generateReport" data-mode="generate" value="{vtranslate('LBL_GENERATE_NOW',$MODULE)}"/>&nbsp;
					<input type="button" class="btn btn-success generateReport" data-mode="save" value="{vtranslate('LBL_SAVE',$MODULE)}" />
				</div>
			</div>
		</div>
	</div>
	<div id="reportContentsDiv">
{/strip}
