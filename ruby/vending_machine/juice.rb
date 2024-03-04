# ffffff
class Juice
  JUICE_NAME = {
    'pepsi' => 'ペプシ',
    'monster' => 'モンスター',
    'irohas' => 'いろはす'
  }
  JUICE_NAME.freeze

  def initialize(name: '', price: 0)
    @name = name
    @price = price
  end

  attr_reader :name, :price
end
