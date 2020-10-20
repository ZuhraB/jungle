require 'rails_helper'

RSpec.describe Product, type: :model do
  before(:each) do
    @category = Category.new(name: 'Appreal')
    @product = Product.new(name: "Shoe", price_cents: 1000, quantity: 2, category: @category)
  end    
    
  it 'should check if product is created' do
    expect(@product).to be_valid
  end

  it 'should check if a product has invalid name' do
    @product.name = nil
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to include("Name can't be blank")
  end
  
  it 'should check if a product has invalid price' do
    @product.price_cents = nil
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to include("Price can't be blank")
  end

  it 'should check if a product has invalid  quantity' do
    @product.quantity = nil
    expect(@product).to_not be_valid
    expect(@product.errors.full_messages).to include("Quantity can't be blank")
  end

  it 'should check if a product has invalid  category' do
    @product.category = nil
    expect(@product.valid?).to be false
    expect(@product.errors.full_messages).to include("Category can't be blank")
  end
    
end