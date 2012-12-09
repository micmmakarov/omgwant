class Omgwant.Views.DashboardImage extends Backbone.View
  className: "image"
  tagName: 'li'

  initialize: ->
    @model.on 'change', @render, @

  events:
    'click .publish': 'publish'
    # 'keyup :input': 'type'

  # type: _.debounce(->
  #   console.log "Loading"
  #   $.ajax
  #     type: "GET"
  #     url: "http://omg-node-api.herokuapp.com"
  #     data: {search: @$el.find("input").val()}
  #     dataType: 'JSONP'
  #     success: (data) =>
  #       window.data = data
  #       result = data.products.map((item, i) ->
  #         item.name if item.name isnt "" or typeof item.name isnt 'undefined'
  #       )
  #       @$el.find('input').typeahead().data('typeahead').source = result
  #       console.log "finished loading"
  # , 100)

    #http://api.shopstyle.com/action/apiSearch?pid=uid7444-8563962-34&fts=red+dress&min=0&count=10


  publish: (event) ->
    event.preventDefault()
    published = not @model.get('published')
    @model.set('published', published)
    @model.save()
    #@$el.find('input').typeahead();

  render: ->
    if @model.get('published')
      @$el.addClass('published')
    else
      @$el.removeClass('published')
      
    @$el.html HandlebarsTemplates['dashboard_image'] @model.toJSON()    
    @searchView = new Omgwant.Views.LiveSearch({el:@$el.find('.products')})
    @



