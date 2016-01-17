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


    # describe "Sessions", :type => :request do
    #
    #   let(:company) { FactoryGirl.create(:company) }
    #   let(:user) { FactoryGirl.create(:admin, company_id: company.id ) }
    #
    #   describe "login page" do
    #     it "signs me in" do
    #       visit '/users/sign_in'
    #       within("#new_user") do
    #         fill_in 'Email', :with => user.email
    #         fill_in 'Password', :with => user.password
    #       end
    #       click_button 'Sign in'
    #       expect(page).to have_content 'Agenda'
    #     end
    #   end
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
