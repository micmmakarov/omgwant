class Omgwant.Views.FeedImage extends Backbone.View
  className: 'gallery-image'
  events:
    'click .like': 'like'

  initialize: ->
    @model.on 'change', @render, @

  like: (event) ->
    event.preventDefault()
    @model.like()

  render: ->
    @$el.html HandlebarsTemplates['feed_image'](@model.toJSON())
    @