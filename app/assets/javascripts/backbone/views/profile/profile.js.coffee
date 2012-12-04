class Omgwant.Views.Profile extends Backbone.View
  initialize: ->
    @model = new Omgwant.Models.User {id:@options.user_id}
    @model.on 'change', @render, @
    @model.fetch()
    @postedView = new Omgwant.Views.Gallery {
      collection: @model.posted_images }

    @imagesView = new Omgwant.Views.LikedImages {
      collection: new Omgwant.Collections.LikedImages {user_id:@options.user_id} }

  render: ->
    @$el.html HandlebarsTemplates['profile'] @model.toJSON()
    (@$ '#liked-images').html @imagesView.$el
    @


