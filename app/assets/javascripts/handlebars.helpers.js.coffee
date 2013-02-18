Handlebars.registerHelper "formatDate", (date) ->
  date = moment.utc(date)
  date.format "MMM Do, YYYY"

Handlebars.registerHelper "timeAgo", (date) ->
  date = moment.utc(date)
  date.fromNow()

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

Handlebars.registerHelper 'showed_if_logged_in', (block) ->
  if typeof current_user isnt 'undefined'
    ''
  else
    'hidden'


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

# Truncates string
Handlebars.registerHelper "truncate", (str, len) ->
  if str and str.length > len
    new_str = str.substr(0, len + 1)
    while new_str.length
      ch = new_str.substr(-1)
      new_str = new_str.substr(0, -1)
      break  if ch is " "
    new_str = str.substr(0, len)  if new_str is ""
    return new Handlebars.SafeString(new_str + "...")
  str

