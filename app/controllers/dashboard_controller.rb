class DashboardController < ApplicationController
  def index
    render locals: { offers: Offer.alive.includes(:user).public_order }
  end
end
