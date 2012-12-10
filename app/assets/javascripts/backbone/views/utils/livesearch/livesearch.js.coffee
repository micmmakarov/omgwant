class Omgwant.Views.LiveSearch extends Backbone.View
  
  events:
    'keyup :input': 'search'
    
  initialize: ->
    window.view = @
    @collection = new Omgwant.Collections.Products()
    @collection.on 'add', @addItem, @
    @render()

  addItem: (model)->
    itemView = new Omgwant.Views.LiveSearchItem(model: model)
    @$el.find('.livesearch-items').append itemView.el
    @collection.on 'reset', @cleanUp, itemView
  
  cleanUp: (collection)->
    # @ - is a view passed on trigger
    @kill()
      
  search: _.debounce (event) ->
    # if user cleared up the input - do not fetch anything
    # just clean up the models; be ready for new search
    @collection.reset()
    return if not /\w+/.test event.target.value
    @collection.fetch
      add: true
      data: 
        search: event.target.value
      dataType:'jsonp'
  , 500
    
  render: ->
    @$el.html HandlebarsTemplates['livesearch'] {}