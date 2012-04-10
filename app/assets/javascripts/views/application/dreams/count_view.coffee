class App.Views.DreamsCount extends Backbone.View
  template: JST['application/dreams/count']
  className: 'three columns'
  id: 'count'

  events:
    'click .full': 'fullSync'
    'click .part': 'incrementalSync'

  initialize: ->
    App.dreams.on('reset add destroy', this.render)

  render: =>
    $(this.el).html @template count: App.dreams.length
    return this

  fullSync: (event) ->
    App.dreams.storage.sync.full()
    return false

  incrementalSync: (event) ->
    App.dreams.storage.sync.incremental()
    return false