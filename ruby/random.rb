class RandomGroup
  # 振り分け用のメンバー配列を用意
  members = [*'A'..'F'].shuffle

  # グループ分けの数を決定する
  group_a = Array.new(rand((2..4)))

  # グループAに各メンバーの振り分けを実施
  group_a.length.times do |i|
    group_a[i] = members[i] if group_a.length > i
  end

  # グループBに残りのメンバーをセット
  group_b = members - group_a

  # 結果出力
  print "#{group_a.sort}\n#{group_b.sort}"
end
