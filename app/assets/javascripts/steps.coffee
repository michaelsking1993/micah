# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  $('span[data-step-id]').click ->
    contents = $(this).text()
    $(this).on 'blur', (event) ->
      event.stopImmediatePropagation();
      new_contents = $(this).text()
      if new_contents != contents
        step_id = $(this).data('step-id')
        $.ajax
          url: "/steps/#{step_id}"
          type: 'PATCH'
          dataType: 'json'
          data: {title:new_contents}
          #error: () ->
            #renderFlashMessages('error', 'something went wrong')
          #success: () ->
            #renderFlashMessages('success', 'step updated')




