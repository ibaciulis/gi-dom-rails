class App.Pages
  constructor: ->

  widget: (widgetName) ->
    new App.Widgets[widgetName]