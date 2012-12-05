class Omgwant.Views.DashboardImage extends Backbone.View
  className: "image"
  tagName: 'li'

  initialize: ->
    @model.on 'change', @render, @

  render: ->
    @el.addClass('published') if @model.published
    @$el.html HandlebarsTemplates['dashboard_image'](@model.toJSON())
    @



