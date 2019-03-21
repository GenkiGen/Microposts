require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe "POST #create" do
    before(:each) do
      @user = create(:user)
    end

    context "when data is valid" do
      before(:each) do
        @post = attributes_for(:post)
      end

      it "add posts to database" do
        expect {
          post :create, params: { user_id: @user.id, post: @post }
        }.to change(Post, :count).by(1)
      end


      it "redirect to user's profile" do
        post :create, params: { user_id: @user.id, post: @post }
        expect(response).to redirect_to @user
      end
    end

    context "when data is invalid" do
      before(:each) do
        @post = attributes_for(:invalid_post)
      end

      it "does not add to database" do
        expect {
          post :create, params: { user_id: @user.id, post: @post }
        }.to change(Post, :count).by(0)
      end

      it "redirect to user's profile page" do
        post :create, params: { user_id: @user.id, post: @post }
        expect(response).to redirect_to @user
      end
    end
  end
end
