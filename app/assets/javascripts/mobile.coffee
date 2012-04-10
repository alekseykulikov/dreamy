#= require shared
#= require ./utils/jqm_config
#= require jquery.mobile
#= require_self
#= require_tree ../templates/mobile
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views/mobile
#= require ./routers/mobile_router

App.Views.Mobile = {}

$ ->
  App.dreams = new App.Collections.Dreams()
  App.dreams.fetch()

  App.router = new App.Routers.Mobile()
  Backbone.history.start()