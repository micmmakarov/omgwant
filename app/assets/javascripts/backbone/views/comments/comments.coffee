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

  createComment: ->
    input = @$el.find(".comment-input")
    # validate: check for empty comment
    if(input.val().length < 1)
      return
    comment = input.val()
    input.val("")
    @collection.create
      text: comment
      user: {name: window.current_user.name}

  render: ->
    @$el.html HandlebarsTemplates['comments/comments']
    @collection.each(@addOne, @)
    @
