class Private::ApplicationController < ApplicationController
  layout 'private'

  before_action :require_login
end
