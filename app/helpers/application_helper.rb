module ApplicationHelper
  def data_game_coordinate(game)
    raise "Invalid coordinates for #{game.id}" unless game.valid_coordinates?
    { x: game.coordinate.x, y: game.coordinate.y }
  end

  def app_title
    # 'Paraquest bitcoin exchange markets'
    'Параквест'
  end

  def human_time(time)
    content_tag :span, class: 'text-small text-muted m-l-md' do
      I18n.l time, format: :human
    end
  end

  def ion_icon(icon, text: nil)
    buffer = content_tag :i, '', class: 'icon ion-' + icon.to_s
    buffer << content_tag(:span, text, class: 'icon-text') if text.present?

    buffer
  end
end
