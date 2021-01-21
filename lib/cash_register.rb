require 'pry'

class CashRegister
    attr_accessor :total, :discount, :last_item_total
    attr_reader :items

    def initialize(discount = nil)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity=nil)
        if quantity==nil
        self.total=@total.to_f + price
        @items << title
        @last_item_total = price
        else
        self.total=(self.total.to_f + (price.to_f*quantity))
            i=0
            while i < quantity do
                 @items << title
                 i += 1
            end
            @last_item_total = price * quantity
        end
    end

    def apply_discount
        if @discount==nil
            return "There is no discount to apply."
        else
            self.total=@total.to_f - (@total.to_f * (@discount.to_f / 100))
            return "After the discount, the total comes to $#{@total.to_i}."
        end
    end
    
    def void_last_transaction
        @total = @total - @last_item_total
     end
end
