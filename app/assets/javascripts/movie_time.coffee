movieTime = ->
  (new UI).enviroment()

$ ->
  movieTime()
  $(@).on('page:load', movieTime)
