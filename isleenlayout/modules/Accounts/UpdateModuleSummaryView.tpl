<div class="CustomFloatWidth">
    <div class="CustomFloatWidth">
        <div class="state-overview homeupdates" style="float: left;padding: 10px 0;width: 40%;">
            <section class="panel fb-gray-bg" style="float:left;width:100%;">
                <div class="detail-icon symbol terques" style="background-color:{$UPDATE->getParent()->getModule()->getColor()};">
                    <i class="fa {$UPDATE->getParent()->getModule()->getIcon()}"></i>
                </div>
            	<div class="user-name value" col>
            		<h5 title=""  class="count">
                    {assign var=COUNTER value=0}
                    {foreach item=NAME_FIELD from=$UPDATE->getParent()->getModule()->getNameFields()}
                    {assign var=FIELD_MODEL value=$UPDATE->getParent()->getModule()->getField($NAME_FIELD)}
                    {if $FIELD_MODEL->getPermissions()}
                    <span class="{$NAME_FIELD}">{$UPDATE->getParent()->get($NAME_FIELD)}</span>
                    {if $COUNTER eq 0 && ($UPDATE->getParent()->get($NAME_FIELD))}&nbsp;{assign var=COUNTER value=$COUNTER+1}{/if}
                    {/if}
                    {/foreach}
            		</h5>
            	</div>
            </section>
        </div>
    </div>
