movieTime = ->
  (new Movie).search()
  (new UI).active()

$ ->
  movieTime()
  $(@).on('page:load', movieTime)
