# Garber-Irish DOM-ready Execution
# http://viget.com/inspire/extending-paul-irishs-comprehensive-dom-ready-execution

window.GIDOM =
  exec: (appName = 'App') ->
    controller_path   = document.body.getAttribute('data-controller')
    action            = document.body.getAttribute('data-action')

    parts = controller_path.split('/')
    parts.push(action)
    parts = (_.str.classify(part) for part in parts)

    klassName = "#{appName}.Pages.#{parts.join('.')}"

    try
      klass = eval("new #{klassName}")
      klass.init() if klass.init?
