class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  #def total
    #self.items.sum(:price)
  #end
    # self.items returns 'array' of item instances found in the cart instance (self)
    # each item has a price attribute value
    # calling #sum(:price) on the 'array' of items found in the cart
    # returns the sum of values in the price column for these specific items

  # def total
  #   total = 0
  #   self.line_items.each do |line_item|
  #     total += line_item.item.price * line_item.quantity
  #   end
  #   return total
  # end

   def total
    self.line_items.inject(0) {|result, line_item| result + line_item.total}
   end

    def add_item(the_item_id)
      if self.item_ids.include?(the_item_id.to_i) # if we're adding an item to the cart that already exists in the cart,
        existing_line_item = LineItem.find_by(item_id: the_item_id)
        existing_line_item.quantity += 1
        existing_line_item
      else
        self.line_items.build(item_id: the_item_id)
      end
    end
    # same as saying
    # def add_item(the_item_id)
    #   line_item = self.line_items.find_by(item_id: the_item_id)
    #     if line_item # an existing line_item (same item is being added to cart)
    #       line_item.quantity += 1
    #     else # new item being added to cart (nonexistent line_item)
    #       line_item = self.line_items.build(item_id: the_item_id) # line_item is built off cart instance (self), so it will have cart_id
    #     end
    #   line_item
    # end
end
