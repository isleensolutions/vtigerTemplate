jQuery.Class("Users_Updates_Js",{
	
	getInstance: function(){
		return new Users_Updates_Js();
	}
},{	
	getUpdates: function(){
		var url = 'index.php?module=ModTracker&view=IndexAjax&mode=getUpdates';
		var refreshContainer = jQuery('#UserUpdates');
		refreshContainer.progressIndicator({
			'loadingdot' : true
		});
		AppConnector.request(url).then(function(data){
			refreshContainer.progressIndicator({'mode': 'hide'});
			jQuery("#UserUpdates").html(data);
		});
		
	},
	
	registerCommentForm: function(){
		jQuery('#UserUpdates').on('keyup','.update-commentadd', function(e) {
		// e.which is monitoring the key pressed 
		// and 13 is code for enter key
		if(e.which == 13 && jQuery.trim(this.value).length) {
			e.preventDefault();
			console.info(jQuery(this).parent().find("dummy"));
			var postData = {
				'commentcontent' : jQuery.trim(this.value),
				'related_to' : jQuery(this).parent().data('related_to'),
				'module' : 'ModComments',
				'action' : 'SaveAjax'
			}
			AppConnector.request(postData).then(
				function(data){
					console.info(data);
				});
		}
		});
	},
	
	registerComments: function(){
		jQuery("body").on("click",".UpdateComment",function(e){
			e.preventDefault();
			var url = jQuery(this).data('url');
			var clickinstance = this;
			jQuery.ajax({
				url: url,
				type: 'POST',
				
			}).done(function(data){
				jQuery(clickinstance).closest('.fb-status-container').append(data);
			})
		})
	},
	
	registerEvents: function(){
	}
});

jQuery(document).ready(function() {
	var instance = Users_Updates_Js.getInstance();
	instance.getUpdates();
	instance.registerCommentForm();
	instance.registerComments();
});