class CartsController < ApplicationController
  def show # implicitly renders app/views/carts/show.html.erb (cart show page)
    #@current_cart = current_user.current_cart
    @cart = Cart.find_by(id: params[:id])
  end
# when user clicks Checkout (form disguised as button), form data is sent via POST to "/carts/id/checkout",
# mapped to carts#checkout

  def checkout
    cart = Cart.find(params[:id])

    cart.line_items.each do |line_item|
      line_item.item.update(inventory: line_item.item.inventory - line_item.quantity)
    end

    cart.update(status: "submitted")

    redirect_to cart_path(cart)

    current_user.update(current_cart: nil)
  end
end
