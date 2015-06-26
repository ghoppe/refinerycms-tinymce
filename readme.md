# TinyMCE Visual Editing for RefineryCMS

TinyMCE is a platform independent web based Javascript HTML WYSIWYG editor control released as Open Source under LGPL.

This is an extention to Refinery to use TinyMCE as the editor in text fields.

## Customization

Options set upon initialization can be found in `assets/javascripts/refinery/boot_tinymce.js.erb`. Options have been selected to match the current functionality of the default WYMeditor that is used with Refinery. The only modification to basic TinyMCE formatting tools is the addition of a plugin: `stylebuttons`. This plugin replicates the P/H1/H2/H3 style buttons on the WYMeditor toolbar.

Documentation for customization of the `tinymce.init` function can be [found here.](http://www.tinymce.com/wiki.php/Configuration)

This is the first release and a work in progress. The dialog integration needs a bit of refinement so that the dialogs better fit the TinyMCE paradigm.

## Dialogs that show from TinyMCE

### Page Link dialog

The link dialog lets you link in several different ways:

* To an internal page
* To an external page
* To an email address
* To a resource you've uploaded in the Resources tab.

### Insert Image dialog

Simply lets you select from an existing image found in the Images tab or upload
a new one right within the dialog.
