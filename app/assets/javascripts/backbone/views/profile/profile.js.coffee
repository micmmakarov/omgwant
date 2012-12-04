class Omgwant.Views.Profile extends Backbone.View
  initialize: ->
    @model = new Omgwant.Models.User {id:@options.user_id}
    @model.on 'change', @render, @
    @model.fetch()
    @model.published_images.fetch()
    @model.liked_images.fetch()

    @imagesView = new Omgwant.Views.LikedImages {
    collection: @model.liked_images }

    @publishedView = new Omgwant.Views.Gallery {
      collection: @model.published_images }


  render: ->
    @$el.html HandlebarsTemplates['profile'] @model.toJSON()
    (@$ '#liked-images').html @imagesView.$el
    @


