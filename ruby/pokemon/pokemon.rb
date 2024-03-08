# 抽象クラス/インターフェースとしての使い方を仮定してモジュールで定義
module PokemonActions
  def attack
    "#{@name}のこうげき！"
  end

  def change_name(new_name)
    return puts '不適切な名前です' if new_name === 'うんこ'

    @name = new_name
  end
end

class Pokemon
  include PokemonActions
  def initialize(name, type1, type2, hp)
    @name = name
    @type1 = type1
    @type2 = type2
    @hp = hp
    # @mp = 10
  end

  attr_reader :name, :type1, :type2, :hp, :mp
end
