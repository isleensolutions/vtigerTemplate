{strip}
	
	{foreach key=BLOCK_LABEL_KEY item=FIELD_MODEL_LIST from=$RECORD_STRUCTURE}
	{assign var=BLOCK value=$BLOCK_LIST[$BLOCK_LABEL_KEY]}
	{if $BLOCK eq null or $FIELD_MODEL_LIST|@count lte 0}{continue}{/if}
	{assign var=IS_HIDDEN value=$BLOCK->isHidden()}
	{assign var=WIDTHTYPE value=$USER_MODEL->get('rowheight')}
	<input type=hidden name="timeFormatOptions" data-value='{$DAY_STARTS}' />
	<section class="panel DetailViewRemoveBorder">
		<header class="panel-heading">
			<div class="blockHeader" colspan="4">				  				
				{vtranslate({$BLOCK_LABEL_KEY},{$MODULE_NAME})}
				<span class="tools pull-right">
					<a class="fa fa-chevron-down" href="javascript:;"></a>						
				</span>				
			</div>		
		</header>
		<div class="panel-body">
		<table class="table equalSplit  form-horizontal">
		 <tbody {if $IS_HIDDEN} class="hide" {/if}>
		{assign var=COUNTER value=0}
			<tr class="FloatWidth">
			{foreach item=FIELD_MODEL key=FIELD_NAME from=$FIELD_MODEL_LIST}
				{if !$FIELD_MODEL->isViewableInDetailView()}
					 {continue}
				 {/if}
				 {if $FIELD_MODEL->get('uitype') eq "83"}
					{foreach item=tax key=count from=$TAXCLASS_DETAILS}
					{if $tax.check_value eq 1}
						{if $COUNTER eq 2}
			</tr>
			<tr class="FloatWidth">
				{assign var="COUNTER" value=1}
				{else}
				{assign var="COUNTER" value=$COUNTER+1}
				{/if}
				<td class="fieldLabel {$WIDTHTYPE} col-md-3">
					<label class='muted pull-right' style="font-weight:400;">{vtranslate($tax.taxlabel, $MODULE)}(%)</label>
				</td>
				<td class="fieldValue {$WIDTHTYPE} col-md-3">
						<span class="value">
						{$tax.percentage}
					</span>
				</td>
				{/if}
				{/foreach}
				{else if $FIELD_MODEL->get('uitype') eq "69" || $FIELD_MODEL->get('uitype') eq "105"}
				{if $COUNTER neq 0}
				{if $COUNTER eq 2}
			</tr>
			<tr class="FloatWidth">
				{assign var=COUNTER value=0}
				{/if}
				{/if}
				<td class="fieldLabel {$WIDTHTYPE} col-md-3">
					<label class="muted pull-right control-label" style="font-weight:400;">{vtranslate({$FIELD_MODEL->get('label')},{$MODULE_NAME})}</label></td>
				<td class="fieldValue {$WIDTHTYPE} col-md-3">
					<div id="imageContainer">
						{foreach key=ITER item=IMAGE_INFO from=$IMAGE_DETAILS}
						{if !empty($IMAGE_INFO.path) && !empty({$IMAGE_INFO.orgname})}
						<img src="{$IMAGE_INFO.path}_{$IMAGE_INFO.orgname}" width="100%" height="150px">
						{/if}
						{/foreach}
					</div>
				</td>
				{assign var=COUNTER value=$COUNTER+1}
			{else}
				{if $FIELD_MODEL->get('uitype') eq "20" or $FIELD_MODEL->get('uitype') eq "19"}
				{if $COUNTER eq '1'}
				<td class="{$WIDTHTYPE} col-md-3"></td>
				<td class="{$WIDTHTYPE} col-md-3"></td>
			</tr>
			<tr class="FloatWidth">
				{assign var=COUNTER value=0}
				{/if}
				{/if}
				{if $COUNTER eq 2}
			</tr>
			<tr class="FloatWidth">
				{assign var=COUNTER value=1}
				{else}
				{assign var=COUNTER value=$COUNTER+1}
				{/if}
				<td class="fieldLabel {$WIDTHTYPE} form-horizontal  col-md-3" id="{$MODULE}_detailView_fieldLabel_{$FIELD_MODEL->getName()}">
					<label class="muted pull-right control-label" style="font-weight:400;">
						{vtranslate({$FIELD_MODEL->get('label')},{$MODULE_NAME})}
						{if ($FIELD_MODEL->get('uitype') eq '72') && ($FIELD_MODEL->getName() eq 'unit_price')}
						({$BASE_CURRENCY_SYMBOL})
						{/if}
					</label>
				</td>
				<td class="fieldValue {$WIDTHTYPE}  col-md-3" id="{$MODULE}_detailView_fieldValue_{$FIELD_MODEL->getName()}" {if $FIELD_MODEL->get('uitype') eq '19' or $FIELD_MODEL->get('uitype') eq '20'} colspan="3" {assign var=COUNTER value=$COUNTER+1} {/if}>
					<span class="value" data-field-type="{$FIELD_MODEL->getFieldDataType()}">
                        {include file=vtemplate_path($FIELD_MODEL->getUITypeModel()->getDetailViewTemplateName(),$MODULE_NAME) FIELD_MODEL=$FIELD_MODEL USER_MODEL=$USER_MODEL MODULE=$MODULE_NAME RECORD=$RECORD}
					</span>
					{if $IS_AJAX_ENABLED && $FIELD_MODEL->isEditable() eq 'true' && ($FIELD_MODEL->getFieldDataType()!=Vtiger_Field_Model::REFERENCE_TYPE) && $FIELD_MODEL->isAjaxEditable() eq 'true'}
					<span class="hide edit">
						{include file=vtemplate_path($FIELD_MODEL->getUITypeModel()->getTemplateName(),$MODULE_NAME) FIELD_MODEL=$FIELD_MODEL USER_MODEL=$USER_MODEL MODULE=$MODULE_NAME}
                        {if $FIELD_MODEL->getFieldDataType() eq 'multipicklist'}
                           	<input type="hidden" class="fieldname" value='{$FIELD_MODEL->get('name')}[]' data-prev-value='{$FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue'))}' />
                             {else}
                                 <input type="hidden" class="fieldname" value='{$FIELD_MODEL->get('name')}' data-prev-value='{Vtiger_Util_Helper::toSafeHTML($FIELD_MODEL->getDisplayValue($FIELD_MODEL->get('fieldvalue')))}' />
                             {/if}
					</span>
					{/if}
				</td>
			 {/if}

		{if $FIELD_MODEL_LIST|@count eq 1 and $FIELD_MODEL->get('uitype') neq "19" and $FIELD_MODEL->get('uitype') neq "20" and $FIELD_MODEL->get('uitype') neq "30" and $FIELD_MODEL->get('name') neq "recurringtype" and $FIELD_MODEL->get('uitype') neq "69" and $FIELD_MODEL->get('uitype') neq "105"}
			<td class="{$WIDTHTYPE}  col-md-3"></td>
			<td class="{$WIDTHTYPE}  col-md-3"></td>
		{/if}
		{/foreach}
		</tr>
		</tbody>
	</table>
	</div>
	</section>
	<br>
	{/foreach}
{/strip}
