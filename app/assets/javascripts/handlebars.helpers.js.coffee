Handlebars.registerHelper "formatDate", (date) ->
  date = moment.utc(date)
  date.format "MMM Do, YYYY"

Handlebars.registerHelper 'if_current_user', (block) ->
  if typeof current_user isnt 'undefined'
    block.fn()
  else
    block.inverse()

Handlebars.registerHelper "currentUserFullName", () ->
  current_user.full_name

Handlebars.registerHelper "currentUserAlias", () ->
  current_user.name
