{foreach key=index item=jsModel from=$SCRIPTS}
	<script type="{$jsModel->getType()}" src="{$jsModel->getSrc()}"></script>
{/foreach}
<div id = 'sync_message' class='row-fluid' >
    <div class='padding10 span12'>     
        {if $FIRSTTIME}
            <input type="hidden" id = "firsttime" value = 'no'/>
        {else}
            <input type="hidden" id = "firsttime" value = 'yes'/>
        {/if}
        <div id='sync_details'></div>
        {if $STATE eq 'home'}
            {if $SYNCTIME}
            <p class="muted" id='synctime'><small title="{Vtiger_Util_Helper::formatDateTimeIntoDayString($SYNCTIME)}">{vtranslate('LBL_SYNCRONIZED',$MODULE_NAME)} : {Vtiger_Util_Helper::formatDateDiffInStrings($SYNCTIME)}</small></p>
            {else}
                <p class="muted" id='synctime'><small>{vtranslate('LBL_NOT_SYNCRONIZED',$MODULE_NAME)}</small></p>    
            {/if}   
       {/if}
        <div class='row-fluid'>
            <span class='span0'>&nbsp;</span>
            <button id="sync_button" class="btn btn-success span0"  data-url='index.php?module=Google&view=List&operation=sync&sourcemodule={$SOURCEMODULE}'><b>{vtranslate('LBL_SYNC_BUTTON',$MODULE_NAME)}</b></button>
            <span class="span0">
                <i class="icon-question-sign pushDown" id="popid"  data-placement="right" rel="popover" ></i>
            </span>
        </div>
    </div>
        
</div>

{if $SOURCEMODULE == 'Contacts'}
    <div id="mappingTable">
        <table  class="table table-condensed table-striped table-bordered "  >
            <thead>
                <tr>
                    <td><b>{vtranslate('APPTITLE',$MODULE_NAME)}</b></td>
                    <td><b>{vtranslate('EXTENTIONNAME',$MODULE_NAME)}</b></td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>{vtranslate('First Name',$SOURCEMODULE)} {vtranslate('Last Name',$SOURCEMODULE)}</td>
                    <td>{vtranslate('Contact Name',$MODULE_NAME)}</td>
                </tr>
                <tr>
                    <td>{vtranslate('Email',$SOURCEMODULE)}</td>
                    <td>{vtranslate('Email',$MODULE_NAME)}</td>
                </tr>
                <tr>
                    <td>{vtranslate('Mobile Phone',$SOURCEMODULE)}</td>
                    <td>{vtranslate('Mobile Phone',$MODULE_NAME)}</td>
                </tr>
                <tr>
                    <td>{vtranslate('Mailing Address',$SOURCEMODULE)}</td>
                    <td>{vtranslate('Address',$MODULE_NAME)}</td>
                </tr>
            </tbody>
        </table>
    </div>
{else}
    <div id="mappingTable">
        <table  class="table table-condensed table-striped table-bordered "  >
            <thead>
                <tr>
                    <td><b>{vtranslate('APPTITLE',$MODULE_NAME)}</b></td>
                    <td><b>{vtranslate('EXTENTIONNAME',$MODULE_NAME)}</b></td>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>{vtranslate('Subject',$SOURCEMODULE)}</td>
                    <td>{vtranslate('Event Title',$MODULE_NAME)}</td>
                </tr>
                <tr>
                    <td>{vtranslate('Start Date & Time',$SOURCEMODULE)}</td>
                    <td>{vtranslate('From Date',$MODULE_NAME)}</td>
                </tr>
                <tr>
                    <td>{vtranslate('End Date & Time',$SOURCEMODULE)}</td>
                    <td>{vtranslate('Until Date',$MODULE_NAME)}</td>
                </tr>
                <tr>
                    <td>{vtranslate('Description',$SOURCEMODULE)}</td>
                    <td>{vtranslate('Description',$MODULE_NAME)}</td>
                </tr>
            </tbody>
        </table>
    </div>
{/if}

{if $STATE eq 'CLOSEWINDOW'}
    {if $DENY}
        <script>
            window.close();
        </script>
    {else}
    <script>
        window.opener.sync();
        window.close();
    </script>
    {/if}
{/if}

