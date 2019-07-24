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
//= require_tree .

// This is to create sticky navbar

// Get the navbar
var navbar = $("#navbar");

// When the user scrolls the page, execute myFunction
$(window).scroll(function() {
    console.log($(window).scrollTop() >= 474.39);
    if ($(window).scrollTop() >= 474.39) {
        $("#navbar").addClass('sticky')
    } else {
        $("#navbar").removeClass('sticky');
    }
});

function getPosition(element) {
    let location = 0;
    if (element.offsetParent) {
        do {
            location += element.offsetTop;
            element = element.offsetParent;
        } while (element);
    }
    return location >= 0 ? location : 0;
}
