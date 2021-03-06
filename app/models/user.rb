class User < ApplicationRecord
  extend Enumerize

  authenticates_with_sorcery!
  mount_uploader :image, ProfileImageUploader

  has_many :bundles, -> { ordered }
  has_many :bundle_games, -> { ordered }
  has_many :slide_games

  scope :ordered, -> { order :id }

  validates :email, email: true, presence: true, uniqueness: true
  validates :password, presence: true, confirmation: true, if: :validate_password?

  validates :nick,
    length: { minimum: 3 },
    presence: true,
    uniqueness: true,
    format: {
      with: /\A[a-z][a-z0-9_]+\z/i,
      message: 'Для псевдонима используется только латиниские символы, цифры и подчеркивание. Начинаться должен с буквы.'
    }

  enumerize :role, in: [:user, :admin], predicates: true

  # Первого пользователя делаем админом
  before_create do
    self.role = :admin if self.class.all.empty?
  end

  def played_slide? slide
    slide_games.where(slide: slide).exists?
  end

  def to_s
    nick
  end

  private

  def validate_password?
    new_record? || crypted_password_changed?
  end
end
