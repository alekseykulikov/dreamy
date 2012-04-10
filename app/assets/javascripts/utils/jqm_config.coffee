$(document).bind "mobileinit", ->
  l 'init'
  $.mobile.ajaxEnabled = false
  $.mobile.linkBindingEnabled = false
  $.mobile.hashListeningEnabled = false
  $.mobile.pushStateEnabled = false

  $('div[data-role="page"]').live 'pagehide', (event, ui) ->
    $(event.currentTarget).remove();
