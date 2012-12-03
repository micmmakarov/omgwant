class Omgwant.Collections.ProfileImages extends Backbone.Collection
  model: Backbone.Model
  initialize: (options)->
    @user_id = options.user_id
  url: ->
    "/api/users/#{@user_id}/likes"