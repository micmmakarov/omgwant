class Omgwant.Routers.main extends Backbone.Router

  routes:
    '' : 'index'

  initialize: ->
    @images = new Omgwant.Collections.Images()
    @images.fetch()

  index: ->
    @view = new Omgwant.Views.Images({el:"#images",collection: @images})
    #$("#images").html(@view.render().el)

