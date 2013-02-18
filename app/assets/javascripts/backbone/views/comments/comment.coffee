class Omgwant.Views.Comment extends Backbone.View

  tagName: 'li'
  initialize: (options) ->
    @model = options.model

  events: ->
    'click .delete-comment': 'delete'

  delete: (e) ->
    e.preventDefault()
    @$el.slideUp 'fast', =>
      @model.destroy()
      @unbind()

  render: ->
    deletable = true if window.current_user.id == @model.get('user').id
    model = @model.toJSON()
    model['deletable'] = deletable
    @$el.html HandlebarsTemplates['comments/comment'](model)
    @
