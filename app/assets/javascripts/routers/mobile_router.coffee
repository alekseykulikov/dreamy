class App.Routers.Mobile extends Backbone.Router
  routes:
    '.*'   : 'index'
    'index': 'index'
    'new'  : 'new'
    'dreams/:id' : 'new'

  index: =>
    App.dreams.on('reset', @index)
    @changePage new App.Views.Mobile.Index()

  new: () ->
    @changePage new App.Views.Mobile.New()

  changePage: (page) ->
    $(page.el).attr('data-role', 'page')
    $('body').append page.render().el
    $.mobile.changePage $(page.el), changeHash:false
