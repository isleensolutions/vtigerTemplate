{strip}
<div id="advanceSearchContainer">
	<div class="row">
		<div class="col-lg-12">
			<div class="span"> &nbsp; </div>
			<div class="col-lg-12">
				<section class="panel">
					<div class="row">						
						<div class="panel-body">
							<div class="col-lg-12">
								<span class="col-lg-2">&nbsp;</span>
								<span class="col-lg-2" style="padding: 8px 5px 0;text-align: center;">
									<span class="highLight pushDown">{vtranslate('LBL_SEARCH_IN',$MODULE)}</span>
								</span>
								<span class="col-lg-6">
									<select class="chzn-select" id="searchModuleList" data-placeholder="{vtranslate('LBL_SELECT_MODULE')}">
										<option></option>
										{foreach key=MODULE_NAME item=fieldObject from=$SEARCHABLE_MODULES}
											<option value="{$MODULE_NAME}" {if $MODULE_NAME eq $SOURCE_MODULE}selected="selected"{/if}>{vtranslate($MODULE_NAME,$MODULE_NAME)}</option>
										{/foreach}
									</select>
								</span>
								<span class="col-lg-2">&nbsp;</span>
							</div>
						</div>

					</div>
				</section>
				<div class="filterElements FloatWidth">
					<form name="advanceFilterForm">
						{if $SOURCE_MODULE eq 'Home'}
							<div class="textAlignCenter marginBottom10px well contentsBackground">{vtranslate('LBL_PLEASE_SELECT_MODULE',$MODULE)}</div>
						{else}
							<input type="hidden" name="labelFields" data-value='{ZEND_JSON::encode($SOURCE_MODULE_MODEL->getNameFields())}' />
							{include file='AdvanceFilter.tpl'|@vtemplate_path}
						{/if}	
	                    
					</form>
					<div class="row-fluid actions FloatWidth">
						<!-- TODO: should be done in better way to show right elements -->
						{*<div class="col-md-12">
	                        {if $SAVE_FILTER_PERMITTED}
							<div class="row-fluid">
								<span class="col-md-4">&nbsp;</span>
								<span class="col-md-7">
									<input class="zeroOpacity row-fluid form-control" type="text" value="" name="viewname"/>
								</span>
							</div>
	                        {else}
	                            &nbsp;
	                        {/if}
						</div>*}
						<div class="col-md-12">
							<span class="btn-toolbar FloatWidth marginbottom10px">
								<span class="btn-group">
								</span>
								<span class="btn-group  pull-right pushDown">
									<a class="cancelLink btn btn-danger" type="reset" id="advanceSearchCancel" data-dismiss="modal">{vtranslate('LBL_CANCEL', $MODULE)}</a>
								</span>
								<span class="btn-group pull-right">
									<button class="btn" id="advanceSearchButton" {if $SOURCE_MODULE eq 'Home'} disabled="" {/if}  type="submit">{vtranslate('LBL_SEARCH', $MODULE)}</button>
								</span>
	                            {if $SAVE_FILTER_PERMITTED}
								<span class="btn-group pull-right ">
									<button class="btn hide" {if $SOURCE_MODULE eq 'Home'} disabled="" {/if} id="advanceSave">{vtranslate('LBL_SAVE_FILTER', $MODULE)}</button>
								</span>
								<span class="btn-group pull-right">
									<button class="btn" {if $SOURCE_MODULE eq 'Home'} disabled="" {/if} id="advanceIntiateSave">{vtranslate('LBL_SAVE_AS_FILTER', $MODULE)}</button>
								</span>
	                            {/if}
							</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
{/strip}
