require_relative  'suica'
require_relative  'juice'

class VendingMachine
  START_STOCK = 5
  def initialize(juice_list)
    # ジュース情報格納リスト
    @juice_list = []
    @juice_list = juice_list.map do |juice|
      [juice.name, { name: juice.name, price: juice.price, count: START_STOCK }]
    end
    @proceeds = 0
  end

  # 在庫確認
  def stock(juice)
    @juice_list[juice][1][:count]
  end

  # ジュース在庫追加
  # TODO:0以下はエラーを出す
  def stock=(add_juice)
    @juice_list = @juice_list.map do |juice|
      add_count = juice[1][:count] + add_juice
      [juice[0], { name: juice[1][:name], price: juice[1][:price], count: add_count }]
    end
  end

  # 在庫確認
  def enable_buy_juice_list
    enable_list = []
    @juice_list.each do |juice|
      enable_list << juice[0] if (juice[1][:count]).positive?
    end
    enable_list
  end

  attr_reader :juice_list

  # ジュース情報書き換え
  def update_juice_detail(new_juice, new_count)
    @juice_list[0] = { name: new_juice.name, price: new_juice.price, count: new_count }
  end

  # ジュース購入
  def buy(juice_num, suica)
    selected_juice = @juice_list[juice_num]
    select_juice_price = selected_juice[1][:price]
    if select_juice_price <= suica.balance && selected_juice[1][:count] > 0
      # 在庫減
      selected_juice[1][:count] -= 1
      # 売り上げ追加
      @proceeds = (@proceeds + select_juice_price.to_i)
      # 残高を減らす
      suica.discharge(select_juice_price.to_i)
      true
    else
      false
    end
  end

  # 売り上げ取得
  attr_reader :proceeds
end
