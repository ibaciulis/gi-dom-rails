# Garber-Irish DOM-ready Execution
# http://viget.com/inspire/extending-paul-irishs-comprehensive-dom-ready-execution

window.GIDOM =
  exec: (appName = 'App') ->
    controller_path   = document.body.getAttribute('data-controller')
    action            = document.body.getAttribute('data-action')

    parts = controller_path.split('/')
    parts.push(action)
    parts = (_.str.classify(part) for part in parts)

    klassName = parts.join('.')
    klass = eval("#{appName}.Pages.#{klassName}")

    if klass?
      new klass