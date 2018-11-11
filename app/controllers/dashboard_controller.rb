class DashboardController < ApplicationController
  def index
    render locals: { bundles: paginate(Bundle.published.ordered) }
  end
end
