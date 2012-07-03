class App.Views.SharedCount extends Backbone.View
  template: JST['shared/count']
  el:       '#count'

  events:
    'click .full' : 'fullSync'
    'click .part' : 'incrementalSync'

  initialize: ->
    App.dreams.on('reset add destroy', @render)

  render: =>
    @$el.html @template(count: App.dreams.length)
    @

  fullSync: (event) ->
    event.preventDefault()
    App.dreams.storage.sync.full()

  incrementalSync: (event) ->
    event.preventDefault()
    App.dreams.storage.sync.incremental()
