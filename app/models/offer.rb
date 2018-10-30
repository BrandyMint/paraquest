# Предложение брокера на сайте
#

class Offer < ApplicationRecord
  include Archivable

  belongs_to :user

  scope :public_order, -> { order :created_at }

  monetize :in_amount_cents
  monetize :out_amount_cents

  def payment_method
    'QIWI'
  end

  def rate
    (in_amount.to_d / out_amount.to_d).to_money out_amount.currency
  end

  def limits
    '1000'
  end
end
