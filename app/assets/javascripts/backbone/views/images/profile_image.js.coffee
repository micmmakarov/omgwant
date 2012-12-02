class Omgwant.Views.ProfileImage extends Backbone.View
  tagName: 'li'
  initialize: ->
    @model.on 'change', @render, @
  render: ->
    @$el.html HandlebarsTemplates['profile_image'] @model.toJSON()
    @