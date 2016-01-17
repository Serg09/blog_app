require 'rails_helper'
require 'capybara/rails'
require 'capybara/rspec'
include Capybara::DSL

RSpec.describe "UsersLogins", type: :request do
  describe "GET /users_logins" do
  #   it "works! (now write some real specs)" do
  #     get users_logins_path
  #     expect(response).to have_http_status(200)
  #   end
  # end

     it "displays the user's username after successful login" do
        # user = FactoryGirl.create(:user, :email => "sergeyskumatov@aol.com", :password => "Password_2016")
        # user = User.create(:email => "sergeyskumatov@aol.com", :password => "Password_2016")
        # visit "/login"
        get sessions_new_path
        # fill_in "user_email", :with => "sergeyskumatov@aol.com"
        fill_in 'Email', :with => "sergeyskumatov@aol.com"
        fill_in 'Password', :with => "Password_2016"
        click_button "Log in"

        # expect(page).to have_selector("Welcome back Sergey Skumatov")
        expect(page).to have_content('Welcome back Sergey Skumatov')
     end
     end
end
