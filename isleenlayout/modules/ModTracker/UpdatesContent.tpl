	{assign var=CURRENT_USER_MODEL value=Users_Record_Model::getCurrentUserModel()}
{if $UPDATES neq ""}
	{foreach item=UPDATE key=k from=$UPDATES}
	{assign var=USER value="{$UPDATE->getModifiedBy()}"}
	{assign var=SINGLE_MODULE value=$UPDATE->getParent()->getModuleName()}
	{assign var=SINGLE_MODULE_NAME value=$UPDATE->getParent()->getModule()->getSingularLabelKey()}
	{*assign var=COMMENTS value=$UPDATE->getParent()->getModule()->getComments($PAGING)*}

		<section class="panel post-wrap pro-box">
			<aside class="post-highlight terques v-align" style="background-color:{$UPDATE->getParent()->getModule()->getColor()}">
            	<div class="panel-body">
            		<div class="update_module_ico">
            			<i class="fa {$UPDATE->getParent()->getModule()->getIcon()}"></i>
            		</div>
            		{if $UPDATE->isCreate()}          
                	<h2> {$USER->getName()}  
                		{vtranslate('LBL_CREATED', $MODULE_NAME)} a {vtranslate($SINGLE_MODULE_NAME, $SINGLE_MODULE)}
             			<span class="create_time" title="{Vtiger_Util_Helper::formatDateTimeIntoDayString($UPDATE->getActivityTime())}">{Vtiger_Util_Helper::formatDateDiffInStrings($UPDATE->getActivityTime())}</span>   	
                	</h2>
                	{else if $UPDATE->isUpdate()}
                	<h2> {$USER->getName()}
                		{vtranslate('LBL_UPDATED', $MODULE_NAME)} a {vtranslate($SINGLE_MODULE_NAME, $SINGLE_MODULE)}
             			<span class="create_time" title="{Vtiger_Util_Helper::formatDateTimeIntoDayString($UPDATE->getActivityTime())}">{Vtiger_Util_Helper::formatDateDiffInStrings($UPDATE->getActivityTime())}</span>   	
                	</h2>
                	{else if $UPDATE->isRelationLink()}
                	{assign var=RELATION value=$UPDATE->getRelationInstance()}
                	<h2> {$USER->getName()}
                		{vtranslate($RELATION->getLinkedRecord()->getModuleName(), $RELATION->getLinkedRecord()->getModuleName())} {vtranslate('LBL_ADDED', $SINGLE_MODULE)} <a href="">{$RELATION->getLinkedRecord()->getName()}</a>
             			<span class="create_time" title="{Vtiger_Util_Helper::formatDateTimeIntoDayString($UPDATE->getActivityTime())}">{Vtiger_Util_Helper::formatDateDiffInStrings($UPDATE->getActivityTime())}</span>   	
                	</h2>		
                	{/if}
                </div>
      		</aside>
      		<aside>
      			<div class="post-info">
      				<span class="arrow-pro left"></span>
                          <div class="panel-body">   
                                         {include file="UpdateModuleSummary.tpl"|vtemplate_path:$SINGLE_MODULE}
								<!--  {*{if $UPDATE->getParent()->getModule()->isCommentEnabled()}
                              		<div class="fb-status-container fb-border" style="float: left; width: 100%;">
                                  		<div class="fb-time-action" style="border-top:1px solid #DDDDDD"> 
                                      		<a title="Leave a comment" class="UpdateComment" data-url="index.php?module=Home&view=IndexAjax&mode=showupdatecomments&record={$UPDATE->getParent()->getId()}">Comments</a>
                                  		</div>
                              		</div>

								{/if}*}-->
                          </div>
       			</div>			                   
      		</aside>		                    
	</section>
	{/foreach}
{else}
	No Updates Available
{/if}