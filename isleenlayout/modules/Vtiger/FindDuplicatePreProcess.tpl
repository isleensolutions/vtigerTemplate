{strip}
{include file="Header.tpl"|vtemplate_path:$MODULE}
{include file="BasicHeader.tpl"|vtemplate_path:$MODULE}

<section id="main-content" style="min-height: 439px;">
	<section class="wrapper site-min-height">
		<section class="panel">
			<div class="bodyContents">
				<div class="mainContainer row-fluid">
					{*{assign var=LEFTPANELHIDE value=$CURRENT_USER_MODEL->get('leftpanelhide')}
					<div class="col-md-2 {if $LEFTPANELHIDE eq '1'} hide {/if} row-fluid" id="leftPanel">
						{include file="ListViewSidebar.tpl"|vtemplate_path:$MODULE}
					</div>*}
					
					<div class="contentsDiv {if $LEFTPANELHIDE neq '1'} {/if}marginLeftZero" id="rightPanel">					
						{include file="FindDuplicateHeader.tpl"|vtemplate_path:$MODULE}

{/strip}