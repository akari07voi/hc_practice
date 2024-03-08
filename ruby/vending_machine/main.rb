require_relative 'suica'
require_relative 'juice'
require_relative 'vending_machine'

# 購入用準備
# Suicaオブジェクト生成
suica = Suica.new

# 自販機での管理用ジュースオブジェクト生成（ペプシ）
pepsi = Juice.new(name: 'pepsi', price: 150)
monster = Juice.new(name: 'monster', price: 230)
irohas = Juice.new(name: 'irohas', price: 120)
juice_list = [pepsi, monster, irohas]

# 自販機オブジェクト生成
vending_machine = VendingMachine.new(juice_list)

# suicaへのチャージ処理
def for_charge_suica(suica)
  puts 'チャージしたい金額を入力してください。'
  add_money = gets.chomp
  # チャージチェック
  begin
    suica.charge(add_money.to_i)

    puts "Suicaに#{add_money}円チャージ後の残高#{suica.balance}円"
  rescue StandardError
    puts 'エラーです。100円未満はチャージできません'
  end
end

# 残高確認
def current_balance(suica)
  puts "Suica 残高：#{suica.balance}円"
end

# 在庫取得
def current_stock(vending_machine)
  puts '在庫確認を行いたいジュース番号を入力してください。ペプシ：0,モンスター：1,いろはす：2'
  select_juice_num = gets.chomp.to_i
  puts "現在の自動販売機の在庫は#{vending_machine.stock(select_juice_num)}本です。"
end

# ジュース購入処理
def juice_buy(vending_machine, suica)
  puts '購入したいジュースの番号を入力してください。ペプシ：0、モンスター：1、いろはす：2'
  juice_num = gets.chomp.to_i
  raise StandardError unless vending_machine.buy(juice_num, suica)

  puts "購入完了しました。suica残高：#{suica.balance}"
  puts "現在の自動販売機の売り上げ：#{vending_machine.proceeds}, 在庫：#{vending_machine.stock(juice_num)}"
end

def current_vending_machine_proceeds(vending_machine)
  puts "現在の自動販売機の売り上げは#{vending_machine.proceeds}円です。"
end

# 購入可能ドリンクリスト取得
def enable_buy_list(vending_machine)
  puts '現在購入可能なジュースは'
  vending_machine.enable_buy_juice_list.each do |juice_name|
    puts Juice::JUICE_NAME[juice_name]
  end
  puts 'です。'
end

# 在庫補充
def add_stock_for_vending_machine(vending_machine)
  puts '補充したい本数を入力してください'
  add_juice_count = gets.chomp.to_i
  vending_machine.stock = add_juice_count
  puts "#{add_juice_count}本の補充が完了しました。"
end

# 以下各種処理実行
def main(suica, juice_list, vending_machine)
  puts '実行したい処理の番号を入力してください。'
  puts '1:suicaチャージ、2: Suica残高確認、3:自動販売機在庫確認、4:ジュース購入、5:自動販売機売り上げ確認、6:ジュース購入可能リスト取得、7:自動販売機在庫補充'
  exec_num = gets.chomp.to_i

  begin
    case exec_num
    when 1
      for_charge_suica(suica)
    when 2
      current_balance(suica)
    when 3
      current_stock(vending_machine)
    when 4
      juice_buy(vending_machine, suica)
    when 5
      current_vending_machine_proceeds(vending_machine)
    when 6
      enable_buy_list(vending_machine)
    when 7
      add_stock_for_vending_machine(vending_machine)
    else
      puts '存在しない操作番号が入力されました。'
    end
  rescue StandardError
    puts 'エラーが発生しました'
  ensure
    puts '処理を続行しますか？はい：1、いいえ：0'
    operation = gets.chomp.to_i
    case operation
    when 1
      main(suica, juice_list, vending_machine)
    when 0
    else
      puts '想定外の番号が入力されました。終了します。'
    end
  end
end

main(suica, juice_list, vending_machine)
