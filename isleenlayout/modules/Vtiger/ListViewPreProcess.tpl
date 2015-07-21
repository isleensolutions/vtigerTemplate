{strip}
	{include file="Header.tpl"|vtemplate_path:$MODULE}
	{include file="BasicHeader.tpl"|vtemplate_path:$MODULE}
   
	<section id="main-content">
            
		<section class="wrapper site-min-height">
        <div class="span2 row-fluid {if $LEFTPANELHIDE eq '1'} hide {/if}" id="leftPanel" >
            {include file="ListViewSidebar.tpl"|vtemplate_path:$MODULE}
        </div> 
			<section class="panel isleen_panel">   
				<div class="listViewPageDiv">
                
				{include file="ListViewHeader.tpl"|vtemplate_path:$MODULE}
                
{/strip}
