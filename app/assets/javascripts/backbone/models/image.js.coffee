class Omgwant.Models.Image extends Backbone.Model
  #paramRoot: 'image'
  # initialize: ->
  #  likes = new Omgwant.Models.Like {},{image_id:@id, }
  # like: ->
  #   $.ajax
  #     type: "POST"
  #     url: "/api/cute/#{@id}"
  #     success: (data) =>
  #       @set 'likes', data.likes
  #       @set 'like_action', data.likes
  #       return
  # 
  # like_action_label: ->
  #   if @get 'like_action' == true
  #     label = "Like"
  #   else
  #     label = "Unlike"
  #   console.log label
  #   label
  #   
  # get_like_action_label: =>
  #   j = @toJSON()
  #   j.like_action_label = @like_action_label()
  #   j

  profile_url: ->
    "#{@get('user_info').id}/likes" 