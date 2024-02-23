class RandomGroup
  # 振り分け用のメンバー配列を用意
  members = [*'A'..'F']

  # グループ分けの数を決定する
  group_a = Array.new(rand(2..4))

  # グループAに各メンバーの振り分けを実施
  group_a[group_a.index(nil)] = members.delete(members.sample) while group_a.include?(nil)

  # グループBに残りのメンバーをセット
  group_b = members

  # 結果出力
  print "#{group_a.sort}\n#{group_b.sort}"
end
