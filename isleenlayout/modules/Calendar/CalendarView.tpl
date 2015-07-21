{strip}
<input type="hidden" id="currentView" value="{$smarty.request.view}" />
<input type="hidden" id="activity_view" value="{$CURRENT_USER->get('activity_view')}" />
<input type="hidden" id="time_format" value="{$CURRENT_USER->get('hour_format')}" />
<input type="hidden" id="start_hour" value="{$CURRENT_USER->get('start_hour')}" />
<div class="row">
  <aside class="col-lg-2">
    <div class="quickLinksDiv">
    	{foreach item=SIDEBARLINK from=$QUICK_LINKS['SIDEBARLINK']}
            {assign var=SIDE_LINK_URL value=decode_html($SIDEBARLINK->getUrl())}
    		{assign var="EXPLODED_PARSE_URL" value=explode('?',$SIDE_LINK_URL)}
    		{assign var="COUNT_OF_EXPLODED_URL" value=count($EXPLODED_PARSE_URL)}
    		{if $COUNT_OF_EXPLODED_URL gt 1}
    			{assign var="EXPLODED_URL" value=$EXPLODED_PARSE_URL[$COUNT_OF_EXPLODED_URL-1]}
    		{/if}
    		{assign var="PARSE_URL" value=explode('&',$EXPLODED_URL)}
    		{assign var="CURRENT_LINK_VIEW" value='view='|cat:$CURRENT_VIEW}
    		{assign var="LINK_LIST_VIEW" value=in_array($CURRENT_LINK_VIEW,$PARSE_URL)}
    		{assign var="CURRENT_MODULE_NAME" value='module='|cat:$MODULE}
    		{assign var="IS_LINK_MODULE_NAME" value=in_array($CURRENT_MODULE_NAME,$PARSE_URL)}
      	<ul class="inbox-nav inbox-divider">
      		<li class="{if $LINK_LIST_VIEW and $IS_LINK_MODULE_NAME} active {/if}">
        		<p onclick="window.location.href='{$SIDEBARLINK->getUrl()}'" id="{$MODULE}_sideBar_link_{Vtiger_Util_Helper::replaceSpaceWithUnderScores($SIDEBARLINK->getLabel())}"
        		   class="{if $LINK_LIST_VIEW and $IS_LINK_MODULE_NAME}selectedQuickLink {else}unSelectedQuickLink{/if}"><a class="quickLinks" href="{$SIDEBARLINK->getUrl()}">
        				<strong>{vtranslate($SIDEBARLINK->getLabel(), $MODULE)}</strong>
        		</a></p>
      		</li>
    		</ul>
    	{/foreach}
    </div>   
    <div class="calendar_widget">
      <div class="quickWidget" style="width:100%">
        <section class="panel">                              
          <div class="quickWidgetHeader panel-heading">
          {vtranslate('Activity Types',$MODULE)}
          </div>
          <div class="panel-body">
            <div class="widgetContainer" data-url="module=Calendar&view=ViewTypes&mode=getViewTypes">
            </div>
          </div>                                
        </section>
      </div>
    </div>
  </aside>
  <aside class="col-lg-10 paddingLeft">
    <section class="panel" style="margin: 0px; width: 100%;">
      <div class="panel-body">
        <div id="calendarview" class="has-toolbar CustomCalendarView"></div>
      </div>
    </section>
  </aside>
</div>                 
                      
{/strip}
