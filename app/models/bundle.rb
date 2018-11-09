class Bundle < ApplicationRecord
  belongs_to :user

  has_many :slides, dependent: :destroy

  validates :title, presence: true, uniqueness: { scope: :user_id }
end
