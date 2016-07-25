// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap-sprockets
//= require RRSSB
//= require ckeditor/init
//= require ace-rails-ap
//= require turbolinks
//= require_tree .


/* ======= Header Background Slideshow - Flexslider ======= */    
    /* Ref: https://github.com/woothemes/FlexSlider/wiki/FlexSlider-Properties */
    
$('.bg-slider').flexslider({  
    animation: "fade",
    directionNav: false, //remove the default direction-nav - https://github.com/woothemes/FlexSlider/wiki/FlexSlider-Properties
    controlNav: false, //remove the default control-nav
    slideshowSpeed: 8000
});

/* ======= Fixed header when scrolled ======= */    
$(window).on('scroll load', function() {
     
     if ($(window).scrollTop() > 0) {
         $('#header').addClass('scrolled');
     }
     else {
         $('#header').removeClass('scrolled');
         
     }
});