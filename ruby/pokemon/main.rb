require_relative 'pokemon'
require_relative 'pikachu'
require_relative 'zenigame'

def createPokemon100
  # エラー回避用仮メソッド、ポケモンのインスタンスを100作る
end

def main
  pokemons = createPokemon100

  poke = Pokemon.new('リザードン', 'ほのお', 'ひこう', 100)
  puts poke.name
  puts poke.type1
  poke.attack

  pika = Pikachu.new('ピカチュウ', 'でんき', '', 100)
  puts pika.name
  pika.attack

  zeni = Zenigame.new('ゼニガメ', 'みず', '', 100)
  zeni.attack

  pika.change_name('テキセツ')
  puts pika.name

  pika.change_name('うんこ')
  puts pika.name
end

main
