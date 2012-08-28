Dream = require('models/dream')

module.exports = class Dreams extends Backbone.Collection
  model: Dream
  url: '/api/dreams'

  initialize: ->
    @storage = new Offline.Storage('dreams', @, autoPush: true)

  comparator: (dream) ->
    (new Date(dream.get 'created_at')).getTime()
