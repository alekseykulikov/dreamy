#= require jquery
#= require jquery_ujs
#= require backbone_offline
#= require sprockets/commonjs
#
#= require_tree ../templates
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require_self

Dreams    = require('collections/dreams')
IndexView = require('views/dreams/index')
CountView = require('views/shared/count')

window.keys =
  backspace: 8
  enter: 13
  up: 38
  down: 40
  esc: 27

$ ->
  dreams = new Dreams()
  dreams.fetch()

  new IndexView(collection: dreams).render()
  new CountView(collection: dreams).render()
