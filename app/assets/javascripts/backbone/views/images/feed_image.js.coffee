class Omgwant.Views.FeedImage extends Backbone.View

  className: 'gallery-image'
  events:
    'click .like': 'like'
    'click .img' : 'show_image'

  initialize: ->
    @model.on 'change', @render, @

  like: (event) ->
    alert "Please sign in to like photos" if typeof current_user is 'undefined'
    return if typeof current_user is 'undefined'
    @model.like()
    false

  show_image: ->
    Omgwant.currentImage = @model
    Omgwant.router.navigate "/photo/#{@model.get('id')}", {trigger: true}
  
  render: ->
    @$el.html HandlebarsTemplates['images/feed_image'](@model.toJSON())
    @