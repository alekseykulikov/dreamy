ItemView = require('./item')

module.exports = IndexView = Backbone.View.extend
  el: '#content'
  events:
    'submit #new_dream'   : 'newDream'
    'focusin #dream_name' : 'removeClassActive'
    'keydown'             : 'checkNavigation'

  initialize: ->
    @listenTo(@collection, 'add reset', @render)
    @listenTo(@collection, 'destroy', @focusOnNew)
    @listenTo(Backbone, 'select:item', @removeClassActive)

  render: ->
    @$('#dreams').html ''
    @collection.each @addOne
    @makeSortable()
    @

  addOne: (dream) =>
    view = new ItemView(model: dream)
    @$('#dreams').append view.render().el

  newDream: (event) ->
    event.preventDefault()
    @collection.createTo 0, { name: @$('#dream_name').val() },
                            { success: => @$('#dream_name').val('') }

  makeSortable: ->
    @$('#dreams').sortable().off('sortupdate').on 'sortupdate', (e, ui) =>
      model = @collection.get $(ui.item).attr('id')
      @collection.saveTo $(ui.item).index(), model

  focusOnNew: ->
    @$('#dream_name').focus()

  removeClassActive: ->
    @$('.dream').removeClass('active')

  hasSelected: ->
    @$('.dream.active').length isnt 0

  checkNavigation: (event) ->
    switch event.keyCode
      when 38 then @navigate('prev')
      when 40 then @navigate('next')
      when 13 then @navigate('next') if @hasSelected()
      when 27 then @focusOnNew()

  navigate: (direction) ->
    if @hasSelected()
      item = @$('.dream.active')[direction]()
      if item.length is 0 then @focusOnNew() else item.click()
    else
      selector = if direction is 'next' then 'first' else 'last'
      @$(".dream:#{selector}").click()
