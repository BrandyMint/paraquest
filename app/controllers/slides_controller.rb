class SlidesController < ApplicationController
  def index
    render locals: { slides: paginate(Slide.ordered) }
  end

  def show
    render locals: { slide: Slide.find(params[:id]) }
  end
end
