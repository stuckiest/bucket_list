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
    # it "returns http success" do
    #   get :edit, {user_id: user.id, id: goal.id}
    #   expect(response).to have_http_status(:success)
    # end
    it 'renders the edit template' do
      get :edit, { :user_id => @user.id  }
      expect(response).to render_template('edit')
    end
  end

  describe "GET #new" do
    # it "returns http success" do
    #   get :new, {user_id: user.id}
    #   expect(response).to have_http_status(:success)
    # end
  end


  describe "POST #create" do
    it 'creates a new goal' do
      title = "Title 1"
      create_params = {goal: {title: 'Title 1', description: 'Description 1', location: 'Here'}}
      expect(Goal.count).to eq(0)
      post :create, create_params
      expect(Goal.count).to eq(1)
      expect(Goal.last.title).to eq(title)
    end

    # it 'does not add a user without first name' do
    #   create_params = {person: title: 'Bond', age: 28}}
    #   expect(Person.count).to eq(0)
    #   post :create, create_params
    #   expect(Person.count).to eq(0)
    # end

    # it 'renders the new template on error' do
    #   create_params = {person: title: 'Bond', age: 28}}
    #   post :create, create_params
    #   expect(response).to render_template('new')
    # end
  end

  # describe "DELETE #destroy" do
  #   it "destroys the goal" do
  #     goal = Goal.create(title: 'Title 1')
  #     expect(Goal.count).to eq(1)
  #     delete :destroy, {id: goal.id}
  #     expect(Goal.count).to eq(0)
  #   end
  # end
  # describe '#DELETE destroy' do
  #   it 'deletes a goal' do
  #     @user = FactoryGirl.create(:user)
  #     goal = FactoryGirl.create(:goal, user_id: @user.id)
  #     # Test if the action really deletes a follow.
  #     expect{delete :destroy, id: goal.id, user_id: @user.id}.
  #     to change{@article.goals.count}.by(-1)
  #   end
  # end

end
