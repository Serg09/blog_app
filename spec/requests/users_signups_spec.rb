require 'rails_helper'

RSpec.describe "UsersSignups", type: :request do
  describe "GET /users_signups" do
    it "works! (SignUP test)" do
      get signup_path
      # expect(response).to have_http_status(200)
      post users_path, user: { first_name:  "",
                               last_name: " ",
                               email: "user@invalid",
                               password:              "foo",
                               password_confirmation: "bar" }
    end


    # scenario 'User sign up' do
    #   get root_path
    #   click_link 'Sign Up now!'
    #   fill_in 'user[first_name]', with: 'Sergey'
    #   fill_in 'user[last_name]', with: 'Skumatov'
    #   fill_in 'user[email]', with: 'newagent@example.com'
    #   fill_in 'user[password]', with: 'newpassword'
    #   fill_in 'user[password_confirmation]', with: 'newpassword'
    #   click_button 'Create my account'
    #   expect(page).to have_content "Missing Template"
    # end

    describe "GET #index" do
      it "show a list of all users" do
        total = User.all.count
        get signup_path
        expect(User.all.count).to eq(0)
      end
    end

  end
end
