#= require jquery
#= require summernote
#= require active_admin/base
# $(document).ready ->
#   $('#summernote').summernote()
#   return

### summernote editor ###

$ ->
  delete_episode_image = undefined
  ready = undefined
  upload_episode_image = undefined

  upload_episode_image = (that, file) ->
    data = undefined
    data = new FormData
    data.append 'image[photo]', file
    $.ajax
      data: data
      type: 'POST'
      url: '/images'
      cache: false
      contentType: false
      processData: false
      success: (data) ->
        img = undefined
        img = document.createElement('IMG')
        img.src = data.url
        img.setAttribute 'id', data.image_id
        $(that).summernote 'insertNode', img

  delete_episode_image = (file_id) ->
    $.ajax
      type: 'DELETE'
      url: '/images/' + file_id
      cache: false
      contentType: false
      processData: false

  ready = ->
    $('[data-provider="summernote"]').each ->
      $(this).summernote
        height: 250
        toolbar: [
          [
            'style'
            [ 'style' ]
          ]
          [
            'font'
            [
              'bold'
              'italic'
              'underline'
              'clear'
            ]
          ]
          [
            'fontname'
            [ 'fontname' ]
          ]
          [
            'color'
            [ 'color' ]
          ]
          [
            'para'
            [
              'ul'
              'ol'
              'paragraph'
            ]
          ]
          [
            'height'
            [ 'height' ]
          ]
          [
            'table'
            [ 'table' ]
          ]
          [
            'insert'
            [
              'link'
              'picture'
              'hr'
            ]
          ]
          [
            'view'
            [
              'fullscreen'
              'codeview'
            ]
          ]
        ]
        prettifyHtml: false
        codemirror:
          lineNumbers: true
          tabSize: 2
          theme: 'railscasts'
        callbacks:
          onImageUpload: (files) ->
            img = undefined
            img = upload_episode_image(this, files[0])
          onMediaDelete: (target, editor, editable) ->
            image_id = undefined
            image_id = target[0].id
            if ! !image_id
              delete_episode_image image_id
            target.remove()

  $(document).ready ready
  $(document).on 'turbolinks:load', ready
$(document).ready ->
  $('#summernote').summernote()
  return

###  summernote ###

# ---
# generated by js2coffee 2.2.0
