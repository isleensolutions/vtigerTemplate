                        <a data-toggle="dropdown" class="dropdown-toggle" href="#" title="Notification" id="notification-read" ids='{$IDS}'>

                            <i class="fa fa-bell-o"></i>
							{if $COUNT neq 0}
                            <span class="badge bg-warning" id="notify_count">{$COUNT}</span>
							{/if}
                        </a>
                        <div class="dropdown-menu extended">
                        	<ul class="NotificationHeader">
                        		 <div class="notify-arrow notify-arrow-yellow"></div>
								{if $COUNT neq 0}
	                            <li>
	                                <p class="yellow">You have {$COUNT} new notifications</p>
	                            </li>
								{else}
								<li>
	                                <p class="yellow">Notifications</p>
	                            </li>
                        	</ul>
	                        <ul class="notification">
	                           
								{/if}
								{if !empty($NOTIFICATIONS)}
								{foreach item=NOTIFY from=$NOTIFICATIONS}
								{assign var=SINGLE_MODULE_NAME value=$NOTIFY->getParent()->getModule()->getSingularLabelKey()}
								{assign var=SINGLE_MODULE value=$NOTIFY->getParent()->getModuleName()}	
									{if $NOTIFY->isCreate() eq true}
									<li>
										<a class="col-lg-12" href="{$NOTIFY->getParent()->getDetailViewUrl()}">
											<span class="col-md-1 label label-success"><i class="fa {$NOTIFY->getParent()->getModule()->getIcon()}"></i></span>
											<span class="col-lg-11 paddingRight">
												<span class="col-lg-12 paddingLeftRight lineBreak"  style="color:#000000">{$NOTIFY->getModifiedBy()->getName()} {vtranslate('LBL_CREATED', $MODULE_NAME)} a {vtranslate($SINGLE_MODULE_NAME, $SINGLE_MODULE)}</span>
												<span class="col-lg-12 paddingLeftRight small italic"  style="color:#808080">{Vtiger_Util_Helper::formatDateDiffInStrings($NOTIFY->getActivityTime())}</span>
	                                    	</span>
										</a>
									</li>
									{/if}
								{/foreach}
								{/if}
	                           
	                        </ul>
                        </div>
