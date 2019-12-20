(function () {
    var iframe = (function () {
        'use strict';

        tinymce.PluginManager.add("refinerylink", function (editor, url) {

            /*
            Used to store a reference to the dialog when we have opened it
             */
            var _api = false;

            /*
            Define configuration for the iframe
             */
            var _urlDialogConfig = {
                title: 'Insert a Link',
                url: '/' + editor.getParam("refinery_core_backend_route") + '/dialogs/link',
								onMessage: function (api, data) {
									switch (data.mceAction)
        					{
        						case "insertRefineryLink":
        						  var selectedText = editor.selection.getContent()
        							editor.insertContent('<a href="' + data.href + '" title="' + data.title + '" target="' + data.target + '">' + selectedText + '</a>')
        							api.close()
        							break
        					}
								},
                width: 810,
                height: 580
            };

            // Define the Toolbar button
						editor.ui.registry.addButton('refinerylink', {
								icon: 'link',
								onAction: function() {
										_api = editor.windowManager.openUrl(_urlDialogConfig)
								}
						});

        });
    }());
})();
