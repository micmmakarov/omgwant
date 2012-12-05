class Omgwant.Views.DashboardImage extends Backbone.View
  className: "image"
  tagName: 'li'

  initialize: ->
    @model.on 'change', @render, @

  events:
    'click .publish': 'publish'
    'keypress .add-product': 'type'

  type: ->
    @$el.find(".add-products").process(window.a)
    alert "sd"

  publish: (event) ->
    event.preventDefault()
    published = not @model.get('published')
    @model.set('published', published)
    @model.save()

  render: ->
    if @model.get('published')
      @$el.addClass('published')
    else
      @$el.removeClass('published')

    window.a = ['Toronto','Montreal','New York','Buffalo','Montreal','New York','Buffalo','Montreal','New York','Buffalo','Montreal','New York','Buffalo','Montreal','New York','Buffalo']
    options = {source: window.a, items: 5}
    @$el.find(".add-products").typeahead options

    @$el.html HandlebarsTemplates['dashboard_image'](@model.toJSON())
    @



