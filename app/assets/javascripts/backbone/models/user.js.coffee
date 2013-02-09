class Omgwant.Models.User extends Backbone.Model
  initialize: ->
    @published_images = new Omgwant.Collections.Images()
    @published_images.url = "/api/users/#{@id}/published"
    @liked_images = new Omgwant.Collections.Images()
    @liked_images.url = "/api/users/#{@id}/likes"

  url:-> "/api/users/#{@id}"

  follow: ->
    current_user = @
    $.ajax
      url: "/api/follow/#{@id}"
      success: (result) ->
        current_user.set('is_following', result.is_following)
        current_user.set('followers_number', result.followers_number)
        current_user.set('following_number', result.following_number)



