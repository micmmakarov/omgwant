class Omgwant.Collections.Images extends Backbone.Collection

  model: Omgwant.Models.FeedImage

  url: '/api/images'


  get_dashboard_url: ->
    @url = '/api/myimages'



  page = 0
  scroll: =>
    page += 12
    console.log page
    @fetch({add:true, data: $.param({ page: page}) })
