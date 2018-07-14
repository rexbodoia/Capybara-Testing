require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'GET #new' do
    it 'renders the new user\'s template' do
      get :new
      expect(response).to render_template(:new)
    end
  end
  
  
  describe 'POST #create' do
    user = User.create(username: 'harry_potter', email: 'harry_potter@hogwarts.io', password: 'abcdef')
    context 'with valid params' do
      
      it "validates the presence of the user's username" do
        expect(user.username).to_not be(nil)
      end
      
      it "validates the presence of the user's email" do
        expect(user.email).to_not be(nil)
      end
      
      it "validates the presence of the user's password" do
        expect(user.password).to_not be(nil)
      end
        
      it "validates that the password is at least 6 characters long" do
        expect(user.password.length).to be > 5
      end
    end
    context "with valid params" do
      it "redirects user to render show" do
        expect(response).to redirect_to(user_url(user))
      end
    end
  end
end

