class Omgwant.Collections.Images extends Backbone.Collection
  model: Omgwant.Models.FeedImage
  url: '/api/images'
  

  get_dashboard_url: ->
    @url = '/api/myimages'