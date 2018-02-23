class LineItemsController < ApplicationController

  def create
    current_user.create_current_cart unless current_user.current_cart
    line_item = current_user.current_cart.add_item(params[:item_id])

    if line_item.save
      redirect_to cart_path(current_user.current_cart), notice: "#{line_item.item.title} has been added to your cart!"
    else
      redirect_to store_path, notice: "The requested item could not be added to your cart."
    end
  end
end

# When Add to Cart button is clicked, form data is submitted via
# POST request to "/line_items", mapped to line_items#create
# params has a top-level "item_id" key pointing to the id of whatever item was added
