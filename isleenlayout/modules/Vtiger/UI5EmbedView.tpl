
{include file="Header.tpl"|vtemplate_path:$MODULE}
{include file="BasicHeader.tpl"|vtemplate_path:$MODULE}

{strip}
<div class="bodyContents">
	<div class="mainContainer row-fluid">
		<div class="span12">
			<iframe id="ui5frame" src="{$UI5_URL}" width="100%" height="650px" style="border:0;"></iframe>
		</div>
{/strip}