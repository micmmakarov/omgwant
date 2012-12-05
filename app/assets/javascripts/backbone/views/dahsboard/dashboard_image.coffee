class Omgwant.Views.DashboardImage extends Backbone.View
  className: "image"
  tagName: 'li'

  initialize: ->
    @model.on 'change', @render, @

  events:
    'click .publish': 'publish'
    'keypress :input': 'type'

  type: _.debounce(->
    alert @$el.find(".add-product").val()
    $.ajax
      type: "GET"
      url: "http://api.shopstyle.com/action/apiGetBrands?pid=uid7444-8563962-34"
      success: (data) =>
  , 2000)

    #http://api.shopstyle.com/action/apiSearch?pid=uid7444-8563962-34&fts=red+dress&min=0&count=10


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

    @$el.html HandlebarsTemplates['dashboard_image'](@model.toJSON())
    @



