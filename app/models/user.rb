class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :offers

  validates :email, email: true, presence: true, uniqueness: true
  validates :password, presence: true, on: :create

  def to_s
    nick
  end
end
