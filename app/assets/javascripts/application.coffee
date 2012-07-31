#= require jquery
#= require jquery_ujs
#= require backbone-rails
#= require backbone_offline
#= require sprockets/commonjs
#
#= require_tree ../templates
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require_self

Dreams = require('collections/dreams')
Index  = require('views/dreams/index')
Count  = require('views/shared/count')

window.keys =
  backspace: 8
  enter: 13
  up: 38
  down: 40
  esc: 27

$ ->
  setTimeout (-> window.scrollTo(0, 0)), 0

  dreams = new Dreams()
  dreams.fetch()

  new Index(collection: dreams).render()
  new Count(collection: dreams).render()
