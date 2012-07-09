#= require jquery
#= require jquery_ujs
#= require backbone-rails
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

window.keys =
  backspace: 8
  enter: 13
  up: 38
  down: 40
  esc: 27

$ ->
  setTimeout (-> window.scrollTo(0, 0)), 0

  dreams = new App.Collections.Dreams()
  dreams.fetch()

  new App.Views.DreamsIndex(collection: dreams).render()
  new App.Views.SharedCount(collection: dreams).render()
