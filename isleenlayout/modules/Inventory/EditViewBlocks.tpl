{*<!--
/*********************************************************************************
  ** The contents of this file are subject to the vtiger CRM Public License Version 1.0
   * ("License"); You may not use this file except in compliance with the License
   * The Original Code is:  vtiger CRM Open Source
   * The Initial Developer of the Original Code is vtiger.
   * Portions created by vtiger are Copyright (C) vtiger.
   * All Rights Reserved.
  *
 ********************************************************************************/
-->*}

{strip}
<section id="main-content" style="min-height: 439px;">
	<section class="wrapper site-min-height">
		<section class="panel">

			<div class='editViewContainer container-fluid'>
				<form class="form-horizontal recordEditView  m-bot15" id="EditView" name="EditView" method="post" action="index.php" enctype="multipart/form-data">
					{assign var=WIDTHTYPE value=$USER_MODEL->get('rowheight')}
					{if !empty($PICKIST_DEPENDENCY_DATASOURCE)}
						<input type="hidden" name="picklistDependency" value='{Vtiger_Util_Helper::toSafeHTML($PICKIST_DEPENDENCY_DATASOURCE)}' />
					{/if}
					<input type="hidden" name="module" value="{$MODULE}" />
					<input type="hidden" name="action" value="Save" />
					<input type="hidden" name="record" value="{$RECORD_ID}" />
					{if $IS_RELATION_OPERATION }
						<input type="hidden" name="sourceModule" value="{$SOURCE_MODULE}" />
						<input type="hidden" name="sourceRecord" value="{$SOURCE_RECORD}" />
						<input type="hidden" name="relationOperation" value="{$IS_RELATION_OPERATION}" />
					{/if}
					<div class="contentHeader row-fluid">
					{assign var=SINGLE_MODULE_NAME value='SINGLE_'|cat:$MODULE}
					{if $RECORD_ID neq ''}
						<h3 title="{vtranslate('LBL_EDITING', $MODULE)} {vtranslate($SINGLE_MODULE_NAME, $MODULE)} {$RECORD_STRUCTURE_MODEL->getRecordName()}">{vtranslate('LBL_EDITING', $MODULE)} {vtranslate($SINGLE_MODULE_NAME, $MODULE)} - {$RECORD_STRUCTURE_MODEL->getRecordName()}</h3>
			            <hr>
			        {else}
						<h3>{vtranslate('LBL_CREATING_NEW', $MODULE)} {vtranslate($SINGLE_MODULE_NAME, $MODULE)}</h3>
			            <hr>
					{/if}
						<span class="pull-right m-bot15">
							<button class="btn btn-success" type="submit" style="margin-right:5px;"><strong>{vtranslate('LBL_SAVE_NEW', $MODULE)}</strong></button>
							<a class="cancelLink" type="reset" onclick="javascript:window.history.back();">{vtranslate('LBL_CANCEL', $MODULE)}</a>
						</span>
					</div>
					{foreach key=BLOCK_LABEL item=BLOCK_FIELDS from=$RECORD_STRUCTURE name="EditViewBlockLevelLoop"}
						{if $BLOCK_FIELDS|@count lte 0}{continue}{/if}
						<table class="table table-inbox blockContainer showInlineTable quote">
						<tr class="FloatWidth">
							<th class="blockHeader" colspan="4">{vtranslate($BLOCK_LABEL, $MODULE)}</th>
						</tr>
						{if ($BLOCK_LABEL eq 'LBL_ADDRESS_INFORMATION') and ($MODULE neq 'PurchaseOrder') }
							<tr class="FloatWidth">
								<td class="fieldLabel col-md-3 {$WIDTHTYPE}" name="copyHeader1">
									<label class="muted pull-right marginRight10px" name="togglingHeader">{vtranslate('LBL_BILLING_ADDRESS_FROM', $MODULE)}</label>
								</td>
								<td class="fieldValue col-md-3 {$WIDTHTYPE}" name="copyAddress1">
									<div class="row-fluid">
										<div class="col-md-12">
											<span class="row-fluid margin0px">
												<label class="radio">
												  <input type="radio" name="copyAddressFromRight" class="accountAddress" data-copy-address="billing" checked="">{vtranslate('SINGLE_Accounts', $MODULE)}
												</label>
											</span>
											<span class="row-fluid margin0px">
												<label class="radio">
												  <input type="radio" name="copyAddressFromRight" class="contactAddress" data-copy-address="billing" checked="">{vtranslate('SINGLE_Contacts', $MODULE)}
												</label>
											</span>
											<span class="row-fluid margin0px" name="togglingAddressContainerRight">
												<label class="radio">
											  <input type="radio" name="copyAddressFromRight" class="shippingAddress" data-target="shipping" checked="">{vtranslate('Shipping Address', $MODULE)}
												</label>
											</span>
											<span class="row-fluid margin0px hide" name="togglingAddressContainerLeft">
												<label class="radio">
											  <input type="radio" name="copyAddressFromRight"  class="billingAddress" data-target="billing" checked="">{vtranslate('Billing Address', $MODULE)}
												</label>
											</span>
										</div>
									</div>
								</td>
								<td class="fieldLabel col-md-3 {$WIDTHTYPE}" name="copyHeader2">
									<label class="muted pull-right marginRight10px" name="togglingHeader">{vtranslate('LBL_SHIPPING_ADDRESS_FROM', $MODULE)}</label>
								</td>
								<td class="fieldValue col-md-3 {$WIDTHTYPE}" name="copyAddress2">
									<div class="row-fluid">
										<div class="col-md-12">
											<span class="row-fluid margin0px">
												<label class="radio">
												  <input type="radio" name="copyAddressFromLeft" class="accountAddress" data-copy-address="shipping" checked="">{vtranslate('SINGLE_Accounts', $MODULE)}
												</label>
											</span>
											<span class="row-fluid margin0px">
												<label class="radio">
												  <input type="radio" name="copyAddressFromLeft" class="contactAddress" data-copy-address="shipping" checked="">{vtranslate('SINGLE_Contacts', $MODULE)}
												</label>
											</span>
											<span class="row-fluid margin0px" name="togglingAddressContainerLeft">
												<label class="radio">
											  <input type="radio" name="copyAddressFromLeft" class="billingAddress" data-target="billing" checked="">{vtranslate('Billing Address', $MODULE)}
												</label>
											</span>
											<span class="row-fluid margin0px hide" name="togglingAddressContainerRight">
												<label class="radio">
											  <input type="radio" name="copyAddressFromLeft" class="shippingAddress" data-target="shipping" checked="">{vtranslate('Shipping Address', $MODULE)}
												</label>
											</span>
										</div>
									</div>
								</td>
							</tr>
						{/if}
							<tr class="FloatWidth">
							{assign var=COUNTER value=0}
							{foreach key=FIELD_NAME item=FIELD_MODEL from=$BLOCK_FIELDS name=blockfields}

								{assign var="isReferenceField" value=$FIELD_MODEL->getFieldDataType()}
								{if $FIELD_MODEL->get('uitype') eq "20" or $FIELD_MODEL->get('uitype') eq "19"}
									{if $COUNTER eq '1'}
										<td class="col-md-3 {$WIDTHTYPE}" col></td>
										<td class="col-md-3 {$WIDTH_TYPE_CLASSSES[$WIDTHTYPE]}"></td>
										

							</tr>
							<tr class="FloatWidth">
									{assign var=COUNTER value=0}
								{/if}
							{/if}
							{if $COUNTER eq 2}
							</tr>
							<tr class="FloatWidth">
								{assign var=COUNTER value=1}
								{else}
									{assign var=COUNTER value=$COUNTER+1}
								{/if}
								<td class="fieldLabel col-md-3 {$WIDTHTYPE}">
									{if $isReferenceField neq "reference"}<label class="muted pull-right marginRight10px">{/if}
										{if $FIELD_MODEL->isMandatory() eq true && $isReferenceField neq "reference"} <span class="redColor">*</span> {/if}
										{if $isReferenceField eq "reference"}
											{assign var="REFERENCE_LIST" value=$FIELD_MODEL->getReferenceList()}
											{assign var="REFERENCE_LIST_COUNT" value=count($REFERENCE_LIST)}
											{if $REFERENCE_LIST_COUNT > 1}
												{assign var="DISPLAYID" value=$FIELD_MODEL->get('fieldvalue')}
												{assign var="REFERENCED_MODULE_STRUCT" value=$FIELD_MODEL->getUITypeModel()->getReferenceModule($DISPLAYID)}
												{if !empty($REFERENCED_MODULE_STRUCT)}
													{assign var="REFERENCED_MODULE_NAME" value=$REFERENCED_MODULE_STRUCT->get('name')}
												{/if}
												<span class="pull-right">
													{if $FIELD_MODEL->isMandatory() eq true} <span class="redColor">*</span> {/if}
													<select class="chzn-select referenceModulesList streched" style="width:140px;">
														<optgroup>
															{foreach key=index item=value from=$REFERENCE_LIST}
																<option value="{$value}" {if $value eq $REFERENCED_MODULE_NAME} selected {/if}>{vtranslate($value, $MODULE)}</option>
															{/foreach}
														</optgroup>
													</select>
												</span>
											{else}
												<label class="muted pull-right marginRight10px">{if $FIELD_MODEL->isMandatory() eq true} <span class="redColor">*</span> {/if}{vtranslate($FIELD_MODEL->get('label'), $MODULE)}</label>
											{/if}
										{else if $FIELD_MODEL->get('uitype') eq "83"}
											{include file=vtemplate_path($FIELD_MODEL->getUITypeModel()->getTemplateName(),$MODULE) COUNTER=$COUNTER}
										{else}
											{vtranslate($FIELD_MODEL->get('label'), $MODULE)}
										{/if}
									{if $isReferenceField neq "reference"}</label>{/if}
								</td>
								{if $FIELD_MODEL->get('uitype') neq "83"}
									<td class="fieldValue col-md-3 {$WIDTHTYPE}" {if $FIELD_MODEL->get('uitype') eq '19'} colspan="3" {assign var=COUNTER value=$COUNTER+1} {/if} {if $FIELD_MODEL->get('uitype') eq '20'} colspan="3"{/if}>
										{include file=vtemplate_path($FIELD_MODEL->getUITypeModel()->getTemplateName(),$MODULE) BLOCK_FIELDS=$BLOCK_FIELDS}
									</td>
								{/if}
								{if $BLOCK_FIELDS|@count eq 1 and $FIELD_MODEL->get('uitype') neq "19" and $FIELD_MODEL->get('uitype') neq "20" and $FIELD_MODEL->get('uitype') neq "30" and $FIELD_MODEL->get('name') neq "recurringtype"}
									<td class="col-md-3 {$WIDTHTYPE}"></td>
									<td class="col-md-3 {$WIDTHTYPE}"></td>
								{/if}
							{/foreach}
							</tr>
						</table>
						<br>
					{/foreach}
{/strip}