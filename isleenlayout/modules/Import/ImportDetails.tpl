{strip}
<div class="popupEntriesDiv textAlignCenter">
	<h3>{vtranslate($TYPE, $MODULE)}</h3>
</div>
<table class="table table-bordered listViewEntriesTable">
	<thead>
		<tr class="listViewHeaders">
			{assign var=LISTVIEW_HEADERS value=$IMPORT_RECORDS['headers']}
			{assign var=IMPORT_RESULT_DATA value=$IMPORT_RECORDS[$TYPE]}
			{foreach item=LISTVIEW_HEADER_NAME from=$LISTVIEW_HEADERS}
				<th>{$LISTVIEW_HEADER_NAME}</th>
			{/foreach}
		</tr>
	</thead>
	{foreach item=RECORD from=$IMPORT_RESULT_DATA}
		<tr class="listViewEntries">
			{foreach item=LISTVIEW_HEADER_NAME from=$LISTVIEW_HEADERS}
				<td>
					{$RECORD->get($LISTVIEW_HEADER_NAME)}
				</td>
			{/foreach}
		</tr>
	{/foreach}
</table>
{/strip}