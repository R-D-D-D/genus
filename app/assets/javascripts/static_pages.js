// This is to create sticky navbar
// When the user scrolls the page, execute myFunction
$(window).scroll(function() {
    console.log($(window).scrollTop() >= 488);
    if ($(window).scrollTop() >= 488) {
        $("#navbar").addClass('sticky')
    } else {
        $("#navbar").removeClass('sticky');
    }
});
