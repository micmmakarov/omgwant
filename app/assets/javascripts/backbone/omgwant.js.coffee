#= require_self
## require_tree ./templates
#= require_tree ./models
#= require_tree ./collections
#= require_tree ./views
#= require_tree ./routers

current_user = window.current_user

window.Omgwant =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  init: ->
    @router = new Omgwant.Routers.main()
    Backbone.history.start({pushState: true})

$ ->
  Omgwant.init()

