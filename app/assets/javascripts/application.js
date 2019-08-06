// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require activestorage
//= require turbolinks
//= require tinymce
//= require jquery.carouFredSel.js
//= require_tree .
//= require direct_uploads.js

document.addEventListener("turbolinks:load", function() {

    // course card hover shadow

    $(document).on({
        mouseenter: function() {
            $(this).removeClass("shadow");
            $(this).addClass("shadow-lg");
            $(this).css({"width": "101%", "height": "101%", "margin-top": "-0.5%", "margin-left": "-0.5%"});
        },
        mouseleave: function() {
            $(this).removeClass("shadow-lg");
            $(this).addClass("shadow");
            $(this).css({"width": "100%", "height": "100%", "margin-top": "0%", "margin-left": "0%"});
        }
    }, '.event-card');

    // disable inputs and links on form submits

    $('form').submit(function() {
            $('.form-control').attr("readonly", true);
            $('.form-control-file').css({"display": "none"});

            var links = $('a')
            links.addClass("disabled");
    });
});