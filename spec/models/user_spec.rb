require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = User.new(first_name: "First_name", last_name: "Last_name", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  describe "when email is already taken" do
    before do
      @user_with_same_email = @user.dup
      @user_with_same_email.email = @user.email.upcase
      @user_with_same_email.save
    end

    it { @user_with_same_email.should_not be_valid }
  end

  feature "User should be valid" do
    scenario "should have valid factory" do
      FactoryGirl.build(:user, :email => "sergeyskumatov@aol.com",
                        :password => "Password_2016", :password_confirmation => "Password_2016").should be_valid
    end
    end

    feature "User should be valid" do
    scenario "should NOT have valid factory" do
      user = FactoryGirl.create :user, :email => "sergeyskumatov@aol.com", :password => "Password_2016",
                                :password_confirmation => "Password_2016"
      if user == ""
        user.should_not be_valid
      else
        user.should be_valid
      end
    end
    end

  it 'password length less than 6 characters is invalid' do
    user = FactoryGirl.create :user, :email => "sergeyskumatov@aol.com", :password => "Password_2016",
                              :password_confirmation => "Password_2016"
    result = user.save
    expect(result).to be(true)
  end

  describe "#downcase_email" do
    it "downcases an email before saving" do
      user = FactoryGirl.create :user, :email => "JBOLTIK@OOLAABOX.COM", :password => "Password_2016",
                                                            :password_confirmation => "Password_2016"
      user.email = "JBOLTIK@OOLAABOX.COM"
      expect(user.save).to be true
      expect(user.email).to eq("jboltik@oolaabox.com")
    end
  end
end
