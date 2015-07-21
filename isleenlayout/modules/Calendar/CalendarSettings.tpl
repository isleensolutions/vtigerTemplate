{strip}
<div class='modelContainer calendarSettingsContainer'>
	<div class="modal-header contentsBackground">
		<button data-dismiss="modal" class="close" title="{vtranslate('LBL_CLOSE')}">x</button>
		<h3>{vtranslate('LBL_CALENDAR_SETTINGS', $MODULE)}</h3>
	</div>
	<form class="form-horizontal" id="CalendarSettings" name="CalendarSettings" method="post" action="index.php">
		<input type="hidden" name="module" value="Users" />
		<input type="hidden" name="action" value="SaveCalendarSettings" />
		<input type="hidden" name="record" value="{$RECORD}" />
		<input type=hidden name="timeFormatOptions" data-value='{$DAY_STARTS}' />
		<div class="modal-body calendarModal" name="contents">
			<div class="row-fluid">
				<div class="">&nbsp;</div>	
				<div class="col-md-12">
					{foreach item="FIELD_MODEL" from=$RECORD_STRUCTURE['LBL_CALENDAR_SETTINGS']}
						{assign var=FIELD_NAME value=$FIELD_MODEL->get('name')}
						{assign var=FIELD_VALUE value=$FIELD_MODEL->get('fieldvalue')}
						{if $FIELD_NAME eq 'callduration'}
							{assign var=CALL_DURATION_MODEL value=$FIELD_MODEL}
						{elseif $FIELD_NAME eq 'othereventduration'}
							{assign var=EVENT_DURATION_MODEL value=$FIELD_MODEL}
						{elseif $FIELD_NAME eq 'hour_format'}
							{assign var=HOUR_FORMAT_VALUE value=$FIELD_MODEL->get('fieldvalue')}
						{/if}
						{if $FIELD_NAME neq 'callduration' && $FIELD_NAME neq 'othereventduration'}
							<div class="control-group form-group">
								<label class="control-label col-md-4">{vtranslate($FIELD_MODEL->get('label'),$MODULE)}</label>
								<div class="controls col-md-8">
									{if $FIELD_NAME == 'hour_format' || $FIELD_NAME == 'activity_view'}
										{foreach key=ID item=LABEL from=$FIELD_MODEL->getPicklistValues()}
											{if $LABEL neq 'This Year' }
												<input type="radio" value="{$ID}" {if $FIELD_VALUE eq $ID}checked=""{/if} name="{$FIELD_NAME}" class="alignTop" />&nbsp;{vtranslate($LABEL,$MODULE)}&nbsp;{if $FIELD_NAME eq 'hour_format'}{vtranslate('LBL_HOUR',$MODULE)}{/if}&nbsp;&nbsp;&nbsp;
											{/if}
										{/foreach}	
									{elseif $FIELD_NAME eq 'start_hour'}
										{assign var=DECODED_DAYS_STARTS value=ZEND_JSON::decode($DAY_STARTS)}
										{assign var=PICKLIST_VALUES value=$DECODED_DAYS_STARTS['hour_format'][$HOUR_FORMAT_VALUE][$FIELD_NAME]}
										<select class="select2" name="{$FIELD_NAME}">
											{foreach key=ID item=LABEL from=$PICKLIST_VALUES}
												<option value="{$ID}" {if $FIELD_VALUE eq $ID} selected="" {/if}>{vtranslate($LABEL,$MODULE)}</option>
											{/foreach}
										</select>	
									{else}	
										<select class="select2 form-control" name="{$FIELD_NAME}" {if $FIELD_NAME eq 'time_zone'} style="min-width: 100%" {else} style="min-width: 50%" {/if}>
										{foreach key=ID item=LABEL from=$FIELD_MODEL->getPicklistValues()}
											<option value="{$ID}" {if $FIELD_VALUE eq $ID} selected="" {/if}>{vtranslate($LABEL,$MODULE)}</option>
										{/foreach}	
									</select>
									{/if}
								</div>
							</div>	
						{/if}			
					{/foreach}
					<div class="control-group form-group">
						<label class="control-label  col-md-4">{vtranslate('LBL_DEFAULT_EVENT_DURATION',$MODULE)}</label>
						<div class="controls  col-md-8 calendarselect">
							<span class="alignMiddle" style="float: left;padding: 10px 0 0;width: 8%;">{vtranslate('LBL_CALL',$MODULE)}</span>&nbsp;&nbsp;
							<select class="select2" name="{$CALL_DURATION_MODEL->get('name')}">
								{foreach key=ID item=LABEL from=$CALL_DURATION_MODEL->getPicklistValues()}
									<option value="{$ID}" {if $CALL_DURATION_MODEL->get('fieldvalue') eq $ID} selected="" {/if}>{vtranslate($LABEL,$MODULE)}&nbsp;{vtranslate('LBL_MINUTES',$MODULE)}</option>
								{/foreach}	
							</select>&nbsp;&nbsp;&nbsp;
							<span class="alignMiddle" style="float: left;padding: 10px 0 0;width: 23%;">{vtranslate('LBL_OTHER_EVENTS',$MODULE)}</span>&nbsp;&nbsp;
							<select class="select2" name="{$EVENT_DURATION_MODEL->get('name')}">
								{foreach key=ID item=LABEL from=$EVENT_DURATION_MODEL->getPicklistValues()}
									<option value="{$ID}" {if $EVENT_DURATION_MODEL->get('fieldvalue') eq $ID} selected="" {/if}>{vtranslate($LABEL,$MODULE)}&nbsp;{vtranslate('LBL_MINUTES',$MODULE)}</option>
								{/foreach}	
							</select>
						</div>	
					</div>	
					{assign var=SHARED_TYPE value=$SHAREDTYPE}
					<div class="control-group form-group">
						<label class="control-label  col-md-4">{vtranslate('LBL_CALENDAR_SHARING',$MODULE)}</label>
						<div class="controls  col-md-8">
							<label class="radio inline"><input type="radio" value="private"{if $SHARED_TYPE == 'private'} checked="" {/if} name="sharedtype" />&nbsp;{vtranslate('Private',$MODULE)}&nbsp;</label>
							<label class="radio inline"><input type="radio" value="public" {if $SHARED_TYPE == 'public'} checked="" {/if} name="sharedtype" />&nbsp;{vtranslate('Public',$MODULE)}&nbsp;</label>
							<label class="radio inline"><input type="radio" value="selectedusers" {if $SHARED_TYPE == 'selectedusers'} checked="" {/if} data-sharingtype="selectedusers" name="sharedtype" id="selectedUsers" />&nbsp;{vtranslate('Selected Users',$MODULE)}</label><br><br>
							<select class="select2 row-fluid {if $SHARED_TYPE != 'selectedusers'} hide {/if}" id="selectedUsers" name="sharedIds[]" multiple="" data-placeholder="{vtranslate('LBL_SELECT_USERS',$MODULE)}">
								{foreach key=ID item=USER_MODEL from=$ALL_USERS}
									{if $ID neq $CURRENTUSER_MODEL->get('id') && $ID neq 1}
										<option value="{$ID}" {if array_key_exists($ID, $SHAREDUSERS)} selected="" {/if}>{vtranslate($USER_MODEL->getName(),$MODULE)}</option> 
									{/if}
								{/foreach}	
							</select>	
						</div>	
					</div>
					<br>
				</div>
			</div>				
		</div>	
		{include file='ModalFooter.tpl'|@vtemplate_path:$MODULE}
	</form>
</div>
{/strip}
