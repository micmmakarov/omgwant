class Omgwant.Collections.Comments extends Backbone.Collection
  model: Omgwant.Models.Comment
  url: '/api/comments'

  parse: (response) ->
    response.comments