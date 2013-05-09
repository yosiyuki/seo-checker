source 'http://rubygems.org'
ruby '2.0.0'

gem 'rails', '4.0.0.beta1'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

gem 'json'
gem 'jquery-rails'
gem 'nokogiri'
gem 'haml'
gem 'thin'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'web-app-theme'
  gem 'sass-rails',   '~> 4.0.0.beta1'
  gem 'coffee-rails', '~> 4.0.0.beta1'
  gem 'uglifier'
end

group :test, :development do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'factory_girl'
  gem 'i18n_generators'
end

group :production do
  gem 'rails_log_stdout',           github: 'heroku/rails_log_stdout'
  gem 'rails3_serve_static_assets', github: 'heroku/rails3_serve_static_assets'
  gem 'pg'
  gem 'dalli'
end

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'ruby-debug'

