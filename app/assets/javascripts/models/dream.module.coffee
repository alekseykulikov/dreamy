class Dream extends Backbone.Model
  validate: (attrs) ->
    name = $.trim(attrs.name)
    return "Can't be blank" if _.isEmpty(name)

module.exports = Dream