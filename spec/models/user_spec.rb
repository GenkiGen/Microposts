require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validation' do
    it 'is valid with username, email, password, password confirmation' do
      expect(FactoryBot.build(:user)).to be_valid
    end

    it 'is invalid without username' do
      user = FactoryBot.build(:user, username: nil)
      user.valid?
      expect(user.errors[:username]).to include("can't be blank")
    end

    it 'is invalid without email' do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it 'is invalid without password' do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it 'is invalid if password and confirmation does not match' do
      user = FactoryBot.build(:user, password: "helloworld", password_confirmation: "helloworldd")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it 'is invalid if email is duplicated' do
      user = FactoryBot.create(:user, email: "ryanz201278@yahoo.com.vn")
      another_user = FactoryBot.build(:user, email: "ryanz201278@yahoo.com.vn")
      another_user.valid?
      expect(another_user.errors[:email]).to include("has already been taken")
    end
  end

  describe 'Functions' do
    before do 
      @user = create(:user)
      @post1 = create(:public_post, user_id: @user.id)
      @post2 = create(:private_post, user_id: @user.id)
      @post3 = create(:private_post, user_id: @user.id)
    end

    describe '#private_posts' do
      it 'returns only the private posts' do
        expect(@user.private_posts).to include(@post2, @post3)
        expect(@user.private_posts).not_to include(@post1)
      end
    end

    describe '#public_posts' do
      it 'returns only the public posts' do
        expect(@user.public_posts).to include(@post1)
        expect(@user.public_posts).not_to include(@post2, @post3)
      end
    end
  end
end
