class Omgwant.Views.LiveSearch extends Backbone.View
  
  events:
    'keyup :input': 'search'
    
  initialize: ->
    _.bindAll @, 'flashBefore', 'flashDone'
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
  flashBefore: ->
    Omgwant.Messages.trigger 'loading:show', "Looking for products, give me a second..."
  flashDone: ->
    Omgwant.Messages.trigger 'loading:hide'
  
  search: _.debounce (event) ->
    # if user cleared up the input - do not fetch anything
    # just clean up the models; be ready for new search
    @collection.reset()
    return if not /\w+/.test event.target.value
    @collection.fetch
      add: true
      beforeSend: @flashBefore
      data: 
        search: event.target.value
      dataType:'jsonp'
      success: @flashDone
  , 500
    
  render: ->
    @$el.html HandlebarsTemplates['livesearch'] {}
    @