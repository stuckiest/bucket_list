require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
let(:user){FactoryGirl.create(:user)}
let(:goal){FactoryGirl.create(:goal)}
before(:each) do
  sign_in user
  user.goals << goal
end

  describe "GET #show" do
    it "returns http success" do
      get :show, {user_id: user.id, id: goal.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit, {user_id: user.id, id: goal.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

end
