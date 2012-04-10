#= require shared
#= require_self
#= require_tree ../templates/application
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views/application

window.keys =
  backspace: 8
  enter: 13
  left: 37
  up: 38
  right: 39
  down: 40

$ ->
  App.dreams = new App.Collections.Dreams()
  App.dreams.fetch()

  indexView = new App.Views.DreamsIndex()
  $('#content').append indexView.render().el

  countView = new App.Views.DreamsCount()
  $('#content').append countView.render().el