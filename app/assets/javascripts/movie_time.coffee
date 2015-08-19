movieTime = ->
  (new Movies).search()
  (new UI).active()

$ ->
  movieTime()
  $(@).on('page:load', movieTime)
