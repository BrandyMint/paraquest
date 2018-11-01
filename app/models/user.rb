class User < ApplicationRecord
  extend Enumerize

  authenticates_with_sorcery!

  has_many :games

  scope :ordered, -> { order :id }

  validates :email, email: true, presence: true, uniqueness: true
  validates :password, presence: true, on: :create

  validates :nick, presence: true, uniqueness: true

  enumerize :role, in: [:user, :admin], predicates: true

  # Первого пользователя делаем админом
  before_create do
    self.role = :admin if self.class.all.empty?
  end

  def played_slide? slide
    games.where(slide: slide).exists?
  end

  def to_s
    nick
  end
end
