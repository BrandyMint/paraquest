class DashboardController < ApplicationController
  def index
    redirect_to slides_path
  end
end
