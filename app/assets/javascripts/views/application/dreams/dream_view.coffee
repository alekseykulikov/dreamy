class App.Views.DreamsItem extends Backbone.View
  template: JST['application/dreams/dream']
  className: 'panel dream'

  events:
    'click': 'select'
    'click .destroy' : 'destroy'
    'keydown': 'checkDestroy'
    'change input': 'save'

  initialize: (options) ->
    @model.on('change', this.render)
    @model.on('destroy', this.remove, this)

  render: =>
    @currentValue = @model.get('name')
    this.$el.html @template(name: @currentValue)
    this

  getValue: ->
    this.$('input').val()

  select: (event) ->
    $('.dream').removeClass('active')
    this.$el.addClass('active')
    this.$('input').focus()

  checkDestroy: (event) ->
    if event.keyCode is keys.backspace and (_.isEmpty(this.getValue()) or event.ctrlKey)
      this.destroy(event)

  save: (event) ->
    unless this.getValue() is @oldValue
      @model.save name: this.getValue()

  destroy: (event) ->
    @oldValue = this.getValue()
    this.trigger('unactive')
    @model.destroy()
    false
