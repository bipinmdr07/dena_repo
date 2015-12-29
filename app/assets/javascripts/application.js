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
//= require jquery_ujs
//= require jquery-ui
//= require bootstrap-sprockets
//= require ckeditor/init
//= require turbolinks
//= require_tree .

$ ->
  loadGists()
  $(document).on 'page:load', loadGists

loadGists = ->
  $('.gist').each ->
    loadGist $(this)

loadGist = ($gist) ->
  callbackName = 'c' + Math.random().toString(36).substring(7)

  window[callbackName] = (gistData) ->
    delete window[callbackName]
    html = '<link rel="stylesheet" href="https://gist.github.com' + encodeURI(gistData.stylesheet) + '"></link>'
    html += gistData.div
    $gist.html html
    script.parentNode.removeChild script

  script = document.createElement 'script'
  script.setAttribute 'src', [
    $gist.data('src'), 
    $.param(
      callback: callbackName
      file: $gist.data('file') || ''
    )
  ].join '?'
  document.body.appendChild script