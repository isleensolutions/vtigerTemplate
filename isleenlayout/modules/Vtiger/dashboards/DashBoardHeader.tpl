<section id="main-content">
	<section class="wrapper">
		              <!--state overview start-->
              <div class="row state-overview">
                  <div class="col-lg-3 col-sm-6">
                      <section class="panel">
                          <div class="symbol terques" style="background-color:#2E8DEF;">
                              <i class="fa fa-bullseye"></i>
                          </div>
                          <div class="value">
                              <h1 class="count">
                                  0
                              </h1>
                              <p>Total Leads</p>
                          </div>
                      </section>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                      <section class="panel">
                          <div class="symbol red">
                              <i class="fa fa-tags"></i>
                          </div>
                          <div class="value">
                              <h1 class=" count2">
                                  0
                              </h1>
                              <p>Sales</p>
                          </div>
                      </section>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                      <section class="panel">
                          <div class="symbol yellow">
                              <i class="fa fa-shopping-cart"></i>
                          </div>
                          <div class="value">
                              <h1 class=" count3">
                                  0
                              </h1>
                              <p>New Order</p>
                          </div>
                      </section>
                  </div>
                  <div class="col-lg-3 col-sm-6">
                      <section class="panel">
                          <div class="symbol blue">
                              <i class="fa fa-bar-chart-o"></i>
                          </div>
                          <div class="value">
                              <h1 class=" count4">
                                  0
                              </h1>
                              <p>Total Profit</p>
                          </div>
                      </section>
                  </div>
              </div>
{literal}
<script type="text/javascript">
	jQuery(document).ready(function(){
		countUp({/literal}{$TOTAL_LEAD}{literal})
	})
</script>
{/literal}
              <!--state overview end-->

	<div class="row" style="padding: 10px">
			<span class="btn-toolbar pull-right" style="margin: 0;">
		<span class="btn-group">
			{if $WIDGETS|count gt 0}
			<button class='btn btn-primary addButton dropdown-toggle' data-toggle='dropdown'>
				<strong>{vtranslate('LBL_ADD_WIDGET')}</strong>
				<i class="caret"></i>
			</button>

			<ul class="dropdown-menu widgetsList pull-right" style="min-width:100%;text-align:left;">
				{assign var="MINILISTWIDGET" value=""}
				{foreach from=$WIDGETS item=WIDGET}
					{if $WIDGET->getName() eq 'MiniList'}
						{assign var="MINILISTWIDGET" value=$WIDGET} {* Defer to display as a separate group *}
					{elseif $WIDGET->getName() eq 'Notebook'}
						{assign var="NOTEBOOKWIDGET" value=$WIDGET} {* Defer to display as a separate group *}
					{else}
					<li>
						<a onclick="Vtiger_DashBoard_Js.addWidget(this, '{$WIDGET->getUrl()}')" href="javascript:void(0);"
							data-linkid="{$WIDGET->get('linkid')}" data-name="{$WIDGET->getName()}" data-width="{$WIDGET->getWidth()}" data-height="{$WIDGET->getHeight()}">
							{vtranslate($WIDGET->getTitle(), $MODULE_NAME)}</a>
					</li>
					{/if}
				{/foreach}
				
				{if $MINILISTWIDGET && $MODULE_NAME == 'Home'}
				<li class="divider"></li>
				<li>
					<a onclick="Vtiger_DashBoard_Js.addMiniListWidget(this, '{$MINILISTWIDGET->getUrl()}')" href="javascript:void(0);"
						data-linkid="{$MINILISTWIDGET->get('linkid')}" data-name="{$MINILISTWIDGET->getName()}" data-width="{$MINILISTWIDGET->getWidth()}" data-height="{$MINILISTWIDGET->getHeight()}">
						{vtranslate($MINILISTWIDGET->getTitle(), $MODULE_NAME)}</a>
				</li>
				<li>
					<a onclick="Vtiger_DashBoard_Js.addNoteBookWidget(this, '{$NOTEBOOKWIDGET->getUrl()}')" href="javascript:void(0);"
						data-linkid="{$NOTEBOOKWIDGET->get('linkid')}" data-name="{$NOTEBOOKWIDGET->getName()}" data-width="{$NOTEBOOKWIDGET->getWidth()}" data-height="{$NOTEBOOKWIDGET->getHeight()}">
						{vtranslate($NOTEBOOKWIDGET->getTitle(), $MODULE_NAME)}</a>
				</li>
				{/if}
				
			</ul>
			{else if $MODULE_PERMISSION}
				<button class='btn addButton dropdown-toggle' disabled="disabled" data-toggle='dropdown'>
					<strong>{vtranslate('LBL_ADD_WIDGET')}</strong> &nbsp;&nbsp;
				<i class="caret"></i>
			</button>
			{/if}
		</span>
	</span>
	</div>