Handlebars.registerHelper "formatDate", (date) ->
  date = moment.utc(date)
  date.format "MMM Do, YYYY"
