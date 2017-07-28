$(document).on 'ready page:load', ->
  $('div.alert-danger').delay(2000).slideUp()
  $('div.alert-success').delay(2000).slideUp()
  $('alert alert-notice').delay(2000).slideUp()
  cancel_function = ->
    window.history.back()