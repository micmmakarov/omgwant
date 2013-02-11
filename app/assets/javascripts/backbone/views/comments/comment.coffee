class Omgwant.Views.Comment extends Backbone.View

  tagName: 'li'
  initialize: (options) ->
    @model = options.model

  events: ->
    'click .delete': 'delete'

  delete: (e) ->
    e.preventDefault()
    @model.destroy()

  render: ->
    @$el.html HandlebarsTemplates['comments/comment'](@model.toJSON())
    @