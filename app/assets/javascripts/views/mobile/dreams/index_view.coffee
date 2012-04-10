class App.Views.Mobile.Index extends Backbone.View
  template: JST['mobile/dreams/index']
  id: 'index'

  render:  ->
    @$el.html @template(count: App.dreams.length)

    return this