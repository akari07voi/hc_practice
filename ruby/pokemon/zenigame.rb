require_relative 'pokemon'

class Zenigame < Pokemon
  def attack
    puts super
    puts "#{@name}のみずでっぽう！"
  end
end
