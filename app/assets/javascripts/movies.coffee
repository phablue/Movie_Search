movie = ->
  (new Search).searching()
  (new Show).popUpTrailer()
  (new MyList).addIconDisplay()

$ ->
  movie()
  $(@).on('page:load', movie)
