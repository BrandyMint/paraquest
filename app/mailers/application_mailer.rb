# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  layout 'mailer'

  default from: 'Параквест <support@paraquest.ru>'
  self.default_url_options = Settings.default_url_options.symbolize_keys
end
