#= require jquery
#= require jquery_ujs
#= require underscore
#= require backbone
#= require backbone_offline
#= require sprockets/commonjs
#
#= require_tree ../templates
#= require_tree ./models
#= require_tree ./views
#= require_self

Dreams    = require('models/dream')
IndexView = require('views/dreams/index')
CountView = require('views/shared/count')

$ ->
  dreams = new Dreams()
  dreams.fetch()

  new IndexView(collection: dreams).render()
  new CountView(collection: dreams).render()
