class SlidesController < ApplicationController
  def index
    render locals: { slides: paginate(Slide.ordered) }
  end
end
