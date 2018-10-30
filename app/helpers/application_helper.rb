module ApplicationHelper
  def app_title
    # 'Domestic bitcoin exchange markets'
    'domestic'
  end

  def ion_icon(icon, text: nil)
    buffer = content_tag :i, '', class: 'icon ion-' + icon.to_s
    buffer << content_tag(:span, text, class: 'icon-text') if text.present?

    buffer
  end
end
