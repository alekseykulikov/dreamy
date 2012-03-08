class App.Collections.Dreams extends Backbone.Collection
  model: App.Models.Dream
  url: '/api/dreams'

  initialize: ->
    @storage = new Storage('dreams', this)

  comparator: (idea) ->
    (new Date(idea.get 'created_at')).getTime()
