require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(first_name: "Sergey", last_name: "Skumatov", email: "user@example.com",
                     password: "Password_2016", password_confirmation: "Password_2016")
  end

  test "should be valid" do
    assert @micropost.valid?
  end

  test "user id should be present" do
    @micropost.user_id = nil
    assert_not @micropost.valid?
  end

    test "authenticated? should return false for a user with nil digest" do
      assert_not @user.authenticated?(:remember, '')  end

  test "associated microposts should be destroyed" do
    @user.save
    @user.microposts.create!(content: "Lorem ipsum")
    assert_difference 'Micropost.count', -1 do
      @user.destroy
    end

    describe "micropost associations" do

      before { @user.save }
      let!(:older_micropost) do
        FactoryGirl.create(:micropost, user: @user, created_at: 1.day.ago)
      end
      let!(:newer_micropost) do
        FactoryGirl.create(:micropost, user: @user, created_at: 1.hour.ago)
      end

      it "should have the right microposts in the right order" do
        expect(@user.microposts.to_a).to eq [newer_micropost, older_micropost]
      end
    end
  end
  test "order should be most recent first" do
    assert_equal microposts(:most_recent), Micropost.first
  end
end
