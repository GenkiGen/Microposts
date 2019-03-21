require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "Validation" do
    it "is valid with a user, title and content" do
      expect(build(:post)).to be_valid
    end

    it "is invalid if user is not found" do
      post = build(:post, user_id: nil)
      post.valid? 
      expect(post.errors[:user]).to include("must exist")
    end

    it "is invalid without a title" do
      post = build(:post, title: nil)
      post.valid? 
      expect(post.errors[:title]).to include("can't be blank")
    end

    it "is invalid without content" do
      post = build(:post, content: nil)
      post.valid?
      expect(post.errors[:content]).to include("can't be blank")
    end
  end

  describe "Functions" do
    it "sets is_private to true" do
      post = build(:public_post) 
      post.toggle_private(true)
      expect(post).to be_private
    end
    
    it "sets is_private to false" do
      post = build(:private_post)
      post.toggle_private(false)
      expect(post).not_to be_private
    end
  end

end
