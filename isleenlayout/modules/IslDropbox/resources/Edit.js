jQuery.Class("IslDropbox_Edit_Js",{
	fileToUpload: false,
    hierarchyMap: {}
},{
    convertFileSizeInToDisplayFormat: function(c) {
        var b = -1;
        var a = [" kB", " MB", " GB", " TB", "PB", "EB", "ZB", "YB"];
        do {
            c = c / 1024;
            b++;
        } while (c > 1024);
        return Math.max(c, 0.1).toFixed(1) + a[b];
    },
    
	registerFileChangeEvent: function() {
        var a = this;
        jQuery("#filePicker").on("change", function(c) {
            IslDropbox_Edit_Js.fileToUpload = c.target.files[0];
            var f = IslDropbox_Edit_Js.fileToUpload.name;
            var b = IslDropbox_Edit_Js.fileToUpload.size;
            var e = jQuery("#uploadFileDetails");
            var d = jQuery(".maxUploadSize").data("value");
            if (b > parseInt(d)) {
                IslDropbox_Edit_Js.fileToUpload = false;
                jQuery("#filePicker").val(null);
                e.empty();
                alert(app.vtranslate("JS_EXCEEDS_MAX_UPLOAD_SIZE"));
                return;
            }
            jQuery(this).css("width", "80px");
            jQuery("input#filePicker").validationEngine("hide");
            e.text(f + " " + a.convertFileSizeInToDisplayFormat(b));
            jQuery("#saveToService").removeAttr("disabled");
        });
    },
    handleDragDropEvents: function() {
        var a = this;
        var b = jQuery("#dragandrophandler");
        
        b.on("dragenter", function(c) {
            c.stopPropagation();
            c.preventDefault();
            jQuery(this).removeClass("dragdrop-dotted");
            jQuery(this).addClass("dragdrop-solid");
        });
        b.on("dragover", function(c) {
            c.stopPropagation();
            c.preventDefault();
        });
        jQuery(document).on("dragenter", function(c) {
            c.stopPropagation();
            c.preventDefault();
        });
        jQuery(document).on("dragover", function(c) {
            c.stopPropagation();
            c.preventDefault();
            b.removeClass("dragdrop-solid");
            b.addClass("dragdrop-dotted");
        });
        jQuery(document).on("drop", function(c) {
            c.stopPropagation();
            c.preventDefault();
        });
        b.on("drop", function(g) {
            jQuery(this).removeClass("dragdrop-solid");
            jQuery(this).addClass("dragdrop-dotted");
            g.preventDefault();
            var d = g.originalEvent.dataTransfer.files;
            IslDropbox_Edit_Js.fileToUpload = d[0];
            var i = IslDropbox_Edit_Js.fileToUpload.name;
            var c = IslDropbox_Edit_Js.fileToUpload.size;
            var h = jQuery("#uploadFileDetails");
            
            if (c == 0) {
                g.stopPropagation();
                g.preventDefault();
                IslDropbox_Edit_Js.fileToUpload = false;
                return;
            }
            var f = jQuery(".maxUploadSize").data("value");
            if (c > parseInt(f)) {
                g.stopPropagation();
                g.preventDefault();
                IslDropbox_Edit_Js.fileToUpload = false;
                jQuery("#filePicker").val(null);
                h.empty();
                alert(app.vtranslate("JS_EXCEEDS_MAX_UPLOAD_SIZE"));
                return;
            }
            jQuery("#saveToService").removeAttr("disabled");
            jQuery("#filePicker").val(null).css("width", "80px");
            jQuery("input#filePicker").validationEngine("hide");
            h.text(i + " " + a.convertFileSizeInToDisplayFormat(c));
        });
    },
    addScrollToFilesList: function() {
        var a = jQuery("#selectList");
        if (a.length) {
            app.showScrollBar(a, {
                "height": "250px"
            });
        }
    },
    registerSelectionHandler: function() {
        jQuery(".file").on("click", function() {
            jQuery("#searchService").validationEngine("hide");
            if (typeof prevSelection != "undefined") {
                prevSelection.removeClass("selectedFile");
            }
            jQuery(this).addClass("selectedFile");
            jQuery("#selectFromService").removeAttr("disabled");
            prevSelection = jQuery(this);
        });
    },
    reloadListView: function() {
        var b = Documents_List_Js.getInstance();
        var d = jQuery("#orderBy").val();
        var c = jQuery("#sortOrder").val();
        var a = {
            "orderby": d,
            "sortorder": c
        };
        jQuery("#recordsCount").val("");
        jQuery("#totalPageCount").text("");
        b.getListViewRecords(a).then(function() {
            b.updatePagination();
        });
    },
    createVtigerDocumentRecord: function(p, l) {
        var o = this;
        var g = jQuery.progressIndicator({});
        var h = p.data("title");
        var a = p.data("link");
        var e = p.data("fileid");
        var q = jQuery('select[name="assigned_user_id"] option:selected').val();
        var d = jQuery('input[name="vtigerFolderId"]').val();
        var b = l;
        if (l == "GoogleDrive") {
            b = "Google Drive";
        }
        var j = h;
        var m = "E";
        var k = jQuery('input[name="relationOperation"]');
        var f = {
            module: "Documents",
            action: "SaveAjax",
            service: l,
            notes_title: j,
            filename: a,
            filelocationtype: m,
            assigned_user_id: q,
            document_source: b,
            externalFileId: e,
            folderid: d
        };
        
        if (l == "Dropbox") {
            f.createDirectLink = "yes";
        }
        if (k.length) {
            var c = k.val();
            var i = jQuery('input[name="sourceModule"]').val();
            var n = jQuery('input[name="sourceRecord"]').val();
            f.relationOperation = c;
            f.sourceModule = i;
            f.sourceRecord = n;
        }
        AppConnector.request(f).then(function() {
            g.progressIndicator({
                "mode": "hide"
            });
            app.hideModalWindow();
            if (k.length) {
                Vtiger_Detail_Js.reloadRelatedList();
            } else {
                o.reloadListView();
            }
        });
    },
    registerCreateVtigerDocumentForSelectedFile: function() {
        var a = this;
        jQuery("#selectFromService").on("click", function() {
            var c = jQuery(".selectList").find(".selectedFile");
            if (!c.length) {
                var d = app.vtranslate("JS_PLEASE_SELECT_A_FILE");
                jQuery("#searchService").validationEngine("showPrompt", d, "error", "topRight");
                return;
            }
            jQuery(this).attr("disabled", "disabled");
            var b = jQuery('input[name="serviceProvider"]').val();
            a.createVtigerDocumentRecord(c, b);
           
        });
    },
    registerUploadFileToServiceEvent: function() {
        var a = this;
        
        jQuery("#saveToService").on("click", function() {
            if (IslDropbox_Edit_Js.fileToUpload == false) {
                var g = app.vtranslate("JS_PLEASE_SELECT_A_FILE");
                jQuery("input#filePicker").validationEngine("showPrompt", g, "error", "topLeft", true);
                return;
            }
            jQuery(this).attr("disabled", "disabled");
            var c = jQuery('form[name="uploadToService"]');
            
            var e = new FormData(c[0]);
            var b = jQuery('input[name="relationOperation"]');
            e.append("file", IslDropbox_Edit_Js.fileToUpload);
            if (e) {
                var d = jQuery.progressIndicator({});
                var f = {
                    url: "index.php",
                    type: "POST",
                    data: e,
                    processData: false,
                    contentType: false
                };
                AppConnector.request(f).then(function(h) {
                    d.progressIndicator({
                        "mode": "hide"
                    });//console.info(h);
                    app.hideModalWindow();
                    a.reloadListView();
                    if (h.result.uploadFail) {
                        var i = {
                            text: app.vtranslate("JS_FAILED_TO_UPLOAD_FILE", "Documents") + "<BR>" + h.result.msg
                        };
                        Vtiger_Helper_Js.showPnotify(i);
                        return;
                    }
                    if (b.length) {
                        Vtiger_Detail_Js.reloadRelatedList();
                    } else {
                        a.reloadListView();
                    }
                   
                }, function(i, h) {
                	
                    console.log(i + " " + h);
                });
            }
        });
    },
    loadFilesList: function(f) {
        var a = jQuery(".selectList").find("tbody");
        var e = "";
        a.empty();
        if (typeof f == "undefined" || !f.length) {
            e = '<div class="row-fluid alert-info" style="padding:20px">\n                            <span class="span alert-info">\n                                <i class="icon-info-sign"></i>\n                                ' + app.vtranslate("JS_NO_RESULTS_FOUND") + "</span>\n                        </div>";
            a.append(e);
            return;
        }
        var b = jQuery('input[name="foldericonpath"]').val();
        var c = jQuery('input[name="fileiconpath"]').val();
        for (var d = 0; d < f.length; d++) {
            if (f[d].is_dir) {
                e = "<tr class='listViewEntries folder' data-fileid='" + f[d].id + "' data-title='" + f[d].title + "' data-link='" + f[d].alternateLink + "'>\n                              <td class='listViewEntryValue medium' nowrap=''>\n                                  <img src='" + b + "' style='width:14px !important;height:17px !important;'>&nbsp;&nbsp;<a>" + f[d].title + "</a>\n                              </td>\n                          </tr>";
            } else {
                e = "<tr class='listViewEntries file' data-fileid='" + f[d].id + "' data-title='" + f[d].title + "' data-link='" + f[d].alternateLink + "'>\n                              <td class='listViewEntryValue medium' nowrap=''>\n                                  <img src='" + c + "' style='width:13px !important;height:15px !important;'>&nbsp;&nbsp;<a>" + f[d].title + "</a>\n                              </td>\n                          </tr>";
                
            }
            a.append(e);
        }
        app.showScrollBar(jQuery(".selectList"), {
            "height": "250px"
        });
        this.registerSelectionHandler();
        this.registerBrowseFolder();
    },
    registerReauth: function() {
        var b = jQuery('input[name="reauth"]').val();
        if (b) {
            var a = jQuery('input[name="authUrl"]').val();
            window.location.href = a;
        }
    },
    registerSearchFiles: function() {
        var a = this;
        if (!jQuery('input[name="searchFiles"]').length) {
            return;
        }
        jQuery('input[name="searchFiles"]').on("change", function() {
            var c = jQuery(this).val();
            c = jQuery.trim(c);
            if (c.length == 0) {
                jQuery(this).val("");
                return;
            }
            var b = jQuery.progressIndicator({});
            var d = {
                module: "Documents",
                action: "ServiceProvidersAjax",
                mode: "search",
                searchKey: c
            };
            d.service = jQuery('input[name="serviceProvider"]').val();
            AppConnector.request(d).then(function(f) {
                if (f.success) {
                    var e = [];
                    if (f.result != null) {
                        e = f.result;
                    }
                    a.loadFilesList(e);
                    b.progressIndicator({
                        "mode": "hide"
                    });
                    jQuery("#browseBack").attr("disabled", "disabled");
                    jQuery("#gotoRoot").removeAttr("disabled");
                }
            });
        });
    },
    showEmptyDirectoryMessage: function() {
        var a = jQuery(".selectList").find("tbody");
        a.empty();
        var b = '<div class="row-fluid alert-info" style="padding:20px">\n                        <span class="span alert-info">\n                            <i class="icon-info-sign"></i>\n                            ' + app.vtranslate("JS_DIRECTORY_IS_EMPTY") + "</span>\n                    </div>";
        a.append(b);
    },
    addToHierarchyMap: function(b, a) {
       // IslDropbox_Edit_Js.hierarchyMap[b] = a;
    },
    getParentDirFromHierarchyMap: function(a) {
        if (a == "/") {
            return false;
        }
        return IslDropbox_Edit_Js.hierarchyMap[a];
    },
    updateDirectoryMeta: function(a, f) {
        f = (typeof f == "undefined") ? false : true;
        var d = jQuery('input[name="currentDir"]');
        var c = jQuery('input[name="parentDir"]');
        var e = d.val();
        var b = c.val();
        if (!f) {
            this.addToHierarchyMap(a, e);
            c.val(e);
            d.val(a);
            jQuery("#browseBack").removeAttr("disabled");
            jQuery("#gotoRoot").removeAttr("disabled");
        } else {
            d.val(a);
            b = this.getParentDirFromHierarchyMap(a);
            if (!b) {
                jQuery("#browseBack").attr("disabled", "disabled");
                jQuery("#gotoRoot").attr("disabled", "disabled");
            }
            c.val(b);
        }
    },
    registerBackBrowseButton: function() {
        var b = this;
        var a = jQuery('input[name="currentDir"]');
        jQuery("#browseBack").on("click", function() {
            var c = b.getParentDirFromHierarchyMap(a.val());
            if (c) {
                jQuery("#browseBack").off("click");
                jQuery(".folder").off("click");
                b.openFolder(c, true);
            }
        });
    },
    openFolder: function(b, e) {
        var c = this;
        var a = jQuery('input[name="serviceProvider"]').val();
        var d = jQuery.progressIndicator({});
        var f = {
            module: "Documents",
            action: "ServiceProvidersAjax",
            mode: "getFilesForDirectory"
        };
        f.folderId = b;
        f.service = a;
        AppConnector.request(f).then(function(g) {
            d.progressIndicator({
                mode: "hide"
            });
           
            if (g.result.is_directory_empty) { 
                c.showEmptyDirectoryMessage();
            } else {
                c.loadFilesList(g.result.filesList);
            }
            c.updateDirectoryMeta(b, e);
            c.registerBackBrowseButton();
        });
    },
    registerBrowseFolder: function() {
        var a = this;
        jQuery(".folder").on("click", function() {
            jQuery(".folder").off("click");
            jQuery("#browseBack").off("click");
            var c = jQuery(this);
            var b = c.data("fileid");
            a.openFolder(b);
        });
    },
    registerGotoRootFolder: function() {
        var a = this;
        jQuery("#gotoRoot").on("click", function() {
            jQuery(this).attr("disabled", "disabled");
            jQuery("#browseBack").attr("disabled", "disabled");
            var d = jQuery('input[name="rootDirContents"]');
            var e = d.val();
            var b = d.attr("data-rootDirId");
            var c = JSON.parse(e);
            a.loadFilesList(c);
            jQuery('input[name="currentDir"]').val(b);
            jQuery('input[name="parentDir"]').val("");
        });
    },
    
	registerEvents: function(){
		 this.registerFileChangeEvent();
	        this.handleDragDropEvents();
	        this.addScrollToFilesList();
	        this.registerSelectionHandler();
	        this.registerCreateVtigerDocumentForSelectedFile();
	        this.registerUploadFileToServiceEvent();
	        this.registerSearchFiles();
	        this.registerReauth();
	        this.registerBrowseFolder();
	        this.registerBackBrowseButton();
	        this.registerGotoRootFolder();

	}
});

