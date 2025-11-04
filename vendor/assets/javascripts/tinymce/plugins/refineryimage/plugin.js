(function() {
    var iframe = (function() {
        'use strict';

        tinymce.PluginManager.add("refineryimage", function(editor, url) {

            /*
            Used to store a reference to the dialog when we have opened it
             */
            var _api = false;

            /*
            Define configuration for the iframe
             */
            var _urlDialogConfig = {
                title: 'Choose an Image',
                url: '/' + editor.getParam("refinery_core_backend_route") + '/dialogs/image',
                onMessage: function(api, data) {
                    switch (data.mceAction) {
                        case "insertRefineryImage":
                            editor.insertContent('<img src="' + data.src + '" alt="' + data.alt + '" title="' + data.title + '" />')
                            api.close()
                            break
                    }
                },
                width: 900,
                height: 640
            };

            // Define the Toolbar button
            editor.ui.registry.addButton('refineryimage', {
                icon: 'image',
                onAction: function() {
                    _api = editor.windowManager.openUrl(_urlDialogConfig)
                }
            });

        });
    }());
})();