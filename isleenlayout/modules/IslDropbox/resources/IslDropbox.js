jQuery.Class("IslDropbox",{},{
	
	registerAddEvent: function(){
		jQuery(".addDocumentToDropbox").on("click",function(b){
			var a = b.currentTarget;
			var auth = jQuery(a).data('authenticated');
			var u = jQuery(a).data("url");
			if (auth) {
				var p = jQuery.progressIndicator();
				AppConnector.request(u).then(function(data){
					p.progressIndicator({
                        'mode': 'hide'
                    });

                    var h = function () {
                        var i = new IslDropbox_Edit_Js();
                        i.registerEvents();
                    };

                     var g = {
                        data: data,
                        css: {
                            width: '600px'
                        },
                        cb: h
                    };
                    app.showModalWindow(g);
				})
			}else{
				jQuery.ajax({
					url: u,
					//dataType : 'json',

				}).done(function(data){
					window.location.href = data;
				})
			}
		});	
	},

	registerSaveDropBox: function(){
		jQuery( ".frm1_submit" ).click( function(){
			alert('dcdf');
			
		});
	},
	
	registerSelectionHandler: function() {
	        jQuery("#file1234").on('click', function() {
	        	
	        	alert('sdsdsdsd');
	        });
	    },
	
	registerEvents: function(){
		this.registerAddEvent();
		this.registerSaveDropBox();
		this.registerSelectionHandler();

	}
});

jQuery(document).ready(function(){
        var DropboxInstance = new IslDropbox();
        DropboxInstance.registerEvents();
    });