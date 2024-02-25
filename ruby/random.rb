class RandomGroup
  # 振り分け用のメンバー配列を用意
  members = [*'A'..'F']

  # グループAに各メンバーの振り分けを実施
  group_a = members.sample(rand(2..4))

  # グループBに残りのメンバーをセット
  group_b = members - group_a

  # 結果出力
  print "#{group_a.sort}\n#{group_b.sort}"
end
