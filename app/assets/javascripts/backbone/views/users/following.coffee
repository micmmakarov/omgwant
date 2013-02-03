class Omgwant.Views.Following extends Backbone.View

  initialize: ->
    @render()

  render: ->
    user = window.current_user
    @$el.html HandlebarsTemplates["users/following"]({followers: user.followers, followed_users: user.followed_users})
    @