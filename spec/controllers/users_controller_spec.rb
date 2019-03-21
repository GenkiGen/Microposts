require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe "GET #show" do
    it "renders user's page" do
      user = create(:user)
      get :show, params: { id: user }
      expect(assigns(:user)).to eq(user)
    end
  end
end
