{strip}
    <div id="TagCloudResults">
        <div class="modal-header contentsBackground">
            <button data-dismiss="modal" class="close" title="{vtranslate('LBL_CLOSE')}">&times;</button>
            <div class="row-fluid">
                <h3 class="span8">{vtranslate('LBL_RESULT_FOR_THE_TAG', $MODULE)} - {$TAG_NAME}</h3>
                {if $TAGGED_RECORDS}
                    <select id="tagSearchModulesList" class="chzn-select span3">
                        <option value="all">{vtranslate('LBL_ALL',$MODULE)}</option>
                        {foreach key=MODULE_NAME item=TAGGED_RECORD_MODELS from=$TAGGED_RECORDS}
                            <option value="tagSearch_{$MODULE_NAME}">{vtranslate($MODULE_NAME,$MODULE)}</option>
                        {/foreach}	
                    </select>
                {/if}
            </div>
        </div>
        <div class="modal-body tabbable">
            {if $TAGGED_RECORDS}
                {foreach key=MODULE_NAME item=TAGGED_RECORD_MODELS from=$TAGGED_RECORDS}
                    <div name="tagSearchModuleResults" id="tagSearch_{$MODULE_NAME}">
                        <h5>{vtranslate($MODULE_NAME,$MODULE)} ({count($TAGGED_RECORD_MODELS)})</h5>
                        {foreach item=TAGGED_RECORD_MODEL from=$TAGGED_RECORD_MODELS}
                            <div><a href="{$TAGGED_RECORD_MODEL->getDetailViewUrl()}">{$TAGGED_RECORD_MODEL->getName()}</a></div>
                        {/foreach}
                        <br>
                    </div>
                {/foreach}
            {else}
                <div class="alert alert-block"><strong>{vtranslate('LBL_NO_RECORDS_FOUND',$MODULE)}.</strong></div>
            {/if}	
        </div>
    </div>
{/strip}	