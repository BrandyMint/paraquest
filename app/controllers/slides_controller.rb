class SlidesController < ApplicationController
  def index
    redirect_to bundles_path
  end

  def show
    render locals: { slide: Slide.find(params[:id]) }
  end
end
