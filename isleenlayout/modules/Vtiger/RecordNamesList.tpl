{strip}
<div class="recordNamesList">
	<div class="row-fluid">
		<div class="col-md-10" style="align-self: center; padding-top: 10px; width: 100%;">
			<ul class="nav nav-list">
				{foreach item=recordsModel from=$RECORDS}
				<li>
					<a data-id={$recordsModel->getId()} href="{$recordsModel->getDetailViewUrl()}" title="{decode_html($recordsModel->getName())}">{decode_html($recordsModel->getName())}</a>
				</li>
				{foreachelse}
					<li style="text-align:center">{vtranslate('LBL_NO_RECORDS', $MODULE)}
					</li>
				{/foreach}

			</ul>
		</div>
	</div>
</div>
{/strip}