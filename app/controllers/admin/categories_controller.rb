class Admin::CategoriesController < ApplicationController
  http_basic_authenticate_with name: ENV['AUTHRIZE_USERNAME'].to_s, password: ENV['AUTHRIZE_PASSWORD'].to_s
  def index
    @categories = Category.order(id: :desc).all
  end
end
