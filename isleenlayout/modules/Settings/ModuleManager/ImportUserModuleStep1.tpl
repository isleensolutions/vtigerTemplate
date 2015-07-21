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
<div class="container-fluid" id="importModules">
	<div class="widget_header row-fluid">
		<h3>{vtranslate('LBL_IMPORT_MODULE_FROM_FILE', $QUALIFIED_MODULE)}</h3>
	</div><hr>
	<div class="contents">
		<div class="row-fluid">
			<form class="form-horizontal contentsBackground" id="importUserModule" name="importUserModule" action='index.php' method=POST enctype="multipart/form-data">
				<input type="hidden" name="module" value="ModuleManager" />
				<input type="hidden" name="moduleAction" value="Import"/>
				<input type="hidden" name="parent" value="Settings" />
				<input type="hidden" name="view" value="ModuleImport" />
				<input type="hidden" name="mode" value="importUserModuleStep2" />
				<div name='uploadUserModule'>
					<div class="modal-body tabbable">
						<div class="tab-content massEditContent">
							<table class="massEditTable table">
								<tr class="FloatWidth">
									<td class="fieldLabel alignMiddle col-md-4" style="border-top: medium none;">{vtranslate('LBL_IMPORT_MODULE_FROM_FILE', $QUALIFIED_MODULE)}</td>
									<td class="fieldValue  col-md-6" style="border-top: medium none;">
										<div class="fileupload fileupload-new" data-provides="fileupload">
											<span class="btn btn-white btn-file">
                                                <span class="fileupload-new"><i class="fa fa-paper-clip"></i> 		Select file
                                                </span>
                                                <span class="fileupload-exists">
                                                	<i class="fa fa-undo"></i> Change
                                                </span>
                                                <input type="file" name="moduleZip" id="moduleZip"  class="default" size="80px" data-validation-engine="validate[required, funcCall[Vtiger_Base_Validator_Js.invokeValidation]]"
											  	data-validator={Zend_Json::encode([['name'=>'UploadModuleZip']])}
												/>                                                
											</span>
                                            <span class="fileupload-preview" style="margin-left:5px;"></span>
										</div>
									</td>										
								</tr>
							</table>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div class=" pull-right cancelLinkContainer">
						<a class="cancelLink" href="index.php?module=ModuleManager&parent=Settings&view=List">{vtranslate('LBL_CANCEL', $QUALIFIED_MODULE)}</a>
					</div>
					<button class="btn btn-success" type="submit" name="saveButton"><strong>{vtranslate('LBL_IMPORT', $MODULE)}</strong></button>
				</div>
			</form>
		</div>
	</div>
</div>
{/strip}
