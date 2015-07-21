<header class="panel-heading listview-header">
                      	<div class="clearfix">
		<div class="listViewTopMenuDiv noprint">
			<div class="listViewActionsDiv row-fluid">
				<span class="btn-toolbar btn-group col-lg-4 paddingLeft">
					<span class="btn-group listViewMassActions">
						{if count($LISTVIEW_MASSACTIONS) gt 0 || $LISTVIEW_LINKS['LISTVIEW']|@count gt 0}
							<button class="btn dropdown-toggle btn-success" data-toggle="dropdown">{vtranslate('LBL_ACTIONS', $MODULE)}&nbsp;&nbsp;<i class="caret"></i></button>
							<ul class="dropdown-menu">
								{foreach item="LISTVIEW_MASSACTION" from=$LISTVIEW_MASSACTIONS name=actionCount}
									<li id="{$MODULE}_listView_massAction_{Vtiger_Util_Helper::replaceSpaceWithUnderScores($LISTVIEW_MASSACTION->getLabel())}"><a href="javascript:void(0);" {if stripos($LISTVIEW_MASSACTION->getUrl(), 'javascript:')===0}onclick='{$LISTVIEW_MASSACTION->getUrl()|substr:strlen("javascript:")};'{else} onclick="Vtiger_List_Js.triggerMassAction('{$LISTVIEW_MASSACTION->getUrl()}')"{/if} >{vtranslate($LISTVIEW_MASSACTION->getLabel(), $MODULE)}</a></li>
									{if $smarty.foreach.actionCount.last eq true}
										<li class="divider"></li>
									{/if}
								{/foreach}
								{if $LISTVIEW_LINKS['LISTVIEW']|@count gt 0}
									{foreach item=LISTVIEW_ADVANCEDACTIONS from=$LISTVIEW_LINKS['LISTVIEW']}
										<li id="{$MODULE}_listView_advancedAction_{Vtiger_Util_Helper::replaceSpaceWithUnderScores($LISTVIEW_ADVANCEDACTIONS->getLabel())}"><a {if stripos($LISTVIEW_ADVANCEDACTIONS->getUrl(), 'javascript:')===0} href="javascript:void(0);" onclick='{$LISTVIEW_ADVANCEDACTIONS->getUrl()|substr:strlen("javascript:")};'{else} href='{$LISTVIEW_ADVANCEDACTIONS->getUrl()}' {/if}>{vtranslate($LISTVIEW_ADVANCEDACTIONS->getLabel(), $MODULE)}</a></li>
									{/foreach}
								{/if}
							</ul>
						{/if}
					</span>
					{foreach item=LISTVIEW_BASICACTION from=$LISTVIEW_LINKS['LISTVIEWBASIC']}
						<span class="btn-group">
							<button id="{$MODULE}_listView_basicAction_{Vtiger_Util_Helper::replaceSpaceWithUnderScores($LISTVIEW_BASICACTION->getLabel())}" class="btn addButton btn-success" {if stripos($LISTVIEW_BASICACTION->getUrl(), 'javascript:')===0} onclick='{$LISTVIEW_BASICACTION->getUrl()|substr:strlen("javascript:")};'{else} onclick='window.location.href="{$LISTVIEW_BASICACTION->getUrl()}"'{/if}><i class="fa fa-plus"></i>&nbsp;{vtranslate($LISTVIEW_BASICACTION->getLabel(), $MODULE)}</button>
						</span>
					{/foreach}
					<!-- Dropbox starts-->

						{if $DROPBOXLINK}
						  {if $DROPBOXAUTHORIZED}  
						   <span class="btn-group">
							<a href="" style="width:46px;height:32px;float:left;background-color:#f5f5f5;margin:6px;" data-hover="dropdown" class="btn dropdown-toggle" data-toggle="dropdown" data-close-others="false" data-delay="200">
							 <img src="layouts/isleenlayout/skins/isleen/images/Dropbox.png" alt="{vtranslate('LBL_DROPBOX',$MODULE)}" title="Dropbox" />
							</a>
							<ul class="dropdown-menu">
							 {foreach item=LINK from=$DROPBOXLINK}
							 
							 <li>
							  <a id="{$MODULE}_listView_add_{Vtiger_Util_Helper::replaceSpaceWithUnderScores($LINK->getLabel())}" data-authenticated="1" data-name="Documents" data-url="{$LINK->getUrl()}" href="javascript:void(0);" class="addDocumentToDropbox"><i class=""></i> {vtranslate($LINK->getLabel(),$MODULE)}</a>
							 </li>
							 {/foreach}
							</ul>
						   </span>
						  {else}
						   <span class="btn-group">
							<a href="" style="width:20px;height:18px;" data-hover="dropdown" class="btn dropdown-toggle" data-toggle="dropdown" data-close-others="false" data-delay="200">
							 <img src="{$DROPBOXLINK->getIcon()}" alt="{vtranslate($DROPBOXLINK->getLabel(),$MODULE)}" />
							</a>
							<ul class="dropdown-menu">
							 <li>
							  <a id="{$MODULE}_listView_add_{Vtiger_Util_Helper::replaceSpaceWithUnderScores($DROPBOXLINK->getLabel())}" data-authenticated="" data-name="Documents" data-url="index.php?module=IslDropbox&view=AuthAjax&mode=getOauthUrl" href="javascript:void(0);" class="addDocumentToDropbox"><i class="fa fa-plus"></i> {vtranslate($DROPBOXLINK->getLabel(),$MODULE)}</a>
							 </li>
							</ul>
						   </span>
						  {/if} 
						{/if}
						
						<!-- Dropbox ends-->
				</span>
			<span class="btn-toolbar btn-group col-lg-4 dropdown-toggle">
				<span class="customFilterMainSpan btn-group">
					{if $CUSTOM_VIEWS|@count gt 0}

						<select id="customFilter" style="width:350px;">
							{foreach key=GROUP_LABEL item=GROUP_CUSTOM_VIEWS from=$CUSTOM_VIEWS}
							<optgroup label=' {if $GROUP_LABEL eq 'Mine'} &nbsp; {else if} {vtranslate($GROUP_LABEL)} {/if}' >
									{foreach item="CUSTOM_VIEW" from=$GROUP_CUSTOM_VIEWS}
										<option  data-editurl="{$CUSTOM_VIEW->getEditUrl()}" data-deleteurl="{$CUSTOM_VIEW->getDeleteUrl()}" data-approveurl="{$CUSTOM_VIEW->getApproveUrl()}" data-denyurl="{$CUSTOM_VIEW->getDenyUrl()}" data-editable="{$CUSTOM_VIEW->isEditable()}" data-deletable="{$CUSTOM_VIEW->isDeletable()}" data-pending="{$CUSTOM_VIEW->isPending()}" data-public="{$CUSTOM_VIEW->isPublic() && $CURRENT_USER_MODEL->isAdminUser()}" id="filterOptionId_{$CUSTOM_VIEW->get('cvid')}" value="{$CUSTOM_VIEW->get('cvid')}" data-id="{$CUSTOM_VIEW->get('cvid')}" {if $VIEWID neq '' && $VIEWID neq '0'  && $VIEWID == $CUSTOM_VIEW->getId()} selected="selected" {elseif ($VIEWID == '' or $VIEWID == '0')&& $CUSTOM_VIEW->isDefault() eq 'true'} selected="selected" {/if} class="filterOptionId_{$CUSTOM_VIEW->get('cvid')}">{if $CUSTOM_VIEW->get('viewname') eq 'All'}{vtranslate($CUSTOM_VIEW->get('viewname'), $MODULE)} {vtranslate($MODULE, $MODULE)}{else}{vtranslate($CUSTOM_VIEW->get('viewname'), $MODULE)}{/if}{if $GROUP_LABEL neq 'Mine'} [ {$CUSTOM_VIEW->getOwnerName()} ]  {/if}</option>
									{/foreach}
								</optgroup>
							{/foreach}
							{if $FOLDERS neq ''}
								<optgroup id="foldersBlock" label='{vtranslate('LBL_FOLDERS', $MODULE)}' >
									{foreach item=FOLDER from=$FOLDERS}
										<option data-foldername="{$FOLDER->getName()}" {if decode_html($FOLDER->getName()) eq $FOLDER_NAME} selected=""{/if} data-folderid="{$FOLDER->get('folderid')}" data-deletable="{!($FOLDER->hasDocuments())}" class="filterOptionId_folder{$FOLDER->get('folderid')} folderOption{if $FOLDER->getName() eq 'Default'} defaultFolder {/if}" id="filterOptionId_folder{$FOLDER->get('folderid')}" data-id="{$DEFAULT_CUSTOM_FILTER_ID}">{$FOLDER->getName()}</option>
									{/foreach}
								</optgroup>
							{/if}
						</select>
						<span class="filterActionsDiv hide">
							<hr>
							<ul class="filterActions">
								<li data-value="create" id="createFilter" data-createurl="{$CUSTOM_VIEW->getCreateUrl()}">
									<i class="fa fa-plus"></i> {vtranslate('LBL_CREATE_NEW_FILTER')}
								</li>
							</ul>
						</span>
						{*<img class="fa fa-filter filterImage" src="{'filter.png'|vimage_path}" style="display:none;height:13px;margin-right:2px;vertical-align: middle;">*}
						<i class="fa fa-filter filterImage"></i>
					{else}
						<input type="hidden" value="0" id="customFilter" />
					{/if}
				</span>
			</span>		
			<span class="filterActionImages pull-right">
				<i title="{vtranslate('LBL_DENY', $MODULE)}" data-value="deny" class="fa fa-ban alignMiddle denyFilter filterActionImage pull-right"></i>
				<i title="{vtranslate('LBL_APPROVE', $MODULE)}" data-value="approve" class="fa fa-check alignMiddle approveFilter filterActionImage pull-right"></i>
				<i title="{vtranslate('LBL_DELETE', $MODULE)}" data-value="delete" class="fa fa-trash-o  alignMiddle deleteFilter filterActionImage pull-right"></i>
				<i title="{vtranslate('LBL_EDIT', $MODULE)}" data-value="edit" class="fa fa-pencil alignMiddle editFilter filterActionImage pull-right"></i>
			</span>
			<span class="btn-group btn-toolbar pull-right col-lg-4"> 
				{include file='ListViewActions.tpl'|@vtemplate_path}
			</span> 
		</div>
		</div>
    </div>
</header>
<div class="panel-body">
	<div class="adv-table editable-table ">

                          <div class="space15"></div>	

