require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #show" do
    it "renders user's page" do
      user = create(:user)
      get :show, params: { id: user }
      expect(assigns(:user)).to eq(user)
    end

    it "renders a list of user's post" do
      user = create(:user_with_posts)
      get :show, params: { id: user }
      expect(assigns(:posts)).to match_array(user.posts)
    end
  end
end
