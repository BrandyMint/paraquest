class Private::ApplicationController < ApplicationController
  before_action :require_login
end
