<div class="text-center twite">
<a href="{$UPDATE->getParent()->getDetailViewUrl()}" ><h1 title=""  class="count">
                    {assign var=COUNTER value=0}
                    {foreach item=NAME_FIELD from=$UPDATE->getParent()->getModule()->getNameFields()}
                    {assign var=FIELD_MODEL value=$UPDATE->getParent()->getModule()->getField($NAME_FIELD)}
                    {if $FIELD_MODEL->getPermissions()}
                    {$UPDATE->getParent()->get($NAME_FIELD)}
                    {if $COUNTER eq 0 && ($UPDATE->getParent()->get($NAME_FIELD))}&nbsp;{assign var=COUNTER value=$COUNTER+1}{/if}
                    {/if}
                    {/foreach}
</h1></a>
</div>        