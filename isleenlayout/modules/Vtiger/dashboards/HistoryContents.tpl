
	{if $HISTORIES neq false}
		{foreach key=$index item=HISTORY from=$HISTORIES}
			{assign var=MODELNAME value=get_class($HISTORY)}
			{if $MODELNAME == 'ModTracker_Record_Model'}
				{assign var=USER value=$HISTORY->getModifiedBy()}
				{assign var=TIME value=$HISTORY->getActivityTime()}
				{assign var=PARENT value=$HISTORY->getParent()}
				{assign var=MOD_NAME value=$HISTORY->getParent()->getModule()->getName()}
				{assign var=SINGLE_MODULE_NAME value='SINGLE_'|cat:$MOD_NAME}
				{assign var=TRANSLATED_MODULE_NAME value = vtranslate($SINGLE_MODULE_NAME ,$MOD_NAME)}
				
				{*{if $HISTORY@first}*}
					{assign var=TEMP_TIME value = $HISTORY->getActivityTime()}
					<h5 class="pull-right">{$TIME|date_format:"d M Y"}</h5>
				{if $HISTORY@iteration is even by 1}
					<div class="activity terques">
                          <span  style="background-color:{$HISTORY->getParent()->getModule()->getColor()}">
                                <i class="fa {$HISTORY->getParent()->getModule()->getIcon()}"></i>
                          </span>
                          <div class="activity-desk">
                                <div class="panel">
                                      <div class="panel-body">
                                              <div class="arrow"></div>
                                              <i class=" fa fa-clock-o"></i>
                                              <h4  style="color:{$HISTORY->getParent()->getModule()->getColor()}">{$TIME|date_format:"h:i A"}</h4>
												{assign var=DETAILVIEW_URL value=$PARENT->getDetailViewUrl()}
                                              <p>{if $HISTORY->isUpdate()}
												{assign var=FIELDS value=$HISTORY->getFieldInstances()}
												{$USER->getName()}
												{else if $HISTORY->isCreate()}
													{$USER->getName()} {vtranslate('LBL_ADDED')} <a class="cursorPointer" {if stripos($DETAILVIEW_URL, 'javascript:')===0} 
													onclick='{$DETAILVIEW_URL|substr:strlen("javascript:")}' {else} onclick='window.location.href="{$DETAILVIEW_URL}"' {/if}>
													{$PARENT->getName()}</a>
												{/if}
												</p>
                                      </div>
                                 </div>
                           </div>
                     </div>
				{else}
				<div class="activity alt">
                          <span  style="background-color:{$HISTORY->getParent()->getModule()->getColor()}">
                                <i class="fa {$HISTORY->getParent()->getModule()->getIcon()}"></i>
                          </span>
                          <div class="activity-desk">
                                <div class="panel">
                                      <div class="panel-body">
                                              <div class="arrow-alt"></div>
                                              <i class=" fa fa-clock-o"></i>
                                              <h4  style="color:{$HISTORY->getParent()->getModule()->getColor()}">{$TIME|date_format:"h:i A"}</h4>
												{assign var=DETAILVIEW_URL value=$PARENT->getDetailViewUrl()}
                                              <p>{if $HISTORY->isUpdate()}
												{assign var=FIELDS value=$HISTORY->getFieldInstances()}
												{$USER->getName()}
												{else if $HISTORY->isCreate()}
													{$USER->getName()} {vtranslate('LBL_ADDED')} <a class="cursorPointer" {if stripos($DETAILVIEW_URL, 'javascript:')===0} 
													onclick='{$DETAILVIEW_URL|substr:strlen("javascript:")}' {else} onclick='window.location.href="{$DETAILVIEW_URL}"' {/if}>
													{$PARENT->getName()}</a>
												{/if}
												</p>
                                      </div>
                                 </div>
                           </div>
                     </div>
				
				{/if}
				
			{*	{elseif $TEMP_TIME|date_format:"d M Y"|strtotime eq $TIME|date_format:"d M Y"|strtotime}
					<div class="activity alt purple">
                          <span>
                                <i class="fa {$HISTORY->getParent()->getModule()->getIcon()}"></i>
                          </span>
                          <div class="activity-desk">
                                <div class="panel">
                                      <div class="panel-body">
                                              <div class="arrow-alt"></div>
                                              <i class=" fa fa-clock-o"></i>
                                              <h4>{$TIME|date_format:"h:i A"}</h4>
												{assign var=DETAILVIEW_URL value=$PARENT->getDetailViewUrl()}
                                              <p>{if $HISTORY->isUpdate()}
												{assign var=FIELDS value=$HISTORY->getFieldInstances()}
												{$USER->getName()}
												{else if $HISTORY->isCreate()}
													{$USER->getName()} {vtranslate('LBL_ADDED')} <a class="cursorPointer" {if stripos($DETAILVIEW_URL, 'javascript:')===0} 
													onclick='{$DETAILVIEW_URL|substr:strlen("javascript:")}' {else} onclick='window.location.href="{$DETAILVIEW_URL}"' {/if}>
													{$PARENT->getName()}</a>
												{/if}
												</p>
                                      </div>
                                 </div>
                           </div>
                     </div>	
				{else}
					{assign var=TEMP_TIME value = $HISTORY->getActivityTime()}
					<h5 class="pull-right">{$TIME|date_format:"d M Y"}</h5>
					<div class="activity terques">
                          <span>
                                <i class="fa {$HISTORY->getParent()->getModule()->getIcon()}"></i>
                          </span>
                          <div class="activity-desk">
                                <div class="panel">
                                      <div class="panel-body">
                                              <div class="arrow"></div>
                                              <i class=" fa fa-clock-o"></i>
                                              <h4>{$TIME|date_format:"h:i A"}</h4>
												{assign var=DETAILVIEW_URL value=$PARENT->getDetailViewUrl()}
                                              <p>{if $HISTORY->isUpdate()}
												{assign var=FIELDS value=$HISTORY->getFieldInstances()}
												{$USER->getName()}
												{else if $HISTORY->isCreate()}
													{$USER->getName()} {vtranslate('LBL_ADDED')} <a class="cursorPointer" {if stripos($DETAILVIEW_URL, 'javascript:')===0} 
													onclick='{$DETAILVIEW_URL|substr:strlen("javascript:")}' {else} onclick='window.location.href="{$DETAILVIEW_URL}"' {/if}>
													{$PARENT->getName()}</a>
												{/if}
												</p>
                                      </div>
                                 </div>
                           </div>
                     </div>
					{/if}*}
			{/if}
			
		{/foreach}
	{else}
	<span class="noDataMsg">
		{vtranslate('LBL_NO_UPDATES_OR_COMMENTS', $MODULE_NAME)}
	</span>
	{/if}