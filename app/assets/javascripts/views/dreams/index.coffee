class App.Views.DreamsIndex extends Backbone.View
  template: JST['dreams/index']
  el:       '#content'

  events:
    'submit #new_dream'   : 'newDream'
    'focusin #dream_name' : 'removeClassActive'
    'keydown'             : 'checkNavigation'

  initialize: ->
    App.dreams.on('add', @addOne)
    App.dreams.on('reset', @render)
    App.dreams.on('destroy', @focusOnNew)

  render: =>
    @$el.html @template()
    @addAll()
    @

  addAll: ->
    App.dreams.each(@addOne)

  addOne: (dream) =>
    view = new App.Views.DreamsItem(model: dream)
    @$('#dreams').prepend view.render().el

  newDream: (event) ->
    event.preventDefault()
    App.dreams.create name: @$('#dream_name').val(), created_at: (new Date).toString(),
                      success: => @$('#dream_name').val('')

  focusOnNew: =>
    @$('#dream_name').focus()

  removeClassActive: ->
    @$('.dream').removeClass('active')

  hasSelected: ->
    @$('.dream.active').length isnt 0

  checkNavigation: (event) ->
    switch event.keyCode
      when keys.up    then @up()
      when keys.down  then @down()
      when keys.enter then @down() if @hasSelected()
      when keys.esc   then @focusOnNew()

  up: =>
    if @hasSelected()
      prev = @$('.dream.active').prev()
      if prev.length is 0 then @focusOnNew() else prev.click()
    else
      @$('.dream:last').click()

  down: ->
    if @hasSelected()
      next = @$('.dream.active').next()
      if next.length is 0 then @focusOnNew() else next.click()
    else
      @$('.dream:first').click()
