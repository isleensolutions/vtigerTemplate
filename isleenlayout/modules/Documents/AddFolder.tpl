{strip}
    <div class="model modelContainer">
        <div class="modal-header contentsBackground">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h3>{vtranslate('LBL_ADD_NEW_FOLDER', $MODULE)}</h3>
        </div>
        <form class="form-horizontal" id="addDocumentsFolder" method="post" action="index.php">
            <input type="hidden" name="module" value="{$MODULE}" />
            <input type="hidden" name="action" value="Folder" />
            <input type="hidden" name="mode" value="save" />
            <div class="modal-body">
                <div class="row-fluid">
                    <div class="control-group">
                        <label class="control-label col-md-6">
                            <span class="redColor">*</span>
                            {vtranslate('LBL_FOLDER_NAME', $MODULE)}
                        </label>
                        <div class="controls col-md-6">
                            <input class="form-control m-bot15" data-validator='{Zend_Json::encode([['name'=>'FolderName']])}' data-validation-engine="validate[required, funcCall[Vtiger_Base_Validator_Js.invokeValidation]]" id="documentsFolderName" name="foldername" type="text" value=""/>
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label col-md-6">
                            {vtranslate('LBL_FOLDER_DESCRIPTION', $MODULE)}
                        </label>
                        <div class="controls col-md-6">
                            <textarea rows="1" class="input-xxlarge fieldValue form-control" name="folderdesc" id="description"></textarea>
                        </div>
                    </div>
                </div>
            </div>
            {include file='ModalFooter.tpl'|@vtemplate_path:$MODULE}
        </form>
    </div>
{/strip}