class Admin::SlidesController < Admin::ApplicationController
  def index
    render locals: { slides: paginate(Slide.ordered) }
  end

  def new
    render locals: { slide: Slide.new }
  end

  def create
    Slide.create! permitted_params
    redirect_to admin_slides_path, notice: 'Загружен слайд'
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
    render :new, locals: { slide: e.record }
  end

  private

  def permitted_params
    params.require(:slide).permit!
  end
end
