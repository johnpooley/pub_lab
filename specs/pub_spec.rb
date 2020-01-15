require('minitest/autorun')
require('minitest/reporters')

MiniTest::Reporters.use!
MiniTest::Reporters::SpecReporter.new

require_relative('../pub')
require_relative('../drinks')
require_relative('../customers')


class TestPub < MiniTest::Test

  def setup
    @customer_1 = Customers.new("Piotr", 50, 21, 1)
    @customer_2 = Customers.new("John", 51, 18, 10)
    @customer_3 = Customers.new("Captain Brownpants", 20000, 15, 0)
    @drink_1 = Drinks.new("Becks", 4, 1)
    @drink_2 = Drinks.new("Champagne", 50, 2)
    @drink_3 = Drinks.new("Jack Daniels", 5, 3)
    @pub_1 = Pub.new("John's Pub", 1000, [@drink_1, @drink_2, @drink_3] )


  end

  def test_pub_name
    assert_equal("John's Pub", @pub_1.pub_name)
  end

  def test_sell_drink
    @pub_1.sell_drink(@drink_1, @customer_1)
    assert_equal(46, @customer_1.wallet)

    @pub_1.sell_drink(@drink_1, @customer_2)
    assert_equal(47, @customer_2.wallet)

    @pub_1.sell_drink(@drink_1, @customer_3)
    assert_equal(20000, @customer_3.wallet)
    assert_equal("you are under age", @pub_1.sell_drink(@drink_1, @customer_3))
  end

  def test_tolerance
    @pub_1.sell_drink(@drink_3, @customer_1)
    assert_equal("you are cut off",@pub_1.sell_drink(@drink_3, @customer_1) )

    @pub_1.sell_drink(@drink_3, @customer_2)
    assert_equal(7, @customer_2.tolerance )

  end


end
