require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #show" do
    before do
      @user = create(:user)
      @user_with_post = create(:user_with_posts)
    end
    it "renders user's page" do
      get :show, params: { id: @user }
      expect(assigns(:user)).to eq(@user)
    end

    it "renders a list of user's post" do
      get :show, params: { id: @user_with_post }
      expect(assigns(:posts)).to match_array(@user_with_post.public_posts)
    end

    it 'render only public posts' do
      post1 = create(:private_post, user_id: @user.id)
      post2 = create(:public_post, user_id: @user.id)
      post3 = create(:private_post, user_id: @user.id)
      post4 = create(:public_post, user_id: @user.id)

      get :show, params: { id: @user }
      expect(assigns(:posts)).to include(post2, post4)
      expect(assigns(:posts)).not_to include(post1, post3)
    end
  end
end
