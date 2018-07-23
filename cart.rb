require "./item.rb"

class Cart
  def initialize
    @cart = []
  end

  def add(item)
    @cart << item
  end

  def remove(item)
    @cart.delete(item)
  end

  def items
    return @cart
  end

  def total
    total = 0
    @cart.each do |item|
      total += (item.price)*(1 + item.tax)
    end
  end



end

cereal = Item.new('cereal', 3.99, 0.13)
apples = Item.new('apples', 0.99, 0.13)
cart1 = Cart.new
cart1.add(cereal)
cart1.add(apples)
p cart1
total2 = cart1.total
p total2
