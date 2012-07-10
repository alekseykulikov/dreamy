class App.Views.DreamsIndex extends Backbone.View
  el: '#content'
  events:
    'submit #new_dream'   : 'newDream'
    'focusin #dream_name' : 'removeClassActive'
    'keydown'             : 'checkNavigation'

  initialize: ->
    @collection.on('add', @addOne)
    @collection.on('reset', @render)
    @collection.on('destroy', @focusOnNew)

  render: =>
    @addAll()
    @

  addAll: ->
    @$('#dreams').html ''
    @collection.each @addOne

  addOne: (dream) =>
    view = new App.Views.DreamsItem(model: dream)
    @$('#dreams').prepend view.render().el

  newDream: (event) ->
    event.preventDefault()
    @collection.create name: @$('#dream_name').val(), created_at: (new Date).toString(),
                       success: => @$('#dream_name').val('')

  focusOnNew: =>
    @$('#dream_name').focus()

  removeClassActive: ->
    @$('.dream').removeClass('active')

  hasSelected: ->
    @$('.dream.active').length isnt 0

  checkNavigation: (event) ->
    switch event.keyCode
      when keys.up    then @navigate('prev')
      when keys.down  then @navigate('next')
      when keys.enter then @navigate('next') if @hasSelected()
      when keys.esc   then @focusOnNew()

  navigate: (direction) =>
    if @hasSelected()
      item = @$('.dream.active')[direction]()
      if item.length is 0 then @focusOnNew() else item.click()
    else
      selector = if direction is 'next' then 'first' else 'last'
      @$(".dream:#{selector}").click()
