class System
  constructor: ->

  deleteWhiteSpace: (elements) ->
    elements.replace(/\s+/g, '')

  notice: (message) ->
    alert message

  searchWordErrorMessage: ->
    "The search word must be more than 2 characters"

window.System = System
