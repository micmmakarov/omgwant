class Omgwant.Collections.Images extends Backbone.Collection

  model: Omgwant.Models.FeedImage

  url: '/api/images'


  get_dashboard_url: ->
    @url = '/api/myimages'

  parse: (response) ->
    window.r =  response


  page = 0
  scroll: (url) =>
    page += 12
    console.log url
    @fetch({add:true, url: url, data: $.param({ page: page}) })
