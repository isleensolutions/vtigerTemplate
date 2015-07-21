{strip}
        <section id="main-content" style="min-height: 439px;">
            <section class="wrapper site-min-height">
               <section class="panel">      
                <form id="exportForm" class="form-horizontal row-fluid" method="post" action="index.php">
                    <input type="hidden" name="module" value="{$MODULE}" />
                    <input type="hidden" name="source_module" value="{$SOURCE_MODULE}" />
                    <input type="hidden" name="action" value="ExportData" />
                    <input type="hidden" name="viewname" value="{$VIEWID}" />
                    <input type="hidden" name="selected_ids" value={ZEND_JSON::encode($SELECTED_IDS)}>
                    <input type="hidden" name="excluded_ids" value={ZEND_JSON::encode($EXCLUDED_IDS)}>
                    <input type="hidden" id="page" name="page" value="{$PAGE}" />
                    <input type="hidden" name="search_key" value= "{$SEARCH_KEY}" />
                    <input type="hidden" name="operator" value="{$OPERATOR}" />
                    <input type="hidden" name="search_value" value="{$ALPHABET_VALUE}" />
                    
                        <div class="row-fluid">    
                            <header class="panel-heading">
                                <h4>{vtranslate('LBL_EXPORT_RECORDS',$MODULE)}</h4>
                            </header>
                            <div class="panel-body">
                                <div class="col-md-8">
                                    <div class="well exportContents marginLeftZero">
                                        <div class="row-fluid">
                                            <div class="row-fluid" style="height:30px">
                                                <div class="col-md-6 textAlignRight row-fluid">
                                                    <div class="col-md-8">{vtranslate('LBL_EXPORT_SELECTED_RECORDS',$MODULE)}&nbsp;</div>
                                                    <div class="col-md-3"><input type="radio" name="mode" value="ExportSelectedRecords" {if !empty($SELECTED_IDS)} checked="checked" {else} disabled="disabled"{/if}/></div>
                                                </div>
                                            {if empty($SELECTED_IDS)}&nbsp; <span class="redColor">{vtranslate('LBL_NO_RECORD_SELECTED',$MODULE)}</span>{/if}
                                            </div>
                                            <div class="row-fluid" style="height:30px">
                                                <div class="col-md-6 textAlignRight row-fluid">
                                                    <div class="col-md-8">{vtranslate('LBL_EXPORT_DATA_IN_CURRENT_PAGE',$MODULE)}&nbsp;</div>
                                                    <div class="col-md-3"><input type="radio" name="mode" value="ExportCurrentPage" /></div>
                                                </div>
                                            </div>
                                            <div class="row-fluid" style="height:30px">
                                                <div class="col-md-6 textAlignRight row-fluid">
                                                    <div class="col-md-8">{vtranslate('LBL_EXPORT_ALL_DATA',$MODULE)}&nbsp;</div>
                                                    <div class="col-md-3"><input type="radio"  name="mode" value="ExportAllData"  {if empty($SELECTED_IDS)} checked="checked" {/if} /></div>
                                                </div>
                                            </div>
                                        </div>
                                        <br> 
                                        <div class="textAlignCenter">
                                            <button class="btn btn-success" type="submit" style="margin-right:5px;">
                                                <strong>{vtranslate($MODULE, $MODULE)}&nbsp;{vtranslate($SOURCE_MODULE, $MODULE)}
                                                </strong>
                                            </button>
                                            <a class="cancelLink" type="reset" onclick='window.history.back()'>{vtranslate('LBL_CANCEL', $MODULE)}</a>
                                        </div>                               
                                    </div>
                                </div>  
                            </div>
                        </div>                    
                    </form>
                </section>
            </section>
        </section>
{/strip}
