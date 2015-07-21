<script type="text/javascript" src="layouts/vlayout/modules/IslDropbox/resources/Edit.js"></script>


<div class="modelContainer">
	<div class="modal-header contentsBackground">
		<button class="close" aria-hidden="true" data-dismiss="modal" type="button" title="Close">x</button>
		<h3>Select From Dropbox</h3>
	</div>
	<div class="quickCreateContent">
		
		<div class="modal-body">
			<div style="min-height: 290px;min-width: 436px;" id="selectFromDriveContainer">
				<input type="hidden" name="serviceProvider" value="Dropbox" />
				<input type="hidden" name="vtigerFolderId" value="1" />
				
				<input type='hidden' data-rootdirid='{$FILES["path"]}' value='{$META_DATA}' name='rootDirContents'>

				<div class="input-append">
				<input type="text" placeholder="Search" name="searchFiles" id="searchService">&nbsp;
				<button class="btn searchDropboxFiles">
				<i class="icon-search"></i>
				</button>
				<button id="gotoRoot" class="btn btn-small pull-right" disabled="disabled">
				<i class="icon-folder-open"></i>&nbsp;Home</button>
				<button id="browseBack" class="btn btn-small pull-right" disabled="disabled">«&nbsp;Back</button>
				</div>
				
				<input type="hidden" value="" name="parentDir">
				<input type="hidden" value="/" name="currentDir">
				<input type="hidden" value="layouts/vlayout/skins/images/File.png" name="fileiconpath">
				<input type="hidden" value="layouts/vlayout/skins/images/Folder.png" name="foldericonpath">
		
				<div id="selectList" class="selectList" style="overflow: hidden; width: auto; height: 250px;">
					<table class="table table-bordered listViewEntriesTable">
						<tbody>
					
								{foreach from="$METADATA" item="FIL"}
								
								<tr class="listViewEntries {if $FIL["is_dir"] eq true}folder{else}file{/if}" data-title="{$FIL['title']}" data-link="{$FIL['link']}" data-fileid="{$FIL['id']}">
								<td class="listViewEntryValue medium" nowrap="">
								{if $FIL["is_dir"] eq true}
								<img style="width:14px !important;height:17px !important;" src="layouts/vlayout/skins/images/Folder.png">
								{else}
								<img style="width:13px !important;height:15px !important;" src="layouts/vlayout/skins/images/File.png">
								{/if}
								<a style="color: #1254a6;">{$FIL['title']}</a>
								</td>	
								</tr>
								{/foreach}
						
						</tbody>
					</table>
				</diV>


			<div id="vtigerElements">
				<table class="massEditTable table table-bordered">
					<tbody>
						<tr>
								<td class="fieldLabel">
								<label class="muted pull-right">
								 <span class="redColor">*</span> Assigned To</label>
									
								</td>
								<td>
								{assign var=ALL_ACTIVEUSER_LIST value=$USER_MODEL->getAccessibleUsers()}
								{assign var=ALL_ACTIVEGROUP_LIST value=$USER_MODEL->getAccessibleGroups()}
								<select class="chzn-select" data-name="assigned_user_id" name="assigned_user_id">
									<optgroup label="{vtranslate('LBL_USERS')}">
										{foreach key=OWNER_ID item=OWNER_NAME from=$ALL_ACTIVEUSER_LIST}
							                    <option value="{$OWNER_ID}" data-picklistvalue= '{$OWNER_NAME}' data-userId="{$CURRENT_USER_ID}">
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
								</td>
							</tr>
					</tbody>
				</table>
			</div>
		
			</div>
		</div>
			
		 <div class="modal-footer quickCreateActions">
			<a data-dismiss="modal" type="reset" class="cancelLink cancelLinkContainer pull-right">Cancel</a>
			<button type="submit" class="btn btn-success" id="selectFromService">
				<strong>Save</strong>
			</button>
		</div>
		
	</div>
</div>

