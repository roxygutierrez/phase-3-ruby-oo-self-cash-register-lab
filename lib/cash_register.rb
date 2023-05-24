class CashRegister
    attr_reader :discount, :items
    attr_accessor :total, :last_transaction


    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        self.total += price * quantity
        for _ in 0...quantity 
            self.items << title 
        end
        self.last_transaction = price * quantity
    end

    def apply_discount
        percent = (100.0 - self.discount) / 100.0 
        if self.discount != 0
            self.total *= percent
            return "After the discount, the total comes to $#{self.total.to_i}."
        else 
            return "There is no discount to apply."
        end
    end
    
    def void_last_transaction
        self.items.pop()
        if self.items.length == 0
            self.total = 0.0
        else
            self.total -= self.last_transaction
        end
    end

end



