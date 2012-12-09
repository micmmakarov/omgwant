class Omgwant.Views.LiveSearch extends Backbone.View
  
  events:
    'keypress :input': 'search'
    
  initialize: ->
    window.view = @
    @collection = new Backbone.Collection
      model: Backbone.Model
    @collection.on 'add', @addItem, @
    
    @render()

  addItem: (model)->
    item = new Omgwant.Views.LiveSearchItem
      model: model    
    @$el.append item.el
    console.log @collection.models.length

  search: _.debounce (event) ->
    @collection.reset()
    @collection.url = "#{@options.baseUrl}?search=#{event.target.value}"
    @collection.fetch({dataType:'jsonp'})
  , 500
    
  render: ->
    @$el.html HandlebarsTemplates['livesearch'] {}
    @collection.each(@addItem, @)