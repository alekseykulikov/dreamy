class App.Views.DreamsItem extends Backbone.View
  template:   JST['application/dreams/item']
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

  save: (event) ->
    @model.save name: @getValue()

  destroy: (event) ->
    event.preventDefault()
    @model.destroy()

  getValue: ->
    @$('input').val()

  select: (event) ->
    $('.dream').removeClass('active')
    @$el.addClass('active')
    @$('input').focus()

  checkDestroy: (event) ->
    if event.keyCode is keys.backspace and (_.isEmpty(@getValue()) or event.ctrlKey)
      @destroy(event)
