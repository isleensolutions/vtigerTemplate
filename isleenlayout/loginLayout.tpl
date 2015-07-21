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

		<link rel="stylesheet" href="libraries/isleen/bootstrap/css/bootstrap.min.css" type="text/css" />
		<link rel="stylesheet" href="libraries/isleen/bootstrap/css/bootstrap_override.css" type="text/css" />
		<link rel="stylesheet" href="libraries/isleen/bootstrap/css/font-awesome.min.css" type="text/css" />
		<link rel="stylesheet" href="libraries/isleen/bootstrap/css/style.css" type="text/css" />
		<link rel="stylesheet" href="libraries/isleen/bootstrap/css/style_responsive.css" type="text/css" />
	</head>
	<body class="login-body" style>
		{block name=loginBody}{/block}
		<script src="libraries/isleen/jquery/jquery.js"></script>
		<script src="libraries/isleen/bootstrap/js/bootstrap_min.js"></script>
		
		<script>
		jQuery(document).ready(function(){
			jQuery("#forgotPassword").click(function() {
				jQuery("#loginDiv").hide();
				jQuery("#fpDiv").show();
			});
			
			jQuery("#backButton").click(function() {
				jQuery("#loginDiv").show();
				jQuery("#fpDiv").hide();
			});
			
			jQuery("input[name='retrievePassword']").click(function (){
				var username = jQuery('#user_name').val();
				var email = jQuery('#emailId').val();
				
				var email1 = email.replace(/^\s+/,'').replace(/\s+$/,'');
				var emailFilter = /^[^@]+@[^@.]+\.[^@]*\w\w$/ ;
				var illegalChars= /[\(\)\<\>\,\;\:\\\"\[\]]/ ;
				
				if(username == ''){
					alert('Please enter valid username');
					return false;
				} else if(!emailFilter.test(email1) || email == ''){
					alert('Please enater valid email address');
					return false;
				} else if(email.match(illegalChars)){
					alert( "The email address contains illegal characters.");
					return false;
				} else {
					return true;
				}
				
			});
		});
	</script>
	</body>
</html>	
{/strip}
