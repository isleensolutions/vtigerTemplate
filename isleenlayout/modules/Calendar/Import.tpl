{strip}
<div id="importRecordsContainer" class='modelContainer'>
	<div class="modal-header">
		<button data-dismiss="modal" class="close" title="{vtranslate('LBL_CLOSE')}">x</button>
		<h3 id="importRecordHeader">{vtranslate('LBL_IMPORT_RECORDS', $MODULE)}</h3>
	</div>
	<form method="POST" action="index.php" enctype="multipart/form-data" id="ical_import" name="ical_import">
		<input type="hidden" value="{$MODULE}" name="module">		
		<div name='importRecordsContent'>
			<input type="hidden" value="Import" name="view">
			<input type="hidden" value="importResult" name="mode">
			<div class="modal-body tabbable">
				<div class="tab-content massEditContent">
					<table class="massEditTable table table-bordered">
						<tr>
							<td class="fieldLabel alignMiddle">{vtranslate('LBL_IMPORT_RECORDS', $MODULE)}</td>
							<td class="fieldValue">								
								<div class="form-group">       
                                    <div class="fileupload fileupload-new" data-provides="fileupload">
                                        <span class="btn btn-white btn-file">
                                            <span class="fileupload-new"><i class="fa fa-paper-clip"></i> Select file</span>
                                            <span class="fileupload-exists"><i class="fa fa-undo"></i> Change</span>
                                            <input type="file" data-validation-engine="validate[required]" id="import_file" name="import_file" class="small">
                                        </span>
                                        <span class="fileupload-preview" style="margin-left:5px;"></span>
                                        <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                                    </div>
                                </div>
                            </td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		<div class="modal-footer">
		<div class=" pull-right cancelLinkContainer">
			<a class="cancelLink" type="reset" data-dismiss="modal">{vtranslate('LBL_CANCEL', $MODULE)}</a>
		</div>
		<button class="btn btn-success" type="submit" name="saveButton"><strong>{vtranslate('LBL_IMPORT', $MODULE)}</strong></button>
	</div>
	</form>
</div>
{/strip}