module JustCreated
  extend ActiveSupport::Concern
  included do
    attr_reader :is_just_created
    after_create do
      @is_just_created = true
    end
  end
end
