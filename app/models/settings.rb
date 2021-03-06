require 'settingslogic'
if defined? Rails
  class Settings < Settingslogic
    source "#{Rails.root}/config/application.yml"
    namespace Rails.env
    suppress_errors Rails.env.production?
  end
else
  class Settings < Settingslogic
    source "./config/application.yml"
    namespace 'development'
  end
end
