class Private::SlidesController < Private::ApplicationController
  def index
    render locals: { slides: paginate(Slide.ordered) }
  end

  def edit
    render :edit, locals: { slide: slide }
  end

  def update
    slide.update! permitted_params
    redirect_to private_bundle_path(bundle), notice: 'Загружен слайд'
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
    render :edit, locals: { slide: e.record }
  end

  def new
    render locals: { slide: bundle.slides.new }
  end

  def create
    bundle.slides.create! permitted_params
    redirect_to private_bundle_path(bundle), notice: 'Загружен слайд'
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
    render :new, locals: { slide: e.record }
  end

  private

  def permitted_params
    params.require(:slide).permit!
  end

  def bundle
    @bundle ||= Bundle.find permitted_params.fetch(:bundle_id)
  end

  def slide
    @slide ||= Slide.find params[:id]
  end
end
