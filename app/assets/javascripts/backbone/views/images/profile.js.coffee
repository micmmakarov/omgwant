class Omgwant.Views.Profile extends Backbone.View
  initialize: ->
    @model = new Omgwant.Models.User({id:@options.user_id})
    @model.on 'change', @render, @
    @model.fetch()
  render: ->
    @$el.html HandlebarsTemplates['profile'](@model.toJSON())
    @



