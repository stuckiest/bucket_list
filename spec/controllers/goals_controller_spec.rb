require 'rails_helper'

RSpec.describe GoalsController, type: :controller do
let(:user){FactoryGirl.create(:user)}
let(:goal){FactoryGirl.create(:goal)}
before(:each) do
  sign_in user
  user.goals << goal
end

  describe "GET #new" do
    it "returns http success" do
      get :new, {user_id: user.id}
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST #create" do

    it 'creates a new goal' do
      title = "Title 1"
      create_params = {user_id: user.id, goal: {title: 'Title 1', description: 'Description 1', location: 'Here'} }
      expect(Goal.count).to eq(1)
      post :create, create_params
      expect(Goal.count).to eq(2)
      expect(Goal.last.title).to eq(title)
    end

    # it 'does not add a user without first name' do
    # end

    it 'renders the new template on error' do
      create_params = {user_id: user.id, goal: {title: nil}}
      post :create, create_params
      expect(response).to render_template('new')
    end
    
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
    it 'renders the edit template' do
      get :edit, {user_id: user.id, id: goal.id}
      expect(response).to render_template('edit')
    end
  end

  describe "PUT #update" do

    it 'updates a goal' do
      goal = Goal.create(title: 'Title 1')
      update_params = {id: goal.id, user_id: user.id, goal: {title: 'Title 1'}}
      put :update, update_params
      goal = goal.reload #need to reload with updated attr to check...
      expect(goal.title).to eq('Title 1')
    end

    # it 'does not update without a title' do
    # end

    it 'renders the edit template on error' do
      goal = Goal.create(title: "Title 1")
      update_params = {id: goal.id, user_id: user.id, goal: {title: nil}}
      put :update, update_params
      expect(response).to render_template('edit')
    end

  end

  describe "DELETE #destroy" do
    it "destroys the goal" do
      expect(Goal.count).to eq(1)
      delete :destroy, {id: goal.id, user_id: user.id }
      expect(Goal.count).to eq(0)
    end
  end

end
