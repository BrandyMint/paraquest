# frozen_string_literal: true

set :stage, :production
set :rails_env, :production
fetch(:default_env)[:rails_env] = :production

set :bundle_without, %w[test development].join(' ')
set :keep_releases, 2

server 'brandymint.ru', user: fetch(:user), roles: %w[web app db bugsnag].freeze
