class Omgwant.Views.Comments extends Backbone.View
  class_name: 'comments'

  initialize: (options) ->
    @collection = options.collection
    @collection.on 'reset', @render, @
    @collection.on 'remove', @render, @
    @collection.on 'add', @render, @
    console.log @collection
    @render()


  events:
    'click .createComment': 'createComment'

  addOne: (comment) ->
    view = new Omgwant.Views.Comment(model: comment)
    @$el.find(".comments-template").append view.render().el

  render: ->
    @$el.html HandlebarsTemplates['comments/comments']
    @collection.each(@addOne, @)
    @

  createComment: ->
    text = @$el.find(".newComment").val()
    @$el.find(".newComment").val("")
    @collection.create
      text: text
