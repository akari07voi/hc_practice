require 'date'
require 'optparse'

def get_calendar(month)
  # 入力された月で日付を取得（なければ今月）
  today = Date.new(Date.today.year, month.to_i, 1)

  # カレンダーのタイトルを出力
  puts "#{"\s" * 6}#{today.month}月 #{today.year}"
  # 曜日部分を出力
  puts '月 火 水 木 金 土 日'

  # 月のはじめと終わりの曜日を取得
  start_day = Date.new(today.year, today.month, 1)
  end_day = Date.new(today.year, today.month, -1)

  # カレンダー作成用のstring用意
  date_str = ''

  space = ''
  # １ヶ月分のカレンダー作成
  1.upto(end_day.day) do |i|
    # カレンダーの日を特定
    current_day = Date.new(start_day.year, start_day.month, i)
    # 見栄え調整
    space = if current_day.day === 1
              case current_day.wday
              when 1
                ''
              when 0
                "#{"\s" * 18}"
              else
                "#{"\s" * ((current_day.wday - 1) * 2)}#{"\s" * (current_day.wday - 1)}"
              end
            else
              ''
            end
    date_str += "#{space}#{i.to_s.rjust(2)}"
    date_str += "\s"
    # 改行判定
    date_str += "\n" if current_day.wday.zero?
  end
  date_str
end

# オプション付与用インスタンス
opt = OptionParser.new

# 月の初期値は現在の月とする
month = Date.today.month.to_i

# オプション用コマンドを登録、オプション付与時の動作を指定
opt.on('-m [VAL]') { |input_month| month = input_month }

opt.parse!(ARGV)
begin
  print get_calendar(month)
rescue StandardError
  print "#{month} is neither a month number (1..12) nor a name"
end
