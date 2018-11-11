class Private::BundlesController < Private::ApplicationController
  def index
    render locals: { bundles: paginate(Bundle.ordered) }
  end

  def edit
    render locals: { bundle: bundle }
  end

  def update
    bundle.update! permitted_params
    redirect_to private_bundles_path, notice: 'Создан квест'
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
    render :edit, locals: { bundle: e.record }
  end

  def show
    render locals: { bundle: bundle }
  end

  def new
    render locals: { bundle: Bundle.new }
  end

  def create
    current_user.bundles.create! permitted_params
    redirect_to private_bundles_path, notice: 'Создан квест'
  rescue ActiveRecord::RecordInvalid => e
    flash.now.alert = e.message
    render :new, locals: { bundle: e.record }
  end

  private

  def permitted_params
    params.require(:bundle).permit!
  end

  def bundle
    @bundle ||= Bundle.find params[:id]
  end
end
