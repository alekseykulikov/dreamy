class App.Views.Mobile.Index extends Backbone.View
  template: JST['mobile/dreams/index']
  id: 'index'

  addAll: ->
    App.dreams.each(@addOne)

  addOne: (dream) =>
    view = new App.Views.Mobile.Dream(model: dream, parent: this)
    $(view.el).attr('data-role', 'fieldcontain')
    @$('#dreams').append view.render().el

  render:  ->
    @$el.html @template(count: App.dreams.length)
    @addAll()

    @