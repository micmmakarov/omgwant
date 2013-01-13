class Omgwant.Views.LikedImage extends Backbone.View
  tagName: 'li'

  initialize: ->
    @model.on 'change', @render, @

  events:
    'click' : 'show_image'

  show_image: ->
    Omgwant.currentImage = @model
    Omgwant.router.navigate "/photo/#{@model.get('id')}", {trigger: true}


  render: ->
    @$el.html HandlebarsTemplates['images/liked_image'] @model.toJSON()
    @