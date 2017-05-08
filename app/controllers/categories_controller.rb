class CategoriesController < ApplicationController
  def index
    categories = Category.order(:name)
    count = categories.length / 4
    counter = 0
    @cat_array = []
    4.times do
      arry = []
      count.times do
        arry << categories[counter]
        counter += 1
      end
      @cat_array << arry
    end
  end
end
