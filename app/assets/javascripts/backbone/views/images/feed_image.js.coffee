class Omgwant.Views.FeedImage extends Backbone.View

  className: 'gallery-image'

  initialize: ->
    @like = new Omgwant.Models.Like {id:@model.get('id'), likes:@model.get('likes'), like_action:@model.get('like_action')}
    @likeView = new Omgwant.Views.Like {model:@like}
    @model.on 'change', @render, @

  render: ->
    @$el.html HandlebarsTemplates['feed_image'](@model.toJSON())
    (@$ '.like').html(@likeView.render().el);
    @