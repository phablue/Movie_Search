class System
  constructor: ->

  notice: (message) ->
    alert message

  errorMessage: ->
    "The search word must be more than 2 characters"

window.System = System
