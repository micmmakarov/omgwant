class Omgwant.Views.ProfileImages extends Backbone.View
  tagName: 'ul'
  className: 'thumbs-list medium'
  initialize: ->
    @collection.on 'reset', @render, @
    @collection.fetch()
  addImage: (model)->
    image = new Omgwant.Views.ProfileImage({model:model})
    @$el.append image.render().el
  render: ->
    @collection.each @addImage, @
    @
