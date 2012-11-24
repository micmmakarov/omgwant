image = <%= @image.id %>
published = <%= @image.published  %>

if published
  $(".image[data-id='#{image}']").addClass("published")
  $(".publish[data-image='#{image}'] a").text("Unpublish photo from gallery")
else
  $(".image[data-id='#{image}']").removeClass("published")
  $(".publish[data-image='#{image}'] a").text("Publish photo to gallery")
