module.exports = ItemView = Backbone.View.extend
  template:   JST['dreams/item']
  tagName:   'li'
  className: 'panel dream'
  events:
    'click'          : 'select'
    'click .destroy' : 'destroy'
    'keydown'        : 'checkDestroy'
    'change input'   : 'save'

  initialize: (options) ->
    @listenTo(@model, 'change', @render)
    @listenTo(@model, 'destroy', @remove)

  render: ->
    @$el.html @template(name: @model.get('name'))
    @$el.attr 'id', @model.id
    @

  save: ->
    @model.save name: @$('input').val()

  destroy: ->
    @model.destroy()

  select: ->
    Backbone.trigger('select:item')
    @$el.addClass('active')
    @$('input').focus()

  checkDestroy: (event) ->
    if event.keyCode is 8 and (_.isEmpty(@$('input').val()) or event.ctrlKey)
      @destroy()
