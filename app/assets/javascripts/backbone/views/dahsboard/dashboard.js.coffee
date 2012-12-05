class Omgwant.Views.Dashboard extends Backbone.View
  initialize: ->
    @collection = new Omgwant.Collections.Images()
    @collection.get_dashboard_url()
    @collection.on 'reset', @render, @
    @collection.fetch()

  addOne: (image) ->
    view = new Omgwant.Views.DashboardImage(model: image)
    ($ ".image-list").append view.render().el
  render: ->
    @$el.html HandlebarsTemplates['dashboard']({})
    @collection.each(@addOne, @)
    @