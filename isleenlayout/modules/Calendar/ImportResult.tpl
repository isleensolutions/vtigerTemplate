{strip}
<section id="main-content" style="min-height: 463px;">
	<section class="wrapper site-min-height">
		<section class="panel">		
			<div class="panel-body">
				<input type="hidden" name="module" value="{$MODULE}" />
				<table cellpadding="5" class="searchUIBasic well import_result">
					<tr>
						<td class="font-x-large" align="left" colspan="2">
							<strong>{'LBL_IMPORT'|@vtranslate:$MODULE} {$FOR_MODULE|@vtranslate:$MODULE} - {'LBL_RESULT'|@vtranslate:$MODULE}</strong>
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
							<table cellpadding="5" cellspacing="0" align="center" width="100%" class="dvtSelectedCell thickBorder importContents">
								<tr>
									<td>{'LBL_TOTAL_EVENTS_IMPORTED'|@vtranslate:$MODULE}</td>
									<td width="10%">:</td>
									<td width="30%">{$SUCCESS_EVENTS}</td>
								</tr>
								<tr>
									<td>{'LBL_TOTAL_EVENTS_SKIPPED'|@vtranslate:$MODULE}</td>
									<td width="10%">:</td>
									<td width="30%">{$SKIPPED_EVENTS}</td>
								</tr>

								<tr>
									<td>{'LBL_TOTAL_TASKS_IMPORTED'|@vtranslate:$MODULE}</td>
									<td width="10%">:</td>
									<td width="30%">{$SUCCESS_TASKS}</td>
								</tr>
								<tr>
									<td>{'LBL_TOTAL_TASKS_SKIPPED'|@vtranslate:$MODULE}</td>
									<td width="10%">:</td>
									<td width="30%">{$SKIPPED_TASKS}</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="right" colspan="2">
							<button name="next" class="create btn btn-success"
							onclick="location.href='index.php?module={$MODULE}&view=List'" ><strong>{'LBL_FINISH'|@vtranslate:$MODULE}</strong></button>
						</td>
						<td align="right" colspan="2">
							<button name="next" class="delete btn  btn-danger"
								onclick="location.href='index.php?module={$MODULE}&view=Import&mode=undoImport'"><strong>{'LBL_UNDO_LAST_IMPORT'|@vtranslate:$MODULE}</strong>
							</button>
						</td>
					</tr>
				</table>
			</div>

{/strip}