{strip}
<div class="detailViewInfo tooltipover">
	<table class="table table-bordered equalSplit detailview-table">
		{foreach item=FIELD_MODEL key=FIELD_NAME from=$RECORD_STRUCTURE['TOOLTIP_FIELDS']}
			<tr>
				<td class="fieldLabel narrowWidthType" nowrap>
					<label class="muted marginRight10px">{vtranslate($FIELD_MODEL->get('label'),$MODULE)}</label>
				</td>
				<td class="fieldValue narrowWidthType">
					<span class="value">
                        {include file=vtemplate_path($FIELD_MODEL->getUITypeModel()->getDetailViewTemplateName(),$MODULE_NAME) FIELD_MODEL=$FIELD_MODEL USER_MODEL=$USER_MODEL MODULE=$MODULE_NAME RECORD=$RECORD}
					</span>
				</td>
			</tr>
		{/foreach}
	</table>
</div>
{/strip}
