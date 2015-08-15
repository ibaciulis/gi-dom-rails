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

# Usage
For example, you want to generate page specific JS for Account::Orders#index:
```
rails generate dom:page account/orders/index
```
It will generate these JS files:
```
app/assets/javascripts/pages/account.js.coffee
app/assets/javascripts/pages/account/orders.js.coffee
app/assets/javascripts/pages/account/orders/index.js.coffee
```
