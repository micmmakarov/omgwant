image_id = <%= @image.id %>
published = <%= @image.published %>
content = "<%= escape_javascript(render :partial => "images/publish", :locals => {:image => @image}) %>"

$(".publish[data-id='#{image_id}']").replaceWith(content)

if published
  $(".image[data-id='#{image_id}']").addClass("published")
else
  $(".image[data-id='#{image_id}']").removeClass("published")
