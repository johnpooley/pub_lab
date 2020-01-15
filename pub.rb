class Pub

  attr_reader :pub_name, :til, :drinks
  attr_writer :til, :drinks

  def initialize(pub_name, til, drinks)
    @pub_name = pub_name
    @til = til
    @drinks = drinks
  end

  def sell_drink(drink, customer)
    return "you are under age" unless customer.age >= 18
    return "you are cut off" unless customer.tolerance >= drink.kick
    return "you are a bum" unless customer.wallet >= drink.price
    # if customer.age >= 18
    if customer.wallet >= drink.price
      @til += drink.price
      customer.wallet -= drink.price
      customer.tolerance -= drink.kick
    else
      return "no money!"
    end
  end

end
