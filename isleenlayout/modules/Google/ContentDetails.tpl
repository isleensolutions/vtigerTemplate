<div class="row-fluid paddingLeftRight10px">
    {foreach from=$RECORDS item=RECORD key=type }
        {if $type eq 'vtiger'}
            <div class='row-fluid'>
                <span class="col-md-12"><b>{vtranslate('LBL_UPDATES_CRM',$MODULE_NAME)}</b></span>
                <div class="row-fluid"><span class="col-md-7 "> {vtranslate('LBL_ADDED',$MODULE_NAME)} :</span><span class='span5 '>{$RECORD['create']} </span></div>
                <div class="row-fluid"><span class="col-md-7 "> {vtranslate('LBL_UPDATED',$MODULE_NAME)} :</span> <span class='span5 '>{$RECORD['update']} </span></div>
                <div class="row-fluid"><span class="col-md-7 "> {vtranslate('LBL_DELETED',$MODULE_NAME)} :</span> <span class='span5 '>{$RECORD['delete']} </span></div>
                {if $RECORD['more']}
					<div class="row-fluid"><span style='background:#FFFBCF;' class="span11" title="{vtranslate('LBL_MORE_VTIGER',$MODULE_NAME)}">{vtranslate('LBL_MORE_VTIGER',$MODULE_NAME)}</span>
                {/if}    
            </div>
         {else}
            <div class='row-fluid'> 
                <span class="col-md-12"><b>{vtranslate('LBL_UPDATES_GOOGLE',$MODULE_NAME)}</b></span>
                <div class="row-fluid"><span class="col-md-7 "> {vtranslate('LBL_ADDED',$MODULE_NAME)} :</span><span class='span5 '>{$RECORD['create']} </span></div>
                <div class="row-fluid"><span class="col-md-7 "> {vtranslate('LBL_UPDATED',$MODULE_NAME)} :</span> <span class='span5 '>{$RECORD['update']} </span></div>
                <div class="row-fluid"><span class="col-md-7 "> {vtranslate('LBL_DELETED',$MODULE_NAME)} :</span> <span class='span5 '>{$RECORD['delete']} </span></div>
                {if $RECORD['more']}
					<div class="row-fluid"><span style='background:#FFFBCF;' class="span11" title="{vtranslate('LBL_MORE_GOOGLE',$MODULE_NAME)}">{vtranslate('LBL_MORE_GOOGLE',$MODULE_NAME)}</span>
                {/if}
            </div>
         {/if}   
    {/foreach}
    <div class='row-fluid'>
        <p class="muted col-md-12"><small title="{Vtiger_Util_Helper::formatDateTimeIntoDayString($SYNCTIME)}">{vtranslate('LBL_SYNCRONIZED',$MODULE_NAME)} : {Vtiger_Util_Helper::formatDateDiffInStrings($SYNCTIME)}</small></p>
    </div>
{if $NORECORDS}
        <input type="hidden" value='yes' id ='norefresh'/>
{/if}      
</div>
      
    
