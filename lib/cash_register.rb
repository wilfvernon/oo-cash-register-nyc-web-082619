require "pry"
class CashRegister
 attr_accessor :discount, :total, :items
 
  def initialize(discount_number=0)
    @total = 0
    @items = []
    @last_item_price = 0
    @last_item = ""
    self.discount = discount_number
  end
  
  def add_item(title, price, quantity=1)
    @total += (price * quantity)
    quantity.times{@items.push(title)}
    @last_item_price = price
    @last_item = title
  end
  
  def apply_discount
    if self.discount > 0
      @total -= @total * (self.discount / 100.00)
      "After the discount, the total comes to $#{@total.to_i}."
    else 
      "There is no discount to apply."
    end
  end
  
  def void_last_transaction
    #binding.pry
    @items.reject!{|obj| obj == @last_item}
    @total -= @last_item_price
     #binding.pry
    unless @items[0]
      @total = 0.0
      #binding.pry
    end
  end
end
