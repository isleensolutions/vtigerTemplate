{strip}
<section id="main-content" style="min-height: 437px;">
	<section class="wrapper site-min-height">
		<section class="panel">
			<div class="panel-body">
				<div class='editViewContainer'>
					<form class="form-horizontal recordEditView" id="EditView" name="EditView" method="post" action="index.php">
						{assign var=QUALIFIED_MODULE_NAME value={$MODULE}}
						{assign var=WIDTHTYPE value=$USER_MODEL->get('rowheight')}
						<input type="hidden" name="module" value="{$MODULE}" />
						<input type="hidden" name="action" value="Save" />
						<input type="hidden" name="record" value="{$RECORD_ID}" />

						<div class="contentHeader row-fluid FloatWidth m-bot15">
						{assign var=SINGLE_MODULE_NAME value='SINGLE_'|cat:$MODULE}
						{if $RECORD_ID neq ''}
							<span class="col-md-8  font-x-x-large textOverflowEllipsis" title="{vtranslate('LBL_EDITING', $MODULE)} {vtranslate($SINGLE_MODULE_NAME, $MODULE)} {decode_html($RECORD->get('templatename'))}">{vtranslate('LBL_EDITING', $MODULE)} {vtranslate($SINGLE_MODULE_NAME, $MODULE)} - {decode_html($RECORD->get('templatename'))}</span>
						{else}
							<span class="col-md-8  font-x-x-large textOverflowEllipsis">{vtranslate('LBL_CREATING_NEW', $MODULE)} {vtranslate($SINGLE_MODULE_NAME, $MODULE)}</span>
						{/if}
							<span class="pull-right">
								<button class="btn btn-success" type="submit" style="margin-right:5px"><strong>{vtranslate('LBL_SAVE', $MODULE)}</strong></button>
								<a class="cancelLink" type="reset" onclick="javascript:window.history.back();">{vtranslate('LBL_CANCEL', $MODULE)}</a>
							</span>
						</div>
						<table class="table table-inbox blockContainer showInlineTable FloatWidth m-bot15">
							<tr>
								<th class="blockHeader" colspan="4">{vtranslate('SINGLE_EmailTemplates', $MODULE)}</th>
							</tr>
							<tr>
								<td class="fieldLabel {$WIDTHTYPE}"><span class="redColor">*</span>{vtranslate('LBL_TEMPLATE_NAME', $MODULE)}</td>
								<td class="fieldValue {$WIDTHTYPE}">
									<input id="{$MODULE}_editView_fieldName_templatename" type="text" class="input-large form-control" data-validation-engine="validate[required]" name="templatename" value="{decode_html($RECORD->get('templatename'))}">
							</tr>
							<tr>
								<td class="fieldLabel {$WIDTHTYPE}">{vtranslate('LBL_DESCRIPTION', $MODULE)}</td>
								<td class="fieldValue {$WIDTHTYPE}"><textarea class="row-fluid  form-control" id="description" name="description">{decode_html($RECORD->get('description'))}</textarea></td>
							</tr>
						</table>
						<table class="table table-inbox blockContainer showInlineTable FloatWidth m-bot15">
							<tr>
								<th class="blockHeader" colspan="4">{vtranslate('LBL_EMAIL_TEMPLATE', $MODULE)} {vtranslate('LBL_DESCRIPTION', $MODULE)}</th>
							</tr>
							<tr>
								<td class="fieldLabel {$WIDTHTYPE}"><span class="redColor">*</span>{vtranslate('LBL_SUBJECT', $MODULE)}</td>
								<td class="fieldValue {$WIDTHTYPE}">
									<input id="{$MODULE}_editView_fieldName_subject" type="text" class="input-large form-control" data-validation-engine="validate[required]" name="subject" value="{decode_html($RECORD->get('subject'))}">
								</td>
							</tr>
							<tr>
								<td class="fieldLabel {$WIDTHTYPE}">{vtranslate('LBL_SELECT_FIELD_TYPE', $MODULE)}</td>
								<td class="fieldValue {$WIDTHTYPE}">
									<span class="filterContainer select_filtercontainer" >
										<input type=hidden name="moduleFields" data-value='{ZEND_JSON::encode($ALL_FIELDS)}' />
										<span class="col-md-4 conditionRow">
											<select class="chzn-select" name="modulename" >
												<option value="none">{vtranslate('LBL_SELECT_MODULE',$MODULE)}</option>
												{foreach key=MODULENAME item=FILEDS from=$ALL_FIELDS}
													{if $MODULENAME eq '0'}
														<option value="generalFields">{vtranslate('LBL_GENERAL_FIELDS', $MODULE)}</option>
													{else}
														<option value="{$MODULENAME}">{vtranslate($MODULENAME, $MODULENAME)}</option>
													{/if}
												{/foreach}
											</select>
										</span>&nbsp;&nbsp;
										<span class="col-md-6">
											<select class="chzn-select col-md-5" id="templateFields" name="templateFields">
												<option value="">{vtranslate('LBL_NONE',$MODULE)}</option>
											</select>
										</span>
									</span>
									
								</td>
							</tr>
						</table>
						<div class="row-fluid padding-bottom1per">
							<textarea class="form-control" id="templatecontent" name="templatecontent">{$RECORD->get('body')}</textarea>
						</div>
						{include file="EditViewActions.tpl"|@vtemplate_path:$MODULE}
					</form>
{/strip}
