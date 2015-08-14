movie = ->
  (new Search).searching()
  (new Show).popUpTrailer()

$ ->
  movie()
  $(@).on('page:load', movie)
