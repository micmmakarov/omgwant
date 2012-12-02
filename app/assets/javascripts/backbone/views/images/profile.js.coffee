class Omgwant.Views.Profile extends Backbone.View
  model: new Omgwant.Models.User({})
  initialize: ->
    @model.on 'change', @render, @
  render: ->
    @$el.html HandlebarsTemplates['profile'](@model.toJSON())
    @



