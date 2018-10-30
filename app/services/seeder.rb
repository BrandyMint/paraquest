module Seeder
  def self.seed!
    user = User.create_with(password: 'password').find_or_create_by! email: 'test@paraquest.ru', nick: 'tester'

    10.times.each do |i|
      user.offers.create! in_amount: i*10000.to_money(:rub), out_amount: 1.to_money(:usd)
    end
  end
end
