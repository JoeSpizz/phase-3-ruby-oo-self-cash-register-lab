class CashRegister

    attr_accessor :items, :discount, :total, :last_transaction
  
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
    end
  
    def add_item(title, amount, quantity = 1)
      @last_transaction = amount * quantity
      @total += @last_transaction
      quantity.times do
        @items << title
      end
    end
  
    def apply_discount
      if @discount != 0
        discount_as_percent = (100.0 - @discount.to_f) / 100
        @total = (@total * discount_as_percent).to_i
        "After the discount, the total comes to $#{@total}."
      else
        "There is no discount to apply."
      end
    end
  
    def void_last_transaction
      @total -= @last_transaction
    end
  end