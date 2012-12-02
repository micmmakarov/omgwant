class Omgwant.Views.Image extends Backbone.View

  className: 'gallery-image'
  
  events:
    'click .view-user-profile': 'view_profile'

  initialize: ->
    window.view = @
    @model.on 'change', @render, @
  
  view_profile: (event) ->
    event.preventDefault()
    Omgwant.router.navigate @model.profile_url(), {trigger:true}

  render: ->
    @$el.html HandlebarsTemplates['image'](@model.toJSON())
    @