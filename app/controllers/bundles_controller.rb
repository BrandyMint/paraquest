class BundlesController < ApplicationController
  def index
    redirect_to root_path
  end

  def show
    render locals: { bundle: Bundle.find(params[:id]) }
  end
end
