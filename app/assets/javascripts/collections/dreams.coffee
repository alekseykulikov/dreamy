class App.Collections.Dreams extends Backbone.Collection
  model: App.Models.Dream
  url: '/api/dreams'

  initialize: ->
    @storage = new Offline.Storage('dreams', this, autoPush: true)

  comparator: (idea) ->
    (new Date(idea.get 'created_at')).getTime()
