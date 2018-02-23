class ItemsController < ApplicationController
  def show # implicitly renders app/views/items/show.html.erb (item show page)
    @item = Item.find(params[:id])
  end
end
