{strip}
	{assign var="topMenus" value=$MENU_STRUCTURE->getTop()}
	{assign var="moreMenus" value=$MENU_STRUCTURE->getMore()}
	{assign var=NUMBER_OF_PARENT_TABS value = count(array_keys($moreMenus))}
      
        <div class="sideBarContents">
            {include file='SideBarLinks.tpl'|@vtemplate_path:$MODULE}
             <div class="clearfix"></div>
            {include file='SideBarWidgets.tpl'|@vtemplate_path:$MODULE}
         </div> 
          
          {*<div id="sidebar"  class="nav-collapse ">
              <!-- sidebar menu start-->
              <ul class="sidebar-menu" id="nav-accordion">
				<li>
                      <a class="{if $MODULE eq 'Users'} active {/if}" href="index.php">
                          <i class="fa  fa-home"></i>
                          <span>Home</span>
                      </a>
                </li>
				<li>
                      <a class="{if $MODULE eq 'Home'} active {/if}" href="index.php?module=Home&view=DashBoard">
                          <i class="fa fa-dashboard"></i>
                          <span>Dashboard</span>
                      </a>
                  </li>
				{foreach key=moduleName item=moduleModel from=$topMenus name=topmenu}
					{assign var='translatedModuleLabel' value=vtranslate($moduleModel->get('label'),$moduleName)}
					{assign var="topmenuClassName" value="tabs"}
					
					{* Make sure to keep selected + few menu persistently and rest responsive *}
					{*{if $smarty.foreach.topmenu.index > $MENU_TOPITEMS_LIMIT}
							{assign var="topmenuClassName" value="tabs opttabs"}
					{/if}
							
					<li class="sub-menu {$topmenuClassName}">
						<a id="menubar_item_{$moduleName}" href="{$moduleModel->getDefaultUrl()}" {if $MODULE eq $moduleName} class="active" {/if}><i class="fa {$moduleModel->getIcon()}"></i><span>{$translatedModuleLabel}</span></a>
					</li>
				{/foreach}
				
				<li class="sub-menu dcjq-parent-li">
					<a class="dcjq-parent" href="javascript:;">
						<i class=" fa  fa-arrow-right"></i>
						<span>All</span>
						<span class="dcjq-icon"></span>
					</a>
					<ul class="sub" style="display: none;">
						<li class="customAllmodules">
						{foreach key=parent item=moduleList from=$moreMenus name=more}
							{if $NUMBER_OF_PARENT_TABS >= 4} 
								{assign var=SPAN_CLASS value=span3} 
								{elseif $NUMBER_OF_PARENT_TABS == 3} 
								{assign var=SPAN_CLASS value=span4} 
								{elseif $NUMBER_OF_PARENT_TABS <= 2} 
								{assign var=SPAN_CLASS value=span6} 
							{/if} 
							{if $smarty.foreach.more.index % 4 == 0}
								<div class="col-lg-12 paddingLeftRight">
							{/if}
								<span class="col-lg-12 paddingLeftRight"> 									
									{foreach key=moduleName item=moduleModel from=$moduleList}
										{assign var='translatedModuleLabel' value=vtranslate($moduleModel->get('label'),$moduleName)}
										<label class="moduleNames col-lg-12 paddingLeftRight"><a id="menubar_item_{$moduleName}" href="{$moduleModel->getDefaultUrl()}">{$translatedModuleLabel}</a></label>
									{/foreach}
								</span>
							{if $smarty.foreach.more.last OR ($smarty.foreach.more.index+1) % 4 == 0}
								</div>
							{/if}
						{/foreach}							
						</li>												
					</ul>
				</li>
              </ul>
              <!-- sidebar menu end-->
          </div>  *}
{/strip}

