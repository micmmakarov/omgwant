class Omgwant.Views.Comments extends Backbone.View
  className: 'comments'

  initialize: (options) ->
    @collection = options.collection
    @collection.on 'reset', @render, @
    @collection.on 'remove', @render, @
    @collection.on 'add', @render, @
    console.log @collection
    @render()

  events:
    'click .create-comment': 'createComment'
    'keydown .comment-input': 'createOnEnter'

  addOne: (comment) ->
    view = new Omgwant.Views.Comment(model: comment)
    @$el.find(".comments-template").append view.render().el

  createOnEnter: (e) =>
    if e.keyCode is 13
      @createComment(e)

  render: ->
    @$el.html HandlebarsTemplates['comments/comments']
    @collection.each(@addOne, @)
    @

  createComment: ->
    text = @$el.find(".comment-input").val()
    @$el.find(".comment-input").val("")
    @collection.create
      text: text
