class App.Views.Mobile.Index extends Backbone.View
  template: JST['mobile/dreams/index']
  id: 'index'

  addAll: ->
    App.dreams.each(this.addOne)

  addOne: (dream) =>
    view = new App.Views.Mobile.Dream(model: dream, parent: this)
    $(view.el).attr('data-role', 'fieldcontain')
    this.$('#dreams').append view.render().el

  render:  ->
    @$el.html @template(count: App.dreams.length)
    this.addAll()

    return this