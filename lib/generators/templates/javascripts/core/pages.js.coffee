class App.Pages
  construct: ->

  widget: (widgetName) ->
    new App.Widgets[widgetName]