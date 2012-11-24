$ ->
  # initialize Bootstrap tooltips
  $("[rel=\"tooltip\"]").tooltip()

  # focus on search input field in modal
  $("#addProductModal").on "shown", ->
    input = $(this).find("#search-query")
    input.focus()

    myObject = ['Toronto','Montreal','New York','Buffalo']
                              
    $('#search-query').typeahead source: myObject

#  initProductSearch = (input) ->

    # $.getJSON "/products.json", (data) ->
    #   $.each data, (i, product) ->
    #     content = "<p>" + product.title + "</p>"
    #     content += "<p>" + product.price + "</p>"
    #     content += "<p>" + product.url + "</p>"
    #     content += "<br/>"
    #     $(content).appendTo ".search-results"
