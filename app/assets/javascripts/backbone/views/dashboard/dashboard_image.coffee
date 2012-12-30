class Omgwant.Views.DashboardImage extends Backbone.View
  className: "image"
  tagName: 'li'

  initialize: ->
    @model.on 'change', @render, @

  events:
    'click .publish': 'publish'
    'click .category-selector li a': 'choose_category'

  publish: (event) ->
    event.preventDefault()
    published = not @model.get 'published'
    @model.set('published', published)
    @model.save()

  choose_category: (e) ->
    e.preventDefault()
    category = $(e.target).attr('href')
    @model.set 'category', category
    @model.save()
    false

  render: ->
    if @model.get('published')
      @$el.addClass('published')
    else
      @$el.removeClass('published')
    @$el.html HandlebarsTemplates['dashboard/dashboard_image'] @model.toJSON()
    @ProductsView = new Omgwant.Views.Products
      el:@$el.find '.product-list'
      collection:@model.products
    @searchView = new Omgwant.Views.LiveSearch
      el:@$el.find '.products'
      image:@model
    @



