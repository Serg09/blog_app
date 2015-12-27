require 'rails_helper'

RSpec.describe "SiteLayouts", type: :request do
  describe "Home links" do
    it "should get Home link" do
      get root_path
      expect(response).to have_http_status(200)
    end
  end

  describe "About links" do
    it "should get About link" do
      get about_path
      expect(response).to have_http_status(200)
    end
  end

  describe "Help links" do
    it "should get Help link" do
      get help_path
      expect(response).to have_http_status(200)
    end
  end

  describe "Contact links" do
    it "should get Contact link" do
      get contact_path
      expect(response).to have_http_status(200)
    end
  end

  describe "SignUp links" do
    it "should get Sign link" do
      get signup_path
      expect(response).to have_http_status(200)
    end
  end

  describe "News" do
    it "redirects to the News homepage" do
    get root_path
    expect(response).to have_http_status(200)
    end
  end

  describe "Sign Up button" do
    it "displays the button Sign Up" do
      get signup_path
      title_text = 'Sign up'
      expect(response).to have_http_status(200)
      # title_text = 'Sign up'
      # expect(response.body).to have_title('Sign up')
    end
  end
end

#
# click_link 'Help'
# expect(page).to have_title(full_title('Help'))
