class CategoriesController < ApplicationController
  def show # implicitly renders app/views/categories/show.html.erb (category show page)
    @category = Category.find(params[:id])
    @items = @category.items # @items stores 'array' of item instances belonging to @category instance
  end
end
