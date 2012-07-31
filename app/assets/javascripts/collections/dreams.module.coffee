class Dreams extends Backbone.Collection
  model: require('models/dream')
  url: '/api/dreams'

  initialize: ->
    @storage = new Offline.Storage('dreams', @, autoPush: true)

  comparator: (dream) ->
    (new Date(dream.get 'created_at')).getTime()

module.exports = Dreams