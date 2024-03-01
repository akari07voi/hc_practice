# マッピング用スコア
SCORE_MAPPING = {
  -4 => 'コンドル',
  -3 => 'アルバトロス',
  -2 => 'イーグル',
  -1 => 'バーディ',
  1 => 'ボギー'
}

# スコア判定
def golf_score(player_score, par)
  # 規定打数＝プレイヤ打数
  return 'パー' if player_score === par

  # それ以外
  result = player_score - par
  if player_score === 1 && par != 5
    'ホールインワン'
  elsif result >= 2
    "#{result}ボギー"
  else
    SCORE_MAPPING[result]
  end
end

# 規定打数とプレーヤー打数の受け取り
score_data = readlines
pars = score_data[0].chomp.split(',')
player_scores = score_data[1].chomp.split(',')

first = true
# 各ホールのスコア出力
player_scores.each.zip(pars) do |player_score, par|
  print ',' unless first
  print golf_score(player_score.to_i, par.to_i)
  first = false
end
