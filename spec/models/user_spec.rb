require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
  before(:each) do
    @user = User.new(first_name: "Zu", last_name: "Ba", email:"z@gmail.com", password:"1234", password_confirmation:"1234")
  end  

  it 'should creat a user' do
    expect(@user).to be_valid
  end
  

  it 'should check if password confirmation works' do
    @user.password_confirmation = '12345'
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it 'should check if a user has invalid first name' do
    @user.first_name = nil
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to include("First name can't be blank")
  end

  it 'should check if a user has invalid last name' do
    @user.last_name = nil
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to include("Last name can't be blank")
  end

  it 'should check if a user has invalid email' do
    @user.email = ''
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to include("Email can't be blank")
  end

  it 'should check if a user has invalid password' do
    @user.password_digest = nil
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end

  it 'should check if a user has invalid password confirmation' do
    @user = User.new(first_name: "Zu", last_name: "Ba", email:"z@gmail.com", password:"1234", password_confirmation:"")
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end

  it 'should check if password length is less than 4' do
    @user = User.new(first_name: "Zu", last_name: "Ba", email:"z@gmail.com", password:"12", password_confirmation:"12")
    expect(@user).to_not be_valid
    expect(@user.errors.full_messages).to include("Password is too short (minimum is 4 characters)")
  end

  it 'should check that two users cannot have the same email address' do
    @user1 = User.create(first_name: "Tom", last_name: "Smith", email:"TSMITH@gmail.com", password:"1234", password_confirmation:"1234")
    @user2 = User.create(first_name: "Bob", last_name: "Smith", email:"tsmith@gmail.com", password:"12345", password_confirmation:"12345")
    expect(@user2.errors.full_messages).to include("Email has already been taken")
  end

end

describe '.authenticate_with_credentials' do
  before(:each) do
    @user = User.new(first_name: "Zu", last_name: "Ba", email:"z@gmail.com", password:"1234", password_confirmation:"1234")
  end  

  it 'should creat a user' do
    expect(@user).to be_valid
  end
  it 'The user email adress should be case insensetive' do
  @user.email = "Z@gmail.com"
  expect(@user).to be_valid
  end
  it 'should pass with space before user email adress' do
    @user.email = " Z@gmail.com"
    expect(@user).to be_valid
    end
end
  
end