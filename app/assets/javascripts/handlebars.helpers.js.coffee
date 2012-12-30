Handlebars.registerHelper "formatDate", (date) ->
  date = moment.utc(date)
  date.format "MMM Do, YYYY"

Handlebars.registerHelper 'if_current_user', (block) ->
  if typeof current_user isnt 'undefined'
    block.fn()
  else
    block.inverse()

Handlebars.registerHelper 'logged_in_state', (block) ->
  if typeof current_user isnt 'undefined'
    'logged-in'
  else
    'not-logged-in'

Handlebars.registerHelper "currentUserFullName", () ->
  current_user.full_name

Handlebars.registerHelper "currentUserAlias", () ->
  current_user.name

Handlebars.registerHelper 'each_upto', (ary, max, options) ->
  if not ary or ary.length is 0
    return options.inverse(this)

  result = [ ]
  i = 0
  while i < max and i < ary.length
    result.push options.fn(ary[i])
    ++i
  return result.join('')
