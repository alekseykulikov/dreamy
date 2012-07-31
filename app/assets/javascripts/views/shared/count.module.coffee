class Count extends Backbone.View
  el: '#count'
  events:
    'click .full' : 'fullSync'
    'click .part' : 'incrementalSync'

  initialize: ->
    @collection.on('reset add destroy', @render)

  render: =>
    @$('#counter').html @collection.length
    @

  fullSync: ->
    @collection.storage.sync.full()

  incrementalSync: ->
    @collection.storage.sync.incremental()

module.exports = Count