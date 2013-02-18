class Omgwant.Views.Following extends Backbone.View

  initialize: ->
    @collection = new Omgwant.Collections.Images
    @collection.url = '/api/feed'
    @collection.fetch()
    @publishedView = new Omgwant.Views.Images
      collection: @collection

    @render()

  render: ->
    user = window.current_user
    @$el.html HandlebarsTemplates["users/following"]({followers: user.followers, followed_users: user.followed_users})
    @