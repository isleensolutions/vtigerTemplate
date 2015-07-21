<script type="text/javascript" src="layouts/vlayout/modules/IslDropbox/resources/Edit.js"></script>


<div class="modelContainer">
	<div class="modal-header contentsBackground">
		<button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="Close">x</button>
		<h3>Upload To Dropbox</h3>
	</div>
	<div class="quickCreateContent">
	<form action="index.php" method="post" name="uploadToService">	
		<input type="hidden" value="IslDropbox" name="module">
		<input type="hidden" value="Dropbox" name="serviceProvider">
		<input type="hidden" value="UploadToServiceProvider" name="action">
		<div class="modal-body">
			<div id="uploadToDriveContainer" style="min-height: 290px;min-width: 436px;">
				<input type="file" id="filePicker">
					<div id="uploadFileDetails"></div>
					<div class="uploadFileSizeLimit redColor">Maximum upload size&nbsp;
						<span data-value="20971520" class="maxUploadSize">20MB</span>
					</div>
					<br>

					<div class="dragdrop-dotted" id="dragandrophandler">
						<strong>Drag &amp; Drop File Here</strong>
					</div>
					<br>

					<div id="fieldsContainer">
						<table class="massEditTable table table-bordered">
						<tbody>
						
							<tr>
								<td class="fieldLabel">
									<label class="muted pull-right">Dropbox Folder</label>
								</td>
								<td class="fieldValue">
									<select class="chzn-select chzn-done" name="serviceProviderFolder">
										<option value="root">Root</option>
										{foreach key=ID item=NAME from=$FOLDERS}
										<option value="{$ID}">{$NAME}</option>
										{/foreach}
									</select>
								</td>
							</tr>

							<tr>
							
									<td class="fieldLabel">
								<label class="muted pull-right">
								  Assigned To</label>
									
								</td>
								<td class="fieldValue">
								{assign var=ALL_ACTIVEUSER_LIST value=$USER_MODEL->getAccessibleUsers()}
								{assign var=ALL_ACTIVEGROUP_LIST value=$USER_MODEL->getAccessibleGroups()}
								<select class="chzn-select" data-name="assigned_user_id" name="assigned_user_id" >
									<optgroup label="{vtranslate('LBL_USERS')}">
										
										{foreach key=OWNER_ID item=OWNER_NAME from=$ALL_ACTIVEUSER_LIST}
							                    <option value="{$OWNER_ID}" data-picklistvalue= '{$OWNER_NAME}' data-userId="{$CURRENT_USER_ID}"selected="selected">
							                    {$OWNER_NAME}
							                    </option>
										{/foreach}
									</optgroup>
									<optgroup label="{vtranslate('LBL_GROUPS')}">
										{foreach key=OWNER_ID item=OWNER_NAME from=$ALL_ACTIVEGROUP_LIST}
											<option value="{$OWNER_ID}" data-picklistvalue= '{$OWNER_NAME}'>
											{$OWNER_NAME}
											</option>
										{/foreach}
									</optgroup>
								</select>
							</tr>

						</tbody>
						</table>
					</div>
			
			</div>

		</div><!-- modal body ends -->
	</form>
			
		 <div class="modal-footer quickCreateActions">
			<a data-dismiss="modal" type="reset" class="cancelLink cancelLinkContainer pull-right">Cancel</a>
			<button class="btn btn-success" id="saveToService"><strong>Save</strong>
			</button>
		</div>
		
	</div>
</div>
