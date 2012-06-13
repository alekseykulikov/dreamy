class App.Collections.Dreams extends Backbone.Collection
  model: App.Models.Dream
  url: '/api/dreams'

  initialize: ->
    @storage = new Offline.Storage('dreams', @, autoPush: true)

  comparator: (dream) ->
    (new Date(dream.get 'created_at')).getTime()
