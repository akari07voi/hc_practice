# スコア判定
def golf_score(player_score, par)
  # 規定打数＝プレイヤ打数
  return 'パー' if player_score === par

  # それ以外
  if player_score > par
    # 規定打数より多い場合
    case player_score
    when par + 1
      'ボギー'
    when par + 2
      '2ボギー'
    else
      "#{player_score - par}ボギー"
    end
  else
    # 規定打数以下
    case player_score
    when 1
      if par === 5
        'コンドル'
      else
        'ホールインワン'
      end
    when par - 1
      'バーディ'
    when par - 2
      'イーグル'
    when par - 3
      'アルバトロス'
    end
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
