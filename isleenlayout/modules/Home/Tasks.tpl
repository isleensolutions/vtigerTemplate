                        
					<a data-toggle="dropdown" class="dropdown-toggle" title="Task" href="#">
                            <i class="fa fa-tasks"></i>
                            {if $ACTIVITIES|@count > 0} <span class="badge bg-success">{$ACTIVITIES|@count}</span>{/if}
                        </a>
                        <ul class="dropdown-menu extended tasks-bar">
                            <div class="notify-arrow notify-arrow-green"></div>
							{if !empty($ACTIVITIES)}
                            <li>		
                                <p class="green">You have {if $ACTIVITIES|@count > 1} {$ACTIVITIES|@count} pending tasks {else} {$ACTIVITIES|@count} pending task {/if}</p>
                            </li>
							{foreach item=ACTIVITY from=$ACTIVITIES}
                            <li>
                                <a href="{$ACTIVITY->getDetailViewUrl()}">
                                    <div class="task-info">
                                        <div class="desc">{$ACTIVITY->getName()}</div>	
                                    </div>
                                    <div>
										<span class="FloatWidth" style="padding: 2px;">Starts:{$ACTIVITY->getDisplayValue('date_start')}</span>
										<span class="FloatWidth" style="padding: 2px;">Ends:{$ACTIVITY->getDisplayValue('due_date')} </span>
									</div>	
                                </a>
                            </li>
							{/foreach}
                            <li class="external">
                                <a href="#">See All Tasks</a>
                            </li>
							{else}
							<li>		
                                <p class="green">No Tasks are Pending</p>
                            </li>
							{/if}
                        </ul>