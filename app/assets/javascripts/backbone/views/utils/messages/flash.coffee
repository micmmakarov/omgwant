class Omgwant.Views.Flash extends Backbone.View
  initialize: ->
    _.bindAll @
    Omgwant.Messages.on 'flash:show', @render, @
  removeFlash: ->
    @unbind()
    @remove()
  render: (message)->
    # TODO: add logic for ajax
    # Messages will be removed only if loader is done!
    @$el.html HandlebarsTemplates['utils/flash'] {message:message}
    ($ 'body > header').after @$el
    _.delay @removeFlash, 2000 #remove the message