require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user){FactoryGirl.create(:user)}
  # let(:goal){FactoryGirl.create(:goal)}
  before(:each) do
    sign_in(user)
    # user.goals << goal
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show, id: user.id
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #profile" do
    it "returns http success" do
      get :profile, id: user.id
      expect(response).to have_http_status(:success)
    end
  end

  # describe "user #params" do
  #   it "permits user params" do
  #     first_name = "Test"
  #     create_params = {user: {first_name: 'Test', last_name: 'Bond'}}
  #     post :profile, create_params
  #     expect(Person.last.first_name).to eq(first_name)
  #   end
  # end

  # not sure if below are adding to coverage or just retesting things
  it "should have a current_user" do
    expect(subject.current_user).to_not be_nil
  end

  it "should get index" do
    get 'index'
    expect(response).to be_success
  end

end
