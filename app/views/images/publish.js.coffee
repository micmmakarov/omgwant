image = <%= @image.id %>
published = <%= @image.published  %>

if published
  $(".image[data-id='#{image}']").addClass("published")
  $(".publish[data-image='#{image}'] a").text("unpublish the link")
else
  $(".image[data-id='#{image}']").removeClass("published")
  $(".publish[data-image='#{image}'] a").text("publish the link")
