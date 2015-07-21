{strip}
<div style='padding:5px'>
	{foreach item=KEYMETRIC from=$KEYMETRICS}
	<div style='padding:5px'>
		<span class="pull-right">{$KEYMETRIC.count}</span>
		<a href="?module={$KEYMETRIC.module}&view=List&viewname={$KEYMETRIC.id}">{$KEYMETRIC.name}</a>
	</div>	
	{/foreach}
</div>
{/strip}
