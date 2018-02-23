class StoreController < ApplicationController

  def index # implicitly renders app/views/store/index.html.erb view (homepage)
    @categories = Category.all
    @items = Item.available_items.order(:title)
  end

end
