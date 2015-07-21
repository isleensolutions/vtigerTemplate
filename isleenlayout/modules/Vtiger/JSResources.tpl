{strip}

<script type="text/javascript" src="libraries/isleen/bootstrap/js/bootstrap_min.js"></script>
<script type="text/javascript" src="libraries/jquery/jquery.blockUI.js"></script>
<script type="text/javascript" src="libraries/jquery/chosen/chosen.jquery.min.js"></script>
<script type="text/javascript" src="libraries/jquery/rochal-jQuery-slimScroll/slimScroll.js"></script> 
<script type="text/javascript" src="libraries/jquery/select2/select2.min.js"></script>
<script type="text/javascript" src="libraries/jquery/jquery.class.min.js"></script>
<script type="text/javascript" src="libraries/jquery/defunkt-jquery-pjax/jquery.pjax.js"></script>
<script class="include" type="text/javascript" src="libraries/isleen/bootstrap/js/jquery.dcjqaccordion.2.7.js"></script>
<script type="text/javascript" src="libraries/jquery/jstorage.min.js"></script>
<script type="text/javascript" src="libraries/bootstrap/js/bootbox.min.js"></script>
<script type="text/javascript" src="libraries/jquery/jquery.hoverIntent.minified.js"></script>
<script type="text/javascript" src="libraries/bootstrap/js/bootstrap-tooltip.js"></script>
<script type="text/javascript" src="libraries/jquery/autosize/jquery.autosize-min.js"></script>
<script type="text/javascript" src="libraries/isleen/bootstrap/js/jquery.scrollTo.min.js"></script>
<script type="text/javascript" src="libraries/isleen/bootstrap/js/jquery.nicescroll.js"></script>
<script type="text/javascript" src="resources/jquery.additions.js"></script>
<script type="text/javascript" src="libraries/jquery/pnotify/jquery.pnotify.min.js"></script>

<script type="text/javascript" src="libraries/jquery/posabsolute-jQuery-Validation-Engine/js/jquery.validationEngine.js" ></script>
<script type="text/javascript" src="libraries/guidersjs/guiders-1.2.6.js"></script>
<script type="text/javascript" src="libraries/isleen/bootstrap/assets/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
<script type="text/javascript" src="libraries/isleen/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="libraries/jquery/datepicker/js/datepicker.js"></script>
<script type="text/javascript" src="libraries/isleen/bootstrap/js/common-scripts.js"></script>
<script type="text/javascript" src="libraries/isleen/bootstrap-fileupload/bootstrap-fileupload.js"></script>
<script type="text/javascript" src="libraries/jquery/dangrossman-bootstrap-daterangepicker/date.js"></script>
<script type="text/javascript" src="libraries/isleen/nprogress/nprogress.js" ></script>
<script type="text/javascript" src="resources/app.js"></script>
<script type="text/javascript" src="resources/helper.js"></script>
<script type="text/javascript" src="resources/Connector.js"></script>
<script type="text/javascript" src="resources/ProgressIndicator.js" ></script>

{foreach key=index item=jsModel from=$SCRIPTS}
		<script type="{$jsModel->getType()}" src="{$jsModel->getSrc()}?&v={$VTIGER_VERSION}"></script>
{/foreach}
{/strip}
