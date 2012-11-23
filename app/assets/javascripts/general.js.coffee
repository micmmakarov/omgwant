$ ->
  # initialize Bootstrap tooltips
  $("[rel=\"tooltip\"]").tooltip()

  $("#addProductModal").on "shown", ->
    $(this).find(".search-query").focus()

