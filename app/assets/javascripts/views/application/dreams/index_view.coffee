class App.Views.DreamsIndex extends Backbone.View
  template: JST['application/dreams/index']

  events:
    'submit': 'newDream'
    'focusin #dream_name': 'focusInNewDream'
    'keydown' : 'checkNavigation'

  initialize: ->
    App.dreams.on('add', this.addOne)
    App.dreams.on('reset', this.render)

  render: =>
    this.$el.html @template()
    this.addAll()
    this

  addAll: ->
    App.dreams.each(this.addOne)

  addOne: (dream) =>
    view = new App.Views.DreamsItem(model: dream, parent: this)
    this.$('#dreams').prepend view.render().el

  newDream: (event) ->
    event.preventDefault()
    newName = this.$('#dream_name').val()

    unless _.isEmpty(newName)
      dream = App.dreams.create name: newName, created_at: (new Date).toString()
      this.$('#dream_name').val('')

  focusInNewDream: ->
    this.activateDream(null)

  activateDream: (dreamId) =>
    this.$('#dreams .dream').removeClass('active')
    @activeDreamId = dreamId

  checkNavigation: (event) ->
    switch event.keyCode
      when keys.up then return this.up()
      when keys.down then return this.down()
      when keys.enter then return this.down() if @activeDreamId

  up: =>
    if @activeDreamId
      prev = $("##{@activeDreamId}").prev()
      if prev.length is 0 then this.$('#dream_name').focus() else prev.click()
    else
      this.$('#dreams .dream:last').click()
    false

  down: ->
    if @activeDreamId
      next = $("##{@activeDreamId}").next()
      if next.length is 0 then this.$('#dream_name').focus() else next.click()
    else
      this.$('#dreams .dream:first').click()
    false
