{strip}
	<section class="panel">
		<div class="recordDetails panel-body">
			<div>
				<label>
					<strong>{vtranslate('LBL_RECORD_SUMMARY',$MODULE_NAME)}</strong>
				</label>
			</div>
			<div class="row-fluid textAlignCenter roundedCorners">
				{foreach key=FIELD_NAME item=FIELD_VALUE from=$SUMMARY_INFORMATION}
					<span class="shade7 well squeezedWell marginLeftZero span" style='width:100px'>
						<div>
							<label class="font-x-small">
								{vtranslate($FIELD_NAME,$MODULE_NAME)}
							</label>
						</div>
						<div>
							<label class="font-x-x-large">
								{$FIELD_VALUE}
							</label>
						</div>
					</span>
				{/foreach}
			</div>
			{include file='SummaryViewContents.tpl'|@vtemplate_path}
		</div>
	</section>
{/strip}
