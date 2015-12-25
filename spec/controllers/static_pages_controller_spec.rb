require 'rails_helper'
require 'nokogiri'
require "support/render_views"

RSpec.describe StaticPagesController, type: :controller do

  describe "Home page" do
    it "returns http success" do
      get :home
      expect(response).to have_http_status(:success)
    end

    it "should have the title 'Blog App'" do
      get :home
      title_text = 'Home Blog App'
      expect(response.body).to have_title('Blog App')
    end
  end

  describe "Help page" do
    it "returns http success" do
      get :help
      expect(response).to have_http_status(:success)
    end

    it "should have the title 'Home Blog App'" do
      get :help
      title_text = 'Help Blog App'
      expect(response.body).to have_title('Help Blog App')
    end
  end

  describe "About page" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
    end

    it "should have the title 'Home Blog App'" do
      get :about
      title_text = 'About Blog App'
      expect(response.body).to have_title('About Blog App')
    end
  end

  describe "Contact page" do
    it "returns http success" do
      get :contact
      expect(response).to have_http_status(:success)
    end

    it "should have the title 'Home Blog App'" do
      get :contact
      title_text = 'Contact Blog App'
      expect(response.body).to have_title('Contact Blog App')
    end
  end
end
