{strip}
<div class="contentsDiv col-md-10 marginLeftZero">
	<input type="hidden" name="module" value="{$FOR_MODULE}" />
	<table style="width:80%;margin-left:auto;margin-right:auto;margin-top: 10px" cellpadding="5" class="searchUIBasic well">
		<tr>
			<td class="font-x-large" align="left" colspan="2">
				<strong>{'LBL_IMPORT'|@vtranslate:$MODULE} {$FOR_MODULE|@vtranslate:$FOR_MODULE} - {'LBL_RESULT'|@vtranslate:$MODULE}</strong>
			</td>
		</tr>
		{if $ERROR_MESSAGE neq ''}
		<tr>
			<td class="style1" align="left" colspan="2">
				{$ERROR_MESSAGE}
			</td>
		</tr>
		{/if}
		<tr>
			<td valign="top">
				{include file="Import_Result_Details.tpl"|@vtemplate_path:'Import'}
			</td>
		</tr>
		<tr>
			<td align="right" colspan="2">
			{include file='Import_Finish_Buttons.tpl'|@vtemplate_path:'Import'}
			</td>
		</tr>
	</table>
</div>
{/strip}