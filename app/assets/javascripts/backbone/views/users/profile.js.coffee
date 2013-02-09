class Omgwant.Views.Profile extends Backbone.View
  initialize: ->
    @model = new Omgwant.Models.User {id:@options.user_id}
    @model.on 'change', @renderProfileHead, @
    @model.on 'change', @renderUserStats, @
    @model.on 'change', @render, @
    @model.fetch()
    @model.published_images.fetch()
    @model.liked_images.fetch()
    @imagesView = new Omgwant.Views.LikedImages
      collection: @model.liked_images

    @publishedView = new Omgwant.Views.Images
      collection: @model.published_images

  renderProfileHead: ->
    @model.off 'change', @renderProfileHead, @
    @$el.html HandlebarsTemplates['users/profile'] @model.toJSON()

  renderUserStats: ->
    @$el.find('.user-stats').html HandlebarsTemplates['users/profile_stats'] @model.toJSON()    

  events:
    'click .follow': 'follow'
    'mouseenter .follow': 'updateFollowLabel'

  render: ->
    @$el.find('.follow-container').html HandlebarsTemplates['users/profile_follow'] @model.toJSON()
    (@$ '#liked-images').html @imagesView.$el
    @

  follow: ->
    @model.follow()

  updateFollowLabel: ->
    if @model.get 'is_following'
      followLabel = @$el.find('.follow')
      followLabel.text('Unfollow').on 'mouseleave', =>
        followLabel.text('Following')
    else
      @$el.find('.follow').text('Follow')

