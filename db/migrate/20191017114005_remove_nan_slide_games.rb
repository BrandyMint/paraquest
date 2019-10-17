class RemoveNanSlideGames < ActiveRecord::Migration[5.2]
  def change
    nan = BigDecimal.new('NaN')
    SlideGame.where(x: nan).destroy_all
    SlideGame.where(y: nan).destroy_all
  end
end
