class Omgwant.Views.Profile extends Backbone.View
  initialize: ->
    @model = new Omgwant.Models.User {id:@options.user_id}
    @model.on 'change', @render, @
    @model.fetch()
    @imagesView = new Omgwant.Views.ProfileImages {collection: new Omgwant.Collections.ProfileImages {user_id:@options.user_id} }
  render: ->
    @$el.html HandlebarsTemplates['profile'] @model.toJSON()
    (@$ '#liked-images').html @imagesView.$el
    @


