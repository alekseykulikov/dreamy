class App.Views.DreamsItem extends Backbone.View
  template: JST['application/dreams/dream']
  className: 'panel dream'

  events:
    'click': 'select'
    'keydown': 'checkDestroy'
    'focusout input': 'save'

  initialize: (options) ->
    {@parent} = options
    @model.on('change', this.render)
    @model.on('destroy', this.remove, this)

  render: =>
    @currentValue = @model.get('name')
    this.$el.html @template(name: @currentValue)
    this.$el.attr('id', @model.id)
    this

  getValue: ->
    this.$('input').val()

  select: (event) =>
    @parent.activateDream(@model.id)
    this.$el.addClass('active')
    this.$('input').focus()

  checkDestroy: (event) ->
    if event.keyCode is keys.backspace and (_.isEmpty(this.getValue()) or event.ctrlKey)
      this.destroy()

  save: (event) ->
    unless this.getValue() is @oldValue
      @model.save name: this.getValue()

  destroy: ->
    @oldValue = this.getValue()
    @parent.up()
    @model.destroy()
    false
