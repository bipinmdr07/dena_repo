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
//= require_tree .
//= require turbolinks

var load_ace, summernote, fixed_header_scroll;

/* ======= Fixed header when scrolled ======= */
fixed_header_scroll = function(){
  var toggle_scrolled = function(){
    if ($(window).scrollTop() > 0) {
      $('#header').addClass('scrolled');
    }
    else {
      $('#header').removeClass('scrolled');
    }
  }
  
  $(window).on('scroll load', toggle_scrolled);  
}

/* summernote editor */
summernote = function() {

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
  ready();
}

load_ace = function(){
  if ($("div#editor").length > 0) {
    var editor = ace.edit("editor");
    editor.setTheme("ace/theme/idle_fingers");
    editor.getSession().setMode("ace/mode/ruby");
    document.getElementById('editor').style.fontSize='14px';
    editor.setValue("\n\n\n\n\n\n\n\n\n");
    editor.gotoLine(1);
  }  
}

$(document).on('turbolinks:load', function() {    
  fixed_header_scroll();
  load_ace();    
  summernote();
});


