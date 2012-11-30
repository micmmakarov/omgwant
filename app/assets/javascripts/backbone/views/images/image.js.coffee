class Omgwant.Views.Image extends Backbone.View

  className: 'gallery-image'
  
  events:
    'click .like': 'like'
    'click .view-user-profile': 'view_profile'

  initialize: ->
    @model.on('change', @render, this)

  like: (e) ->
    e.preventDefault()
    @model.like()
  
  view_profile: (e) ->
    e.preventDefault()
    console.log @model.profile_url()
    Backbone.history.navigate(@model.profile_url(), true)

  render: ->
    @$el.html HandlebarsTemplates['image'](@model.get_like_action_label())
    this