class App.Views.Mobile.New extends Backbone.View
  template: JST['mobile/dreams/new']

  render:  ->
    @$el.html @template()

    return this