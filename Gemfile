source 'https://rubygems.org'

gem 'rails', '3.2.2'

group :background_jobs do
  gem 'whenever', require: false
end

group :seo do
  gem 'sitemap_generator'
  gem 'meta-tags', require: 'meta_tags'
end

group :javascripts do
  gem "rails-backbone"
  gem 'jquery-rails'
  gem 'chosen-rails'
  gem "i18n-js"
  gem 'haml_coffee_assets'
end

group :views do
  gem "simple_form"
  gem "kaminari"
  gem "zurb-foundation"
  gem 'bourbon'
  gem 'draper'
  gem 'draper-cancan'
  gem "haml-rails"
  gem "rabl"
end

group :mongodb do
  gem "mongoid"
  gem 'mongoid_slug'
  gem "bson_ext"
end

group :authentication do
  gem "omniauth"
  gem 'omniauth-github'
  gem "cancan"
end

group :parts do
  gem "fublog_core", path: "/home/projects/fublog_core/"
  gem "fublog_code", path: "/home/projects/fublog_code/"
end

group :test, :development do
  gem 'rspec-rails'
  gem "factory_girl_rails"
  gem 'database_cleaner'
  gem "mongoid-rspec"
  gem "database_cleaner"
  gem "email_spec"
  gem 'shoulda-matchers'

  gem 'quiet_assets'
  gem 'ruby-akismet', require: 'akismet'
end

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'therubyracer'
  gem 'uglifier', '>= 1.0.3'
end


