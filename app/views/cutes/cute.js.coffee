image_id = <%= @image.id %>
content = "<%= escape_javascript(render :partial => "cutes/cute", :locals => {:image => @image}) %>"

$(".cute[data-id='#{image_id}']").replaceWith(content)
