class Omgwant.Views.LiveSearch extends Backbone.View
  
  events:
    'keypress :input': 'search'
    
  initialize: ->
    @collection = new Omgwant.Collections.Products()
    #@collection.on 'reset', @render, @
    @collection.on 'add', @addItem, @
    @render()

  addItem: (model)->
    console.log model.get('name')
    window.collection = @collection
    view = new Omgwant.Views.LiveSearchItem(model: model)
    @$el.find('.livesearch-items').append  view.el

  search: _.debounce (event) ->
    @collection.reset()
    @collection.fetch
      add: true
      data: $.param({ search: event.target.value})
      dataType:'jsonp'
  , 500
    
  render: ->
    @$el.html HandlebarsTemplates['livesearch'] {}
    @collection.each(@addItem, @)