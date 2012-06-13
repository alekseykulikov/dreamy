class App.Views.Mobile.Dream extends Backbone.View
  template: JST['mobile/dreams/dream']
  tagName: 'li'

  render: =>
    @$el.html @template(@model.toJSON())
    @
