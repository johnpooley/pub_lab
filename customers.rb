class Customers

attr_reader :cus_name, :wallet, :age, :tolerance
attr_writer :wallet, :tolerance

def initialize(name, wallet, age, tolerance)
  @cus_name = name
  @wallet = wallet
  @age = age
  @tolerance = tolerance
end

end
