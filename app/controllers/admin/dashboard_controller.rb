class Admin::DashboardController < ApplicationController
  def show
    @total_products = Product.count
    @total_catagories = Category.count 
  end
end
