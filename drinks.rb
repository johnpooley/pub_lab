class Drinks

attr_reader :name, :price, :kick

  def initialize(name, price, kick)
    @name = name
    @price = price
    @kick = kick
  end
end
