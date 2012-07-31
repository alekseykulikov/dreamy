class Item extends Backbone.View
  template:   JST['dreams/item']
  className: 'panel dream'
  events:
    'click'          : 'select'
    'click .destroy' : 'destroy'
    'keydown'        : 'checkDestroy'
    'change input'   : 'save'

  initialize: (options) ->
    @model.on('change', @render)
    @model.on('destroy', @remove, @)

  render: =>
    @$el.html @template(name: @model.get('name'))
    @

  save: ->
    @model.save name: @$('input').val()

  destroy: ->
    @model.destroy()

  select: ->
    $('.dream').removeClass('active')
    @$el.addClass('active')
    @$('input').focus()

  checkDestroy: (event) ->
    if event.keyCode is keys.backspace and (_.isEmpty(@$('input').val()) or event.ctrlKey)
      @destroy(event)

module.exports = Item