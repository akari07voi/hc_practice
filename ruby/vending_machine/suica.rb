class Suica
  DEPOSIT = 500
  def initialize
    @balance = DEPOSIT
  end

  # 残高取得
  attr_reader :balance

  # チャージ
  def charge(balance)
    raise StandardError if balance < 100

    self.balance = balance
  end

  # 残高減
  def discharge(balance)
    self.balance = (-balance)
  end

  private

  def balance=(add_money)
    @balance += add_money
  end
end
