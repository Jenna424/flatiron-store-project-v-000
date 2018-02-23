class Order < ActiveRecord::Base
  def status
    if current_user && current_user.current_cart
      current_cart.status
    end
  end
end
