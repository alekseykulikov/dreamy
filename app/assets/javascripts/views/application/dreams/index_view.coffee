class App.Views.DreamsIndex extends Backbone.View
  template: JST['application/dreams/index']
  className: 'nine columns'

  events:
    'submit': 'newDream'
    'focusin #new_dream': 'deactivateDream'

  initialize: ->
    App.dreams.on('add', this.addOne)
    App.dreams.on('reset', this.render)

  addAll: ->
    App.dreams.each(this.addOne)

  addOne: (dream) =>
    view = new App.Views.DreamsItem(model: dream, parent: this)
    this.$('#dreams').append view.render().el

  render: =>
    $(@el).html @template()
    this.addAll()
    this.initKeys()
    this.focusDreamName()

    return this

  newDream: (event) ->
    event.preventDefault()
    newName = this.$('#dream_name').val()

    unless _.isEmpty(newName)
      dream = App.dreams.create {name: newName, created_at: (new Date).toString()}, {wait: true}
      this.$('#dream_name').val('')

  focusDreamName: ->
    this.$('#dream_name').focus()
    @activeDreamId = null

  deactivateDream: (event) =>
    if @activeDreamId
      $("#dreams .dream").removeClass('active')
      $("#dreams .dream p").removeAttr('contenteditable')

  initKeys: (event) ->
    $('body').off('keydown').on 'keydown', (event) =>
      switch event.keyCode
        when keys.up then return this.up()
        when keys.down then return this.down()

  up: ->
    if @activeDreamId
      prev = $("##{@activeDreamId}").prev()
      if prev.length is 0 then this.focusDreamName() else prev.click()
    else
      $('#dreams .dream:last').click()

    return false

  down: ->
    if @activeDreamId
      next = $("##{@activeDreamId}").next()
      if next.length is 0 then this.focusDreamName() else next.click()
    else
      $('#dreams .dream:first').click()

    return false
