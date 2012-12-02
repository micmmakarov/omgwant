class Omgwant.Views.Image extends Backbone.View

  className: 'gallery-image'

  events:
    'click .view-user-profile': 'view_profile'

  initialize: ->
    @like = new Omgwant.Models.Like {id:@model.get('id'), likes:@model.get('likes')}
    console.log('На нах',@model.get('id'), @like)
    @likeView = new Omgwant.Views.Like {el:'.like',model:@like}
    @model.on 'change', @render, @

  view_profile: (event) ->
    event.preventDefault()
    Omgwant.router.navigate @model.profile_url(), {trigger:true}

  # destroySubview: ->
  #   @likeView.undbind()
  #   @likeView.remove()
    
  render: ->
    # @destroySubview()
    @$el.html HandlebarsTemplates['image'](@model.toJSON())
    @