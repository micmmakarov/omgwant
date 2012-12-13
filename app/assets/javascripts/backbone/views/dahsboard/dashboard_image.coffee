class Omgwant.Views.DashboardImage extends Backbone.View
  className: "image"
  tagName: 'li'

  initialize: ->
    @model.on 'change', @render, @
    @model.products.on 'change', @products_refresh, @

  events:
    'click .publish': 'publish'

  products_refresh: ->
    alert "refreshed"

  publish: (event) ->
    event.preventDefault()
    published = not @model.get 'published'
    @model.set('published', published)
    @model.save()

  render: ->
    if @model.get('published')
      @$el.addClass('published')
    else
      @$el.removeClass('published')
      
    @$el.html HandlebarsTemplates['dashboard/dashboard_image'] @model.toJSON()
    @searchView = new Omgwant.Views.LiveSearch
      el:@$el.find '.products'
      image:@model
    @



