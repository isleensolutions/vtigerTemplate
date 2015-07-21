{strip}
<div style="padding-left: 15px;">
	<input type="hidden" name="module" value="{$MODULE}" />
	<table style=" width:90%;margin-left: 5% "   cellpadding="5" class="searchUIBasic well">
		<tr>
			<td class="font-x-large" align="left" colspan="2">
				<strong>{'LBL_IMPORT'|@vtranslate:$MODULE} {$FOR_MODULE|@vtranslate:$MODULE} - {'LBL_RESULT'|@vtranslate:$MODULE}</strong>
			</td>
		</tr>
		<tr>
			<td valign="top">
				<table cellpadding="5" cellspacing="0" align="center" width="100%" class="dvtSelectedCell thickBorder importContents">
					<tr>
						<td>{'LBL_LAST_IMPORT_UNDONE'|@vtranslate:$MODULE}</td>
					</tr>
				</table>
			</td>
		</tr>
		<tr>
			<td align="right" colspan="2">
				<button name="next" class="create btn"
				onclick="location.href='index.php?module={$MODULE}&view=List'" ><strong>{'LBL_FINISH'|@vtranslate:$MODULE}</strong></button>
			</td>
		</tr>
	</table>
{/strip}