class Omgwant.Views.DashboardImage extends Backbone.View
  className: "image"
  tagName: 'li'

  initialize: ->
    @model.on 'change', @render, @

  events:
    'click .publish': 'publish'

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
      
    @$el.html HandlebarsTemplates['dashboard_image'] @model.toJSON()    
    @searchView = new Omgwant.Views.LiveSearch({el:@$el.find('.products')})
    @



