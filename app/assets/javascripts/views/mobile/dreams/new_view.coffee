class App.Views.Mobile.New extends Backbone.View
  template: JST['mobile/dreams/new']

  events:
    "click .save" : "save"

  render:  ->
    @$el.html @template()

    @

  save: (event) ->
    newName = @$('#dream_name').val()
    unless _.isEmpty(newName)
      App.dreams.create {name: newName, created_at: (new Date).toString()}, success: ->
        App.router.navigate("index", trigger: true)

    return false