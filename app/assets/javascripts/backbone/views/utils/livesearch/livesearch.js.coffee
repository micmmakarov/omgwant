class Omgwant.Views.LiveSearch extends Backbone.View
  
  events:
    'keyup :input': 'search'
    
  initialize: ->
    @collection = new Omgwant.Collections.Products()
    @collection.on 'add', @addItem, @
    @render()

  addItem: (model)->
    window.collection = @collection
    view = new Omgwant.Views.LiveSearchItem(model: model)
    @$el.find('.livesearch-items').append view.el

  search: _.debounce (event) ->
    @collection.reset()
    $(event.target).parent().find('ul').empty()
    #temporary empty solution
    @collection.fetch
      add: true
      data: $.param({search: event.target.value})
      dataType:'jsonp'
  , 700
    
  render: ->
    @$el.html HandlebarsTemplates['livesearch'] {}
    @collection.each(@addItem, @)