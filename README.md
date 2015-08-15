# Getting started

Add gem to Gemfile
```
group :development do
  gem 'gi-dom-rails', github: 'ibaciulis/gi-dom-rails'
end
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
