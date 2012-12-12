class Omgwant.Views.StaticPage extends Backbone.View

  initialize: ->
    @render()

  render: ->
    @$el.html HandlebarsTemplates["static/#{@options.pageName}"]({})
    @