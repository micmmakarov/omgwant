class Omgwant.Views.DashboardImage extends Backbone.View
  className: "image"
  tagName: 'li'

  initialize: ->
    @model.on 'change', @render, @

  events:
    'click .publish': 'publish'
    'keypress :input': 'type'

  type: _.debounce(->

    #alert @$el.find("input").val()
    $.ajax
      type: "POST"
      url: "/api/search"
      data: {search: @$el.find("input").val()}
      success: (data) =>

        result = data.map((item, i) ->
          item.name
        )
        @$el.find('input').typeahead().data('typeahead').source = result
  , 50)

    #http://api.shopstyle.com/action/apiSearch?pid=uid7444-8563962-34&fts=red+dress&min=0&count=10


  publish: (event) ->
    event.preventDefault()
    published = not @model.get('published')
    @model.set('published', published)
    @model.save()
    @$el.find('input').typeahead();

  render: ->
    if @model.get('published')
      @$el.addClass('published')
    else
      @$el.removeClass('published')
    @$el.html HandlebarsTemplates['dashboard_image'](@model.toJSON())
    @



