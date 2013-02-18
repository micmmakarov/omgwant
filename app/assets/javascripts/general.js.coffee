$ ->
  # initialize Bootstrap tooltips
  $('[rel="tooltip"]').tooltip()

  # focus on search input field in modal
  $("#addProductModal").on "shown", ->
    input = $(this).find("#search-query")
    input.focus()

    myObject = ['Toronto','Montreal','New York','Buffalo']
                              
    $('#search-query').typeahead source: myObject

  # Mousetrap stuff
  Mousetrap.bind 'r e d', ->
    $('body').css
      'background': 'red'
    console.log 'go to inbox'
  