# Getting started

Add gem to Gemfile
```
gem 'gi-dom-rails', github: 'ibaciulis/gi-dom-rails'
```

After you install, you need to run the generator:
```
rails generate dom:install
```

Require `gi-dom-rails` and generated JS files:
```
//= require gi-dom-rails

//= require core/core
//= require core/widgets
//= require core/pages
//= require pages
```

Add `controller` and `action` values to body attribute:
```
<body data-controller="#{controller.controller_path}" data-action="#{controller.action_name}">
```
Or
```
= content_tag :body, data: { controller: controller.controller_path, action: controller.action_name }
```

# Usage
For example, you want to generate page specific JS for Account::Orders#index:
```
rails generate dom:page account/orders/index
```
It will generate these JS files:
```
app/assets/javascripts/pages/account.coffee
app/assets/javascripts/pages/account/orders.coffee
app/assets/javascripts/pages/account/orders/index.coffee
```
