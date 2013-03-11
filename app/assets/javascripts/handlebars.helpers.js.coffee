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

Handlebars.registerHelper "getHostDomain", (str) ->
  # parseUri 1.2.2
  # (c) Steven Levithan <stevenlevithan.com>
  # MIT License
  parseUri = (str) ->
    o = parseUri.options
    m = o.parser[(if o.strictMode then "strict" else "loose")].exec(str)
    uri = {}
    i = 14
    uri[o.key[i]] = m[i] or ""  while i--
    uri[o.q.name] = {}
    uri[o.key[12]].replace o.q.parser, ($0, $1, $2) ->
      uri[o.q.name][$1] = $2  if $1

    uri
  parseUri.options =
    strictMode: false
    key: ["source", "protocol", "authority", "userInfo", "user", "password", "host", "port", "relative", "path", "directory", "file", "query", "anchor"]
    q:
      name: "queryKey"
      parser: /(?:^|&)([^&=]*)=?([^&]*)/g

    parser:
      strict: /^(?:([^:\/?#]+):)?(?:\/\/((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?))?((((?:[^?#\/]*\/)*)([^?#]*))(?:\?([^#]*))?(?:#(.*))?)/
      loose: /^(?:(?![^:@]+:[^:@\/]*@)([^:\/?#.]+):)?(?:\/\/)?((?:(([^:@]*)(?::([^:@]*))?)?@)?([^:\/?#]*)(?::(\d*))?)(((\/(?:[^?#](?![^?#\/]*\.[^?#\/.]+(?:[?#]|$)))*\/?)?([^?#\/]*))(?:\?([^#]*))?(?:#(.*))?)/

  parseUri(str).host
