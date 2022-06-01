class CashRegister
    attr_accessor :discount
    attr_accessor :total
    attr_reader :items
    attr_accessor :last 
    def initialize(employee_discount=nil)
        @items = []
        @total = 0
        @discount = employee_discount
    end

    def add_item(title, price, quantity=1)
        self.total += price * quantity
        quantity.times{ items.push(title) }
        @last = {title: title, price: price, quantity: quantity}
    end 

    def apply_discount
        return 'There is no discount to apply.' if !discount
        self.total -= discount*total/100
        "After the discount, the total comes to $#{total}."
    end

    def void_last_transaction
        self.total -= last[:price]*last[:quantity]
    end

end 
