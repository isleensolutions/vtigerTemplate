{strip}
{assign var="MODULE_NAME" value=$MODULE_MODEL->get('name')}
</div>
		</form>
	</div>
			<div class="related marginLeftZero">
				<div class="">
					<ul class="nav nav-stacked nav-pills labels-info">
						{foreach item=RELATED_LINK from=$DETAILVIEW_LINKS['DETAILVIEWTAB']}
						<li class="{if $RELATED_LINK->getLabel()==$SELECTED_TAB_LABEL}active{/if}" data-url="{$RELATED_LINK->getUrl()}&tab_label={$RELATED_LINK->getLabel()}" data-label-key="{$RELATED_LINK->getLabel()}" data-link-key="{$RELATED_LINK->get('linkKey')}" >
							<a href="javascript:void(0);" class="textOverflowEllipsis" style="width:auto" title="{vtranslate($RELATED_LINK->getLabel(),{$MODULE_NAME})}">{vtranslate($RELATED_LINK->getLabel(),{$MODULE_NAME})}</a>
						</li>
						{/foreach}
						{foreach item=RELATED_LINK from=$DETAILVIEW_LINKS['DETAILVIEWRELATED']}
						<li class="{if $RELATED_LINK->getLabel()==$SELECTED_TAB_LABEL}active{/if}" data-url="{$RELATED_LINK->getUrl()}&tab_label={$RELATED_LINK->getLabel()}" data-label-key="{$RELATED_LINK->getLabel()}" >
							{* Assuming most of the related link label would be module name - we perform dual translation *}
							{assign var="DETAILVIEWRELATEDLINKLBL" value= vtranslate($RELATED_LINK->getLabel(), $RELATED_LINK->getLabel())}
							<a href="javascript:void(0);" class="textOverflowEllipsis" style="width:auto" title="{vtranslate($RELATED_LINK->getLabel(),{$MODULE_NAME})}">{$DETAILVIEWRELATEDLINKLBL}</a>
						</li>
						{/foreach}
					</ul>
				</div>
			</div>
	</div>
	</section>
</section>
{/strip}
