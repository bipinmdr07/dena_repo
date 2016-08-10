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
//= require summernote
//= require RRSSB
//= require ace-rails-ap
//= require_tree .
//= require turbolinks


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

/* summernote editor */
  $(function() {
    var delete_episode_image, ready, upload_episode_image;
    upload_episode_image = function(that, file) {
      var data;
      data = new FormData;
      data.append('image[photo]', file);
      return $.ajax({
        data: data,
        type: 'POST',
        url: '/images',
        cache: false,
        contentType: false,
        processData: false,
        success: function(data) {
          var img;
          img = document.createElement('IMG');
          img.src = data.url;
          img.setAttribute('id', data.image_id);
          return $(that).summernote('insertNode', img);
        }
      });
    };
    delete_episode_image = function(file_id) {
      return $.ajax({
        type: 'DELETE',
        url: "/images/" + file_id,
        cache: false,
        contentType: false,
        processData: false
      });
    };
    ready = function() {
      return $('[data-provider="summernote"]').each(function() {
        return $(this).summernote({
          height: 250,
          toolbar: [['style', ['style']], ['font', ['bold', 'italic', 'underline', 'clear']], ['fontname', ['fontname']], ['color', ['color']], ['para', ['ul', 'ol', 'paragraph']], ['height', ['height']], ['table', ['table']], ['insert', ['link', 'picture', 'hr']], ['view', ['fullscreen', 'codeview']]],
          prettifyHtml: false,
          codemirror: {
            lineNumbers: true,
            tabSize: 2,
            theme: "railscasts"
          },
          callbacks: {
            onImageUpload: function(files) {
              var img;
              return img = upload_episode_image(this, files[0]);
            },
            onMediaDelete: function(target, editor, editable) {
              var image_id;
              image_id = target[0].id;
              if (!!image_id) {
                delete_episode_image(image_id);
              }
              return target.remove();
            }
          }
        });
      });
    };
    $(document).ready(ready);
    return $(document).on('turbolinks:load', ready);
  });

/*  summernote */
