class App.Routers.Mobile extends Backbone.Router
  routes:
    '.*'   : 'index'
    'index': 'index'
    'new'  : 'new'

  index: ->
    this.changePage new App.Views.Mobile.Index()

  new: ->
    this.changePage new App.Views.Mobile.New()

  changePage: (page) ->
    $(page.el).attr('data-role', 'page')
    $('body').append page.render().el
    $.mobile.changePage $(page.el), changeHash:false
