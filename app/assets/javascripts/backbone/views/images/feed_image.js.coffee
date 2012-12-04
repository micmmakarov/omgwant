class Omgwant.Views.FeedImage extends Backbone.View

  className: 'gallery-image'

  events:
    'click .view-user-profile': 'view_profile'
    
  initialize: ->
    @like = new Omgwant.Models.Like {id:@model.get('id'), likes:@model.get('likes'), like_action:@model.get('like_action')}
    @likeView = new Omgwant.Views.Like {model:@like}
    @model.on 'change', @render, @
    
  view_profile: (event) ->
    event.preventDefault()
    Omgwant.router.navigate "users/#{@model.get("user_info").id}", {trigger:true}
    
  render: ->
    @$el.html HandlebarsTemplates['feed_image'](@model.toJSON())
    (@$ '.like').html(@likeView.render().el);
    @