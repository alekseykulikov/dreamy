#= require_self
#= require_tree ../templates
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views

window.l = (value) -> console.log(value)

window.keys =
  backspace: 8
  enter: 13
  left: 37
  up: 38
  right: 39
  down: 40

window.App =
  Models: {}
  Collections: {}
  Views: {}
  Utils: {}

  init: (options) ->
    App.dreams = new App.Collections.Dreams()
    App.dreams.fetch()

    indexView = new App.Views.DreamsIndex()
    $('#content').append indexView.render().el

    countView = new App.Views.DreamsCount()
    $('#content').append countView.render().el

$ ->
  App.init()
