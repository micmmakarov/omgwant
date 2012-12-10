class Omgwant.Views.Flash extends Backbone.View
  initialize: ->
    _.bindAll @
    Omgwant.Messages.on 'flash:show', @render, @
    Omgwant.Messages.on 'loading:show', @loader, @
    Omgwant.Messages.on 'loading:hide', @loader, @
  
  removeFlash: ->
    @unbind()
    @remove()
    
  loader: (message)->
    if typeof message is 'undefined' #kill the view if there's no message
      @removeFlash()
      return
    @render message, 'loading'
    
  render: (message, type)->
    @$el.html HandlebarsTemplates['utils/flash'] {message:message}
    ($ 'body > header').after @$el
    _.delay @removeFlash, 2000 if !type #remove the message if just a message
    @