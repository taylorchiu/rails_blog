require 'spec_helper'

describe User do
  describe 'name' do
  	it 'should not be empty' do
  		user = FactoryGirl.build(:user, name: nil)
  		user.should_not be_valid
  	end

  	it 'should not have more than 50 characters' do
  		user = FactoryGirl.build(:user, name: "sYCKhttB6TQND5fbkcQJdbD3aHZDu9UynSLQZDr4H8v3qq7XAZsN")
  		user.should_not be_valid
  	end
  end

  describe 'email' do
  	it 'should exist' do
  		user = FactoryGirl.build(:user, email: nil)
  		user.should_not be_valid
  	end

  	it 'should follow proper email format' do
  		user = FactoryGirl.build(:user, email: "123.com")
  		user.should_not be_valid
  	end

  	it 'should be unique' do
  		user1 = FactoryGirl.create(:user)
  		user2 = FactoryGirl.build(:user, email: user1.email)
  		user2.should_not be_valid
  	end
  end

  describe 'password' do
  	it 'should exist' do
  		user = FactoryGirl.build(:user, password: nil)
  		user.should_not be_valid
  	end

  	it 'should have more than 6 characters' do
  		user = FactoryGirl.build(:user, password: "1234")
  		user.should_not be_valid
  	end
  end

  describe 'password_confirmation' do
  	it 'should exist' do
  		user = FactoryGirl.build(:user, password_confirmation: nil)
  		user.should_not be_valid
  	end
  end

end
