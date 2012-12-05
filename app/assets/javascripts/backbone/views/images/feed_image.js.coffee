class Omgwant.Views.FeedImage extends Backbone.View
  className: 'gallery-image'
  events:
    'click .like': 'like'

  initialize: ->
    @model.on 'change', @render, @

  like: (event) ->
    event.preventDefault()
    alert "please register" if typeof current_user is 'undefined'
    return if typeof current_user is 'undefined'
    @model.like()

  render: ->
    @$el.html HandlebarsTemplates['feed_image'](@model.toJSON())
    @