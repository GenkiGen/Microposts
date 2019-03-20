require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    before do
      @user = User.new(username: "John Landon", email: "no@email.com.vn",
                       password: "Rm!t201278", password_confirmation: "Rm!t201278")
    end

    it 'is valid with username, email, password, password confirmation' do
      expect(@user).to be_valid
    end

    it 'is invalid without username' do
      @user.username = nil
      @user.valid?
      expect(@user.errors[:username]).to include("can't be blank")
    end

    it 'is invalid without email' do
      @user.email = nil
      @user.valid?
      expect(@user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without password' do
      @user.password = nil
      @user.valid?
      expect(@user.errors[:password]).to include("can't be blank")
    end

    it 'is invalid if password and confirmation does not match' do
      @user.password_confirmation = "Rm!t2012781357"
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it 'is invalid if email is duplicated' do
      @user.save
      @another_user = User.new(username: "John Cena", email: @user.email,
                               password: "Rm!t201278", password_confirmation: "Rm!t201278")
      @another_user.valid?
      expect(@another_user.errors[:email]).to include("has already been taken")
    end
  end
end
