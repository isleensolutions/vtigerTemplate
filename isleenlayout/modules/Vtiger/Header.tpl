{strip}
<!DOCTYPE html>
<html>
	<head>
		<title>
			{vtranslate($PAGETITLE, $MODULE_NAME)}
		</title>
		<link REL="SHORTCUT ICON" HREF="layouts/vlayout/skins/images/isleen.ico">
		<meta name="author" content="Mustafulla-Isleen Solutions Pvt Ltd">
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
               
        
		<link rel="stylesheet" href="libraries/jquery/chosen/chosen.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="libraries/isleen/bootstrap/css/bootstrap.min.css" type="text/css" />
		<link rel="stylesheet" href="libraries/isleen/bootstrap/css/bootstrap_override.css" type="text/css" />
		<link rel="stylesheet" href="libraries/jquery/posabsolute-jQuery-Validation-Engine/css/validationEngine.jquery.css"type="text/css" />
		<link rel="stylesheet" href="libraries/isleen/bootstrap/css/font-awesome.min.css" type="text/css" />   
		<link rel="stylesheet" href="libraries/jquery/select2/select2.css" type="text/css" media="screen" />
		<link rel="stylesheet" href="libraries/isleen/bootstrap/css/select2-bootstrap.css" type="text/css" />
		<link rel="stylesheet" href="libraries/jquery/pnotify/jquery.pnotify.default.css" type="text/css">
		<link rel="stylesheet" href="libraries/isleen/nprogress/nprogress.css" type="text/css">
		
		<link rel="stylesheet" type="text/css" href="libraries/isleen/bootstrap-datetimepicker/css/datetimepicker.css" />
		<link rel="stylesheet" href="libraries/isleen/bootstrap-fileupload/bootstrap-fileupload.css" type="text/css" />
		<link rel="stylesheet" media="screen" type="text/css" href="libraries/jquery/datepicker/css/datepicker.css" />
		{foreach key=index item=cssModel from=$STYLES}
			<link rel="{$cssModel->getRel()}" href="{$cssModel->getHref()}?&v={$VTIGER_VERSION}" type="{$cssModel->getType()}" media="{$cssModel->getMedia()}" />
		{/foreach}
		{*Added custom files*}
	    <link rel="stylesheet" href="libraries/isleen/bootstrap/css/style.css" type="text/css" />
		<link rel="stylesheet" href="libraries/isleen/bootstrap/css/style_responsive.css" type="text/css" />  
		<link rel="stylesheet" href="libraries/isleen/bootstrap/css/isleen-style.css" type="text/css" />		
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 tooltipss and media queries -->
    	<!--[if lt IE 9]>
      	<script src="libraries/isleen/bootstrap/js/html5shiv.js"></script>
      	<script src="js/respond.min.js"></script>
    	<![endif]-->
		<script src="libraries/isleen/jquery/jquery-1.9.0.js"></script>
		<script src="libraries/isleen/jquery/jquery-migrate-1.2.1.js"></script>
		<script src="libraries/isleen/jquery/ui/1.9.1/jquery-ui.js"></script>
        
        
		
	</head>
	<body data-skinpath="layouts/isleenlayout/skins/isleen" data-language="{$LANGUAGE}" >
		<div id="js_strings" class="hide noprint">{Zend_Json::encode($LANGUAGE_STRINGS)}</div>
		{assign var=CURRENT_USER_MODEL value=Users_Record_Model::getCurrentUserModel()}
		<input type="hidden" id="start_day" value="{$CURRENT_USER_MODEL->get('dayoftheweek')}" />
		<input type="hidden" id="row_type" value="{$CURRENT_USER_MODEL->get('rowheight')}" />
		<input type="hidden" id="current_user_id" value="{$CURRENT_USER_MODEL->get('id')}" />
		<section id="container" {if $smarty.get.parent eq 'Settings'} class="sidebar-closed" {/if}>
			<div id="pjaxContainer" class="hide noprint"></div>
{/strip}
