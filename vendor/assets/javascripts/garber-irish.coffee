# Garber-Irish DOM-ready Execution
# http://viget.com/inspire/extending-paul-irishs-comprehensive-dom-ready-execution

@GIDOM =
  exec: (appName = 'App') ->
    controller  = document.body.getAttribute('data-controller')
    action      = document.body.getAttribute('data-action')

    if controller? and action?
      parts = controller.split('/')
      parts.push(action)
      parts = (s.classify(part) for part in parts)

      klassName = "#{appName}.Pages.#{parts.join('.')}"

      try
        klass = eval("new #{klassName}")
        klass.init() if klass.init?
