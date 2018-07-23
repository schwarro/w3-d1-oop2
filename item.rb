class Item

  @@tax = 0.13

  def initialize (name, price, tax)
    @name = name
    @price = price
    @tax = tax
  end

  def name
    @name
  end

  def price
    @price
  end

  def tax
    return @@tax
  end


end
