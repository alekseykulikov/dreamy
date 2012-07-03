#= require jquery
#= require jquery_ujs
#= require underscore
#= require backbone
#= require backbone_rails_sync
#= require backbone_offline
#
#= require_self
#= require_tree ../templates
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views

window.App =
  Models: {}
  Collections: {}
  Views: {}

window.l = (values...) ->
  console.log(values...)

window.keys =
  backspace: 8
  enter: 13
  up: 38
  down: 40
  esc: 27

$ ->
  App.dreams = new App.Collections.Dreams()
  App.dreams.fetch()

  new App.Views.DreamsIndex().render()
  new App.Views.SharedCount().render()
