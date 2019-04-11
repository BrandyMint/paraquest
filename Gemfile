source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.2'

source 'https://rails-assets.org' do
  # На случай есил в rail-assets снова отвалится https используем опасный вариант
  # source 'http://insecure.rails-assets.org' do
  gem 'rails-assets-noty'
end

gem 'cocoon'
gem 'valid_email'# , require: 'valid_email/validate_email'
gem 'date_validator'
gem 'auto_strip_attributes'

gem 'mini_magick'
gem 'carrierwave'

gem 'nilify_blanks'
gem "hiredis", "~> 0.6.0"
gem 'dalli'
gem "redis", "~> 4.0", :require => ["redis", "redis/connection/hiredis"]
gem 'redis-namespace'
gem 'redis-rails'
# gem 'redlock'

gem 'best_in_place'
gem 'rack-cors'
gem 'rack-request-id'
gem 'rack-utf8_sanitizer'
gem 'rack-attack'

gem 'sidekiq-failures', github: 'mhfs/sidekiq-failures'
gem 'sidekiq-status'
gem 'sidekiq'
gem 'sidekiq-cron'

gem 'virtus'
gem 'slim'
gem 'slim-rails'
gem 'nprogress-rails'
gem 'jquery-rails'
gem 'letter_opener'
gem 'letter_opener_web'

gem 'workflow', github: 'geekq/workflow'
gem 'settingslogic'
gem 'ionicons-rails'
gem 'font-awesome-rails'

gem 'money'
gem 'money-rails', '~> 1.12'

gem 'oj' # optimized json
gem 'simple_captcha2', require: 'simple_captcha'

gem 'enumerize'
gem 'enum_help'
gem 'pg'

gem 'gon'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.1'
# Use mysql as the database for Active Record
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# gem 'sassc-rails'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'mini_racer', platforms: :ruby

gem 'non-stupid-digest-assets'

gem 'auto_logger'
gem 'dapi-archivable', '~> 0.1.2', require: 'archivable'

gem 'semver2'
gem 'active_link_to', github: 'BrandyMint/active_link_to'
gem 'bugsnag'
gem 'bootstrap', '~> 4.1.2'
gem 'breadcrumbs_on_rails'
gem 'phone', github: 'BrandyMint/phone', branch: 'feature/russia'

gem 'authority', github: 'BrandyMint/authority', branch: 'feature/included_abilities_counter'
gem 'sorcery', github: 'alfagen/sorcery'

gem 'friendly_id'
gem 'counter_culture'

gem 'country_select'
gem 'simple_form', git: 'git://github.com/plataformatec/simple_form.git'

gem 'kaminari'
gem 'kaminari-i18n'
gem 'bootstrap-kaminari-views'


# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'pry-byebug'

  gem 'factory_bot'
  gem 'factory_bot_rails', github: 'thoughtbot/factory_bot_rails'

  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'guard-bundler'
  gem 'guard-ctags-bundler'
  gem 'rspec-rails'

  gem 'bugsnag-capistrano', require: false
  gem 'capistrano', require: false
  gem 'capistrano-bundler', require: false
  gem 'capistrano-db-tasks', require: false
  gem 'capistrano-faster-assets', require: false
  gem 'capistrano-git-with-submodules', '~> 2.0'
  gem 'capistrano-maintenance', require: false
  gem 'capistrano-master-key', github: 'virgoproz/capistrano-master-key', require: false
  gem 'capistrano-rails', require: false
  gem 'capistrano-rails-console', require: false
  gem 'capistrano-rbenv', require: false
  gem 'capistrano-secrets-yml', require: false
  gem 'capistrano-semver-git-tags', require: false
  gem 'capistrano-shell', require: false
  gem 'capistrano-tasks', github: 'alfagen/capistrano-tasks', require: false
  gem 'capistrano-upload-config', require: false
  gem 'capistrano3-puma', github: 'seuros/capistrano-puma', require: false
  gem 'capistrano-sidekiq', require: false
end

group :development do
  gem 'scss-lint'
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
  # gem 'listen', '~> 3.0'
  gem 'guard'
  gem 'terminal-notifier-guard' #, '~> 1.6.1', require: darwin_only('terminal-notifier-guard')

end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
