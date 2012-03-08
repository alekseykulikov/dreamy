class App.Views.DreamsItem extends Backbone.View
  template: JST['dreams/dream']
  className: 'panel dream'

  events:
    'click': 'select'
    'keydown': 'keydown'
    'focusout p': 'save'

  initialize: (options) ->
    {@parent} = options
    @model.on('change', this.render)
    @model.on('destroy', => $(@el).remove())

  render: =>
    $(@el).html @template(@model.toJSON())
    $(@el).attr('id', @model.id)
    @oldValue = @model.get('name')
    @needSync = false

    return this

  select: (event) =>
    @parent.deactivateDream()
    @parent.activeDreamId = @model.id

    $(@el).addClass('active')
    this.$('p').attr('contenteditable', 'true')
    this.$('p').focus()

  keydown: (event) ->
    startPosition = document.getSelection().baseOffset
    value = this.$('p').html()
    totalPosition = value.length

    switch event.keyCode
      when keys.left then return @parent.up() if startPosition is 0
      when keys.right then return @parent.down() if startPosition is totalPosition
      when keys.enter then return @parent.down()
      when keys.backspace then return this.destroy() if value is '<br>' or event.ctrlKey

  save: (event) ->
    newValue = this.$('p').html()

    if newValue isnt @oldValue and newValue isnt '<br>'
      @needSync = true
      @oldValue = newValue
      @model.save name: newValue

  destroy: ->
    @parent.up()
    @model.destroy()
    this.remove()

    return false
