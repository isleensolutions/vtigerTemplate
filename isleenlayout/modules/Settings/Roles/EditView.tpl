{*+***********************************************************************************
* The contents of this file are subject to the vtiger CRM Public License Version 1.0
* ("License"); You may not use this file except in compliance with the License
* The Original Code is:  vtiger CRM Open Source
* The Initial Developer of the Original Code is vtiger.
* Portions created by vtiger are Copyright (C) vtiger.
* All Rights Reserved.
*************************************************************************************}
{strip}
	<div class="container-fluid">
		<label class="themeTextColor font-x-x-large">{vtranslate($MODULE, $QUALIFIED_MODULE)}</label>
		<hr>

		<form name="EditRole" action="index.php" method="post" id="EditView" class="form-horizontal FloatWidth">
			<input type="hidden" name="module" value="Roles">
			<input type="hidden" name="action" value="Save">
			<input type="hidden" name="parent" value="Settings">
			{assign var=RECORD_ID value=$RECORD_MODEL->getId()}
			<input type="hidden" name="record" value="{$RECORD_ID}" />
			<input type="hidden" name="mode" value="{$MODE}">
			<input type="hidden" name="profile_directly_related_to_role_id" value="{$PROFILE_ID}" />
			{assign var=HAS_PARENT value="{if $RECORD_MODEL->getParent()}true{/if}"}
			{if $HAS_PARENT}
				<input type="hidden" name="parent_roleid" value="{$RECORD_MODEL->getParent()->getId()}">
			{/if}

			<div class="row-fluid FloatWidth">
				<div class="row-fluid FloatWidth m-bot15">
					<label class="fieldLabel col-md-3"><strong>{vtranslate('LBL_NAME', $QUALIFIED_MODULE)}<span class="redColor">*</span>: </strong></label>
					<div class="col-md-6">
						<input type="text" class="fieldValue form-control" name="rolename" id="profilename" value="{$RECORD_MODEL->getName()}" data-validation-engine='validate[required]'  />
					</div>
				</div>
				<div class="row-fluid FloatWidth m-bot15">
					<label class="fieldLabel col-md-3"><strong>{vtranslate('LBL_REPORTS_TO', $QUALIFIED_MODULE)}: </strong></label>
					<div class="col-md-6 fieldValue">
						<input type="hidden" name="parent_roleid" {if $HAS_PARENT}value="{$RECORD_MODEL->getParent()->getId()}"{/if}>
						<input type="text" class="input-large form-control" name="parent_roleid_display" {if $HAS_PARENT}value="{$RECORD_MODEL->getParent()->getName()}"{/if} readonly>
					</div>
				</div>
                <div class="row-fluid FloatWidth m-bot15">
					<label class="fieldLabel col-md-3"><strong>{vtranslate('LBL_CAN_ASSIGN_RECORDS_TO', $QUALIFIED_MODULE)}: </strong></label>
					<div class="row-fluid col-md-9 fieldValue">
						<div class="span col-md-2 paddingLeftRight">
							<input type="radio" value="1"{if !$RECORD_MODEL->get('allowassignedrecordsto')} checked=""{/if} {if $RECORD_MODEL->get('allowassignedrecordsto') eq '1'} checked="" {/if} name="allowassignedrecordsto" data-handler="new" class="alignTop"/>&nbsp;<span>{vtranslate('LBL_ALL_USERS',$QUALIFIED_MODULE)}</span>
						</div>                        
						<div class="span col-md-5 paddingLeftRight">
							<input type="radio" value="2" {if $RECORD_MODEL->get('allowassignedrecordsto') eq '2'} checked="" {/if} name="allowassignedrecordsto" data-handler="new" class="alignTop"/>&nbsp;<span>{vtranslate('LBL_USERS_WITH_SAME_OR_LOWER_LEVEL',$QUALIFIED_MODULE)}</span>
						</div>                        
						<div class="span col-md-5 paddingRight">
							<input type="radio" value="3" {if $RECORD_MODEL->get('allowassignedrecordsto') eq '3'} checked="" {/if} name="allowassignedrecordsto" data-handler="new" class="alignTop"/>&nbsp;<span>{vtranslate('LBL_USERS_WITH_LOWER_LEVEL',$QUALIFIED_MODULE)}</span>
						</div>
				</div>
                </div>
				<div class="row-fluid FloatWidth m-bot15">
					<label class="fieldLabel col-md-3"><strong>{vtranslate('LBL_PRIVILEGES',$QUALIFIED_MODULE)}:</strong></label>
					<div class="row-fluid col-md-9 fieldValue">
						<div class="span col-md-6 paddingLeftRight">
							<input type="radio" value="1" {if $PROFILE_DIRECTLY_RELATED_TO_ROLE} checked="" {/if} name="profile_directly_related_to_role" data-handler="new" class="alignTop"/>&nbsp;<span>{vtranslate('LBL_ASSIGN_NEW_PRIVILEGES',$QUALIFIED_MODULE)}</span>
						</div>                     
						<div class="span col-md-6 paddingLeftRight">
							<input type="radio" value="0" {if $PROFILE_DIRECTLY_RELATED_TO_ROLE eq false} checked="" {/if} name="profile_directly_related_to_role" data-handler="existing" class="alignTop"/>&nbsp;<span>{vtranslate('LBL_ASSIGN_EXISTING_PRIVILEGES',$QUALIFIED_MODULE)}</span>
						</div>
					</div>
				</div>
				
				<div class="row-fluid" data-content="new">
					<div class="fieldValue FloatWidth contentsBackground padding1per">
					</div>
				</div><br>
				<div class="row-fluid" data-content="existing">
					<div class="fieldValue row-fluid">
						{assign var="ROLE_PROFILES" value=$RECORD_MODEL->getProfiles()}
						<select class="select2" multiple="true" id="profilesList" name="profiles[]" data-placeholder="{vtranslate('LBL_CHOOSE_PROFILES',$QUALIFIED_MODULE)}" style="width: 800px">
							{foreach from=$ALL_PROFILES item=PROFILE}
								{if $PROFILE->isDirectlyRelated() eq false}
									<option value="{$PROFILE->getId()}" {if isset($ROLE_PROFILES[$PROFILE->getId()])}selected="true"{/if}>{$PROFILE->getName()}</option>
								{/if}
							{/foreach}
						</select>
					</div>
				</div><br>
                
			</div>

			<div class="pull-right">
				<button class="btn btn-success" type="submit" style="margin-right:5px;">{vtranslate('LBL_SAVE',$MODULE)}</button>
				<a class="cancelLink" onclick="javascript:window.history.back();" type="reset">Cancel</a>
			</div>
		</form>
	</div>
{/strip}


