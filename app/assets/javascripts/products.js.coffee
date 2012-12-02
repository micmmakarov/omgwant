# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

a = ['Toronto','Montreal','New York','Buffalo','Montreal','New York','Buffalo','Montreal','New York','Buffalo','Montreal','New York','Buffalo','Montreal','New York','Buffalo']
window.loadProducts = (products) ->
  options = {source: products, items: 5}
  $ ->
    $(".add-products").typeahead options



