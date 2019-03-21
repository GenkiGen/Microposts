require 'rails_helper'

RSpec.describe StaticsController, type: :controller do
  describe "GET #home" do
    it "renders home page" do
      get :home
      expect(response).to render_template :home
    end
  end
end
