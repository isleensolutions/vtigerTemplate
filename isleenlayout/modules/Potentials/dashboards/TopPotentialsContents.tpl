<div style='padding:5px'>
{if count($MODELS) > 0}
	<div class='row-fluid'>	
			<div class='row-fluid'>
				<div class='col-md-4 paddingLeftRight'>
					<b>{vtranslate('Potential Name', $MODULE_NAME)}</b>
				</div>
				<div class='col-md-4 paddingRight'>
					<b>{vtranslate('Amount', $MODULE_NAME)}</b>
				</div>
				<div class='col-md-4 paddingRight'>
					<b>{vtranslate('Related To', $MODULE_NAME)}</b>
				</div>
			</div>	
		<hr class="col-md-12">
		{foreach item=MODEL from=$MODELS}
		<div class='row-fluid'>
			<div class='col-md-4 paddingLeftRight'>
				<a href="{$MODEL->getDetailViewUrl()}">{$MODEL->getName()}</a>
			</div>
			<div class='col-md-4 paddingRight'>
				{$MODEL->getDisplayValue('amount')}
			</div>
			<div class='col-md-4 paddingRight'>
				{$MODEL->getDisplayValue('related_to')}
			</div>
		</div>
		{/foreach}
	</div>
{else}
	<span class="noDataMsg">
		{vtranslate('LBL_NO')} {vtranslate($MODULE_NAME, $MODULE_NAME)} {vtranslate('LBL_MATCHED_THIS_CRITERIA')}
	</span>
{/if}
</div>
