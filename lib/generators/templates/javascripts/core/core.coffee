@App =
  init: ->
    GIDOM.exec()

  State: {}

$(document).ready(App.init)
