source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.0'
# Use sqlite3 as the database for Active Record
gem 'sqlite3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',        group: :development

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
# Using customized version to fix issue #103 in restforce
gem 'restforce', :git => 'git@github.com:malavbhavsar/restforce.git', :branch => 'patch-1'
# Use omniauth for handlling OAuth with Salesforce
gem 'omniauth'
# Add omniauth policy for saleforce
gem 'omniauth-salesforce'
# Print pretty
gem 'awesome_print'
# Development only gems
group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end
# Add faye for pub/sub, using customized version to aavoid problems from
# issue 263 and other related issue
gem 'faye', :git => 'git@github.com:faye/faye.git'
# private_pub to easily do pub-sub with browser, using customized version 
# to make sure that we get faye.js which is not packed when using faye gem
# from master
gem 'private_pub', :git => 'git@github.com:malavbhavsar/private_pub.git'
# Puma for our main server concurrently
gem 'puma'
# Thin for running faye server
gem 'thin'