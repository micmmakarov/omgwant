class Omgwant.Collections.Products extends Backbone.Collection
  model: Omgwant.Models.Product
  url: 'http://omg-node-api.herokuapp.com/'

  parse: (response) ->
    response.products